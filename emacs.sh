# Check if in emacs, change EDITOR setting if so
if [ ! -z ${INSIDE_EMACS+x} ]; then
    export EDITOR=emacsclient
fi
