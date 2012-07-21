# tramp-virtualenv

This is a collection of prototype code and configuration for coding
Python remotely using Emacs TRAMP buffers and python.el.

## Assumptions

Use Emacs version >= GNU Emacs 24.1.50.1 (x86_64-apple-darwin, NS
apple-appkit-1038.36) of 2012-06-10 on bob.porkrind.org - Bazaar
revision 108545.

Michael Albinus changed python.el so that it creates temporary files on
the remote server for python-send-region within a few days before
2012-06-10.

## Contents

1. `tramp-virtualenv.el` - configuration to teach Emacs and TRAMP to
   change to a virtualenv given in a remote `.dir-locals.el` file.

1. `example.dir.locals.el` - example directory local variable
   configuration for Emacs to run python from a remote virtualenv.

1. `demo.py` - an interactive demo.

1. `bootstrap-virtualenv.sh` - a Bash script to bootstrap a virtualenv
   for use via Emacs over TRAMP.
