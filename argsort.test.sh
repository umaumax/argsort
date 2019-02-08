#!/usr/bin/env bash

export ARGSORT_OPT_WITH_ARG='+(-O)'

INPUT="input.txt"
OUTPUT="output.txt"
ANSWER="answer.txt"

: >$OUTPUT
cat $INPUT | awk 1 | while IFS= read -r LINE; do
	./argsort $LINE >>$OUTPUT
	echo >>$OUTPUT
done

function cmdcheck() { type >/dev/null 2>&1 "$@"; }
if cmdcheck icdiff; then
	icdiff -U 1 --line-numbers $ANSWER $OUTPUT
else
	diff $ANSWER $OUTPUT
fi
