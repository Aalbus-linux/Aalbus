#!/bin/sh

exec docker run -it -v"$PWD/..":/mnt --rm ngtc-built /bin/sh /mnt/src/ngtc_env.sh

