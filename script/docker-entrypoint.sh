#!/bin/sh

mix escript.build
./resourceguru --in example/morse_test.txt --out example/morse_out.txt
