#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <secret_word> [expected_hash]"
    exit 1
fi

SECRET="$1"
EXPECTED_HASH="${2:-e2d416889d1016b5d995ad3e584e2c5e0328df3a6caad7ffa5aa306c7ca3f2ad}"

HASHED_SECRET=$(echo -n "$SECRET" | sha256sum | cut -d ' ' -f1)

echo "Secret word: '$SECRET'"
echo "Calculated hash: $HASHED_SECRET"
echo "Expected hash:   $EXPECTED_HASH"

if [ "$HASHED_SECRET" = "$EXPECTED_HASH" ]; then
    echo "OK. Hashes match!"
    exit 0
else
    echo "ERROR. No match"
    exit 1
fi   