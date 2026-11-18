# Aalbus restart plan

Status of the project as of the restart, what was changed in this pass, what
is blocked, and what comes next.

## 1. State when the project stalled

- Last real activity: July 2021. The `main` and `claude/loving-archimedes-udprqq`
  branches are identical.
- The base system exists as a set of CVS-era and pkgsrc-style packages under
  `dest/usr/pkgsrc/Aalbus/` (49 packages). Versions are pinned to 2020–2021
  releases, for example musl 1.2.2, s6 2.10.0.0, skalibs 2.10.0.1,
  execline 2.7.0.0, e2fsprogs 1.45.4, shadow 4.8.1, mdevd 0.1.3.0.
- Three packages are unpinned VCS snapshots: `ubase-git`, `libdrpc-git`,
  `elftoolchain-svn-0`.
- The bootloader was unresolved. `refind` needs `gnu-efi`, and syslinux
  failed to build.
- There was no installer, no live media, and no init-script layer beyond the
  s6 packages themselves.

## 2. Constraints found in this pass

- The build container can reach GitHub (only repositories in this session's
  scope), PyPI and npm. It cannot reach NetBSD, OpenBSD, skarnet.org,
  musl.libc.org, kernel.org or Alpine mirrors, so pkgsrc bootstrap, source
  tarballs and checksums cannot be produced here.
- Consequence: nothing in this pass was built or boot-tested. Changes are
  limited to packaging metadata, documentation, the website and an install-media
  script that is written but not run.
- Upstream release versions could not be checked from here. No version number
  or `distinfo` checksum has been changed, because I cannot verify the new
  values.

## 3. Changes in this pass

| Path | What |
| --- | --- |
| `dest/usr/pkgsrc/Aalbus/base/` | New `base` metapackage: GNU-free runtime, boot, networking, pkgin |
| `dest/usr/pkgsrc/Aalbus/base-devel/` | New `base-devel` metapackage: compiler, make/configure tooling, parser generators |
| `src/mkiso/mkiso.sh` | Install-media build script (untested, see section 6) |
| `website/` | Static project website, ready to publish as its own repository |
| `docs/RESTART-PLAN.md` | This file |

Both metapackages use placeholder `MAINTAINER` values, and several dependency
paths point to upstream pkgsrc categories that still need checking (see
section 5).

## 4. Decisions made (change them if you disagree)

1. **Base = runtime, base-devel = build.** Matches your design. `base`
   contains no compiler. `base-devel` depends on `base`.
2. **GNU-free means "no GNU projects as tools or libraries".** It does not mean
   "no GPL code". The Linux kernel, e2fsprogs and kmod are GPL, but they are
   not GNU userland. The `base` list avoids GNU tools: no bash, coreutils,
   readline, gettext, autotools or gmake. `gettext-tiny` replaces gettext, and
   `kati` provides `gmake`.
3. **Shell:** `mksh` (static, already in the tree). `/bin/sh` only.
4. **Init:** s6 + s6-rc + s6-linux-init (existing packages). dinit and the
   systemd compatibility layer are deliberately out of scope for now.
5. **Package manager:** pkgsrc binary side, `pkgin` + `pkg_install`, from
   upstream pkgsrc.

## 5. Things that still need verifying (cannot be checked from this container)

- Upstream pkgsrc categories used by `base` and `base-devel` that are not in
  this repo. Check each path against the pkgsrc tree before the first build:
  `lang/clang`, `devel/bmake`, `devel/kati`, `devel/mk-configure`,
  `devel/pkgconf`, `devel/slibtool`, `devel/samurai`, `devel/cmake`,
  `devel/byacc`, `devel/flex`, `devel/git-base`, `lang/perl5`,
  `textproc/mandoc`, `devel/libedit`, `devel/libffi`, `devel/pkgconf`,
  `filesystems/dosfstools`, `pkgtools/pkgin`, `pkgtools/pkg_install`.
- Whether the Aalbus `llvm-project` fork is packaged as `lang/clang` or as a
  local package. The README says LLVM is "migrated to pkgsrc", but there is no
  directory for it under `dest/usr/pkgsrc/Aalbus/`.
- `curl` and `openssl` are listed in `base` because they are Aalbus forks in
  the org. Confirm that the forks are the intended ones.

## 6. Install media

