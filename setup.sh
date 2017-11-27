#!/bin/bash

echo 'Setting up make-repo...'

bin_path="/usr/local/bin"
working_dir=`pwd`

`chmod +x ./make-repo`

SYMLINK_COMMAND="ln -s ${working_dir}/make-repo ${bin_path}/make-repo"

eval "$SYMLINK_COMMAND"
