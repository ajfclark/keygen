#!/bin/sh

cd /keygen
make
./bin/serve.py &