`src/mkiso/mkiso.sh` is a first draft. It takes a populated root filesystem
and produces a hybrid BIOS/UEFI ISO: squashfs root, EFI system partition, and
xorriso. It has not been run. It needs:

- a root filesystem produced by installing `base` into a staging directory
  (with `pkgin` or `pkg_add`, on a build host with pkgsrc),
- an initramfs. This is the largest open item. **dracut is bash-based, so
  using it for the initramfs conflicts with the GNU-free goal.** The planned
  alternative is a small mksh + mdevd initramfs that mounts the squashfs and
  uses overlayfs for writes,
- a bootloader image (see 7).

## 7. Bootloader options

| Option | Pros | Cons |
| --- | --- | --- |
| **Limine** (BSD-2-Clause) | BIOS and UEFI, small, actively maintained, no GNU dependency | Not yet packaged here; needs a pkgsrc package |
| **refind** (existing) | Already packaged | Depends on `gnu-efi` and a GNU-style build |
| **efi-clang + own stub** (existing package) | Fully native, LLVM only | Most work; a stub only does what we write |

Recommendation: Limine for the install media (it can be checked against
packaging at the start of the next session), with efi-clang kept as the
long-term native route. Drop refind from `base` unless gnu-efi is replaced.

## 8. Package update process (to run on a build host)

1. For each package in `dest/usr/pkgsrc/Aalbus/`, find the latest upstream
   release, using the upstream release page or tags.
2. Update `DISTNAME`/`VERSION`, `distinfo` (checksums) and any patches that
   no longer apply. Patches that were already merged upstream should be dropped.
3. Pin VCS snapshots to a commit hash, not a branch.
4. Build with `pkgsrc` on a real host. Record failures in this file.

The current pins are listed in section 1. Use them as the starting checklist.

## 9. Recommended order of work

1. **Build host:** a real Linux machine (or VM) with network access to
   NetBSD mirrors, to run the pkgsrc bootstrap. Everything else depends on it.
2. Verify and build the packages in `base`. Fix patches as needed.
3. Build `base-devel` and check that it can rebuild a few pkgsrc packages from
   source, e.g. `devel/bmake` and `textproc/mandoc`.
4. Produce a root filesystem from `base`, then build the install media.
5. Boot the image in QEMU with OVMF (UEFI) and SeaBIOS (BIOS). Write the
   installer afterwards.
6. Publish the first binary repository (see section 10).

## 10. Hosting binary packages: ideas

pkgsrc binary repositories are just a directory tree of `.tgz` packages plus
`pkg_summary` indexes. That makes hosting cheap and easy to mirror.

1. **Static HTTPS on object storage with a CDN** (for example Cloudflare R2,
   Backblaze B2 or Amazon S3 behind CloudFront). Cheap, predictable, and the
   easiest to script with `rsync` or `aws s3 sync` from a build host. Good
   default for the first release.
2. **GitHub Releases** for the first few months. Free, versioned, and visible
   to the community. Individual asset size is capped at 2 GB, and it is not a
   CDN, so treat it as a fallback or archive, not the main repository.
3. **Volunteer mirrors, as NetBSD and FreeBSD do.** Publish `rsync://` and
   HTTP endpoints so anyone can run a mirror. This fits the "decentralized,
   bus-factor-proof" goal best. Put a mirror list on the website.
4. **Self-hosted on a VPS** (any cheap Linux box with nginx), with the build
   host pushing via rsync. Keeps control, but needs ongoing maintenance.
5. **Forgejo/Codeberg Pages or a Forgejo package registry** as an open-source
   alternative to GitHub.
6. **IPFS or torrents** as optional redundancy for the image and the big
   packages. Not a primary source.

Suggested combination: (1) as the primary, (3) as a design goal from day one
(every repository published with the same layout, so anyone can mirror),
(2) for release-tagged artifacts and the install images.

Signing: sign the `pkg_summary` indexes and the install images with a project
key. Publish the key fingerprint on the website and in the repository itself,
so a mirror cannot be trusted by default unless its users check the key.

## 11. Website and community

- A static site lives in `website/`. It has no build step and can be published
  as its own repository (for example `Aalbus-linux/aalbus.github.io`) with
  GitHub Pages. Copy the directory into a new repository, or split it out with
  `git subtree split --prefix=website`.
- Community channels already listed in the README: GitHub issues, Reddit
  (`r/aalbuslinux`), and Discord.
