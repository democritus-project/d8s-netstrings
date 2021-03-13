#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_netstrings/ tests/

black democritus_netstrings/ tests/

mypy democritus_netstrings/ tests/

pylint --fail-under 9 democritus_netstrings/*.py

flake8 democritus_netstrings/ tests/

bandit -r democritus_netstrings/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_netstrings/ tests/
