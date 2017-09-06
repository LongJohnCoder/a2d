#!/bin/bash

set -e

#make clean
make all

function verify {
    diff "$1.bin" "$1.F1" \
        && echo "$1: files match" \
        || (
        tput setaf 1 # red
        tput blink
        echo "************************************"
        echo "*"
        echo "*   Bad: $1"
        echo "*"
        echo "************************************"
        tput sgr0 # res
        )
}

# Verify original and output match
verify "calculator"
verify "show_text_file"

cat show_image_file.F1 > mount/SHOW.IMAGE.FILE.\$F1 \
    && echo "Updated mounted file"
