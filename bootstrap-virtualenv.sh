#!/bin/bash

# This assumes that you have virtualenv and virtualenvwrapper.

. $(type -p virtualenvwrapper.sh)
mkvirtualenv tramp-virtualenv
workon tramp-virtualenv
# I should really copy the local emacs*.py* to the remote python site-packages.
cp "$(emacs --batch -q --no-site-file --eval '(message data-directory)' 2>&1)"/emacs*.py* \
    "$(python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()')"
