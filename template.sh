#!/bin/bash

set -o errexit

infile="${1:-styles.csv}"
outdir=output

rm -rf "$outdir"
mkdir -p "$outdir"
mkdir -p "$outdir/ai"
mkdir -p "$outdir/zip"

cat "$infile" \
    | sed -e 's/\r/\n/g' \
    | sed -e '/^,/d' \
    | sed -e '/^$/d' \
    | sed -e 's/,/ /' \
    | sed -e "s/'//" \
    | sed -e 's/\//_/' \
    | xargs -i'{}' cp template.ai "$outdir/ai/{}.ai"

zip "$outdir/zip/styles.zip" "$outdir"/ai/*.ai
