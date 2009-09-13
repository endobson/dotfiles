if [ -z "$CSHOOKDIR" ]; then CSHOOKDIR=~/.hooks; export CSHOOKDIR; fi
if [ -f $CSHOOKDIR/sh/base ]; then . $CSHOOKDIR/sh/base; fi
