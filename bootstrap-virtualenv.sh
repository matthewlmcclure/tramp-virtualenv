#!/bin/bash

# This assumes that you have virtualenv, virtualenvwrapper, and pip.

. $(type -p virtualenvwrapper.sh)
workon tramp-virtualenv || mkvirtualenv tramp-virtualenv
pip install emacs
