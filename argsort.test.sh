#!/usr/bin/env bash

export OPT_WITH_ARG='+(-O)'

INPUT="input.txt"
OUTPUT="output.txt"
ANSWER="answer.txt"

: >$OUTPUT
cat $INPUT | awk 1 | while IFS= read -r LINE; do
	./argsort $LINE >>$OUTPUT
	echo >>$OUTPUT
done

icdiff -U 1 --line-numbers $ANSWER $OUTPUT
