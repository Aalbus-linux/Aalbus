#!/bin/sh
#
# mkiso.sh - build a hybrid BIOS/UEFI install ISO for Aalbus.
#
# STATUS: UNTESTED DRAFT. Written without being able to run it (the build
# container cannot reach the package mirrors). Run it on a host with pkgsrc,
# check each step, and record results in docs/RESTART-PLAN.md.
#
# Inputs:
#   ROOTFS    directory holding the populated root filesystem
#             (produced by installing the `base` metapackage into a staging dir)
#   KERNEL    kernel image (vmlinuz) to place on the medium
#   INITRD    initramfs image that mounts the squashfs root
#   OUT       output ISO path
#
# Environment:
#   LIMINE_BIOS_CD   path to limine-bios-cd.bin   (required)
#   LIMINE_UEFI_CD   path to limine-uefi-cd.bin   (required)
#   LIMINE_BIN       path to the `limine` tool    (optional; used to make
#                    the image BIOS-bootable from a hybrid MBR)
#   CMDLINE          kernel command line (default: "aalbus.live=1 quiet")
#
# Layout written to the ISO:
#   /live/root.squashfs   the root filesystem, zstd-compressed
#   /boot/vmlinuz         kernel
#   /boot/initramfs.img   initramfs
#   /boot/limine/         bootloader files and limine.conf
#   /EFI/BOOT/            UEFI boot files (inside the limine-uefi-cd.bin image)

set -eu

die() {
	echo "mkiso: $*" >&2
	exit 1
}

usage() {
	echo "usage: $0 ROOTFS KERNEL INITRD OUT" >&2
	exit 2
}

[ $# -eq 4 ] || usage
ROOTFS=$1
KERNEL=$2
INITRD=$3
OUT=$4
CMDLINE=${CMDLINE:-aalbus.live=1 quiet}

[ -d "$ROOTFS" ] || die "rootfs not a directory: $ROOTFS"
[ -f "$KERNEL" ] || die "kernel not found: $KERNEL"
[ -f "$INITRD" ] || die "initramfs not found: $INITRD"
[ -n "${LIMINE_BIOS_CD:-}" ] && [ -f "$LIMINE_BIOS_CD" ] || die "set LIMINE_BIOS_CD"
[ -n "${LIMINE_UEFI_CD:-}" ] && [ -f "$LIMINE_UEFI_CD" ] || die "set LIMINE_UEFI_CD"

for tool in mksquashfs xorriso; do
	command -v "$tool" >/dev/null 2>&1 || die "required tool missing: $tool"
done

WORK=$(mktemp -d "${TMPDIR:-/var/tmp}/mkiso.XXXXXX") || die "mktemp failed"
trap 'rm -rf "$WORK"' EXIT INT TERM

ISO_TREE=$WORK/iso
mkdir -p "$ISO_TREE/live" "$ISO_TREE/boot/limine"

echo "mkiso: building squashfs root"
# -one-file-system keeps us from pulling in mounts (e.g. /proc) under ROOTFS.
mksquashfs "$ROOTFS" "$ISO_TREE/live/root.squashfs" \
	-comp zstd -noappend -one-file-system -no-progress

echo "mkiso: copying kernel and initramfs"
cp "$KERNEL" "$ISO_TREE/boot/vmlinuz"
cp "$INITRD" "$ISO_TREE/boot/initramfs.img"

echo "mkiso: writing bootloader configuration"
# Limine configuration syntax, as used by Limine 5.x and later. Check it
# against the Limine version actually packaged.
cat > "$ISO_TREE/boot/limine/limine.conf" <<EOF
timeout: 5

/Aalbus
    protocol: linux
    path: boot():/boot/vmlinuz
    module_path: boot():/boot/initramfs.img
    cmdline: $CMDLINE
EOF

cp "$LIMINE_BIOS_CD" "$ISO_TREE/boot/limine/limine-bios-cd.bin"
cp "$LIMINE_UEFI_CD" "$ISO_TREE/boot/limine/limine-uefi-cd.bin"

echo "mkiso: creating ISO $OUT"
# Follows the layout Limine documents for hybrid BIOS/UEFI images.
xorriso -as mkisofs \
	-b boot/limine/limine-bios-cd.bin \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	-eltorito-alt-boot \
	-e boot/limine/limine-uefi-cd.bin \
	-no-emul-boot \
	-isohybrid-gpt-basdat \
	-V AALBUS \
	-o "$OUT" \
	"$ISO_TREE"

if [ -n "${LIMINE_BIN:-}" ]; then
	echo "mkiso: installing BIOS hybrid MBR"
	"$LIMINE_BIN" bios-install "$OUT"
else
	echo "mkiso: LIMINE_BIN not set, skipping bios-install (image is UEFI-only)"
fi

echo "mkiso: done: $OUT"
