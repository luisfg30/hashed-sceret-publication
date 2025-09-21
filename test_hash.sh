#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <secret_word> [expected_hash]"
    exit 1
fi

SECRET="$1"
EXPECTED_HASH="${2:-532eaabd9574880dbf76b9b8cc00832c20a6ec113d682299550d7a6e0f345e25}"

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