#!/bin/sh
# This script visually compares two PDF documents on a page-by-page basis.

# Print an error message and die.
die() {
  FORMAT="$1"; shift
  printf "$FORMAT\n" "$@" 1>&2
  exit 1
}

# Check if a file exist.
exists() {
  [ -e "$1" ] || die 'File "%s" does not exist.' "$1"
}

# Check that the input files exist.
exists "$1" || exit 1
exists "$2" || exit 1

# Burst the input files into temporary directories.
SOURCE_DIR=`mktemp -d` && trap 'rm -r $SOURCE_DIR' EXIT &&
  pdftk "$1" burst output $SOURCE_DIR/%04d.pdf
DEST_DIR=`mktemp -d` && trap 'rm -r $SOURCE_DIR $DEST_DIR' EXIT &&
  pdftk "$2" burst output $DEST_DIR/%04d.pdf

# Compare the individual pages.
DIFFER=false; PAGES=""
for PAGE in `((cd $SOURCE_DIR && ls *.pdf) && (cd $DEST_DIR && ls *.pdf)) | sort -u`; do
  PAGENUM=`echo ${PAGE%%.pdf} | sed 's/^0*//'`
  if [ -e $SOURCE_DIR/$PAGE -a ! -e $DEST_DIR/$PAGE ]; then
    die 'The document "%s" does not contain page "%d".' "$2" $PAGENUM
  elif [ ! -e $SOURCE_DIR/$PAGE -a -e $DEST_DIR/$PAGE ]; then
    die 'The document "%s" does not contain page "%d".' "$1" $PAGENUM
  else
    if ! comparepdf --compare=appearance --verbose=0 $SOURCE_DIR/$PAGE $DEST_DIR/$PAGE; then
      DIFFER=true
      PAGES="$PAGES, $PAGENUM"
    fi
  fi    
done

# Print out the result.
if $DIFFER; then
  PAGES="$(echo "$PAGES" | tail -c+3)"
  die 'The documents "%s" and "%s" differ in pages %s.' "$1" "$2" "$PAGES"
fi
