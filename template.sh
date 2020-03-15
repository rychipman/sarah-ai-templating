#!/bin/bash

cat styles.csv \
    | sed -e 's/\r/\n/g' \
    | sed -e '/^,/d' \
    | sed -e '/^$/d' \
    | sed -e 's/,/ /' \
    | sed -e 's/\//_/' \
    | xargs -i'{}' cp template.ai output/{}.ai
