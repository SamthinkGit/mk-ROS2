#!/bin/sh

# Installing cch
cd ../ThirdParties/cch
make && make test && sudo make install

