# tramp-virtualenv

This is a collection of prototype code for making python.el work better in
Emacs TRAMP buffers.

1. python.el - a replacement for the python.el distributed with Emacs 24
   that makes its python-send-region TRAMP-aware.

1. demo.py - an interactive demo.

1. bootstrap-virtualenv.sh - a Bash script to bootstrap a virtualenv for
   use via Emacs over TRAMP.

1. python.sh - a Bash script to run python in a virtualenv.

1. .dir.locals.el - configuration for Emacs to run python via the Bash
   script wrapper.

1. tramp-dir-locals.el - a hack to make directory local variables work in
   directories opened via TRAMP.
