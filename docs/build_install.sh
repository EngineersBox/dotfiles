#!/usr/bin/env bash

set -ex

asciidoctor -b manpage -o local_tools.1 local_tools.adoc
mv local_tools.1 "$HOME/.local/share/man/man1/."
