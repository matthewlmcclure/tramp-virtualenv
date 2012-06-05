#! /bin/bash

. $(type -p virtualenvwrapper.sh)
workon tramp-virtualenv
python "$@"
