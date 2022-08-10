#!/bin/bash

make 

if [[ "$OSTYPE" =~ ^darwin ]]; then
    sed -i '' 's@PWD@'"$PWD"'@' example.conf
elif [[ "$OSTYPE" =~ ^linux ]]; then
    sed -i 's@PWD@'"$PWD"'@' example.conf
fi