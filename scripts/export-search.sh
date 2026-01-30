#!/bin/bash
# Usage: ./export.sh /data/backup/tycho.struct.json '{"corpus": "...", "status": {"$ne": "IGNORE"}, "document": "..."}'

# Check arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <outputFile> <query>"
    exit 1
fi

container="$1"
database="$2"
query="$3"
outputFile="$4"

docker exec -t "${container}" mongoexport \
  --db="${database}" \
  --collection="tycho.struct" \
  --out="$outputFile" \
  --jsonArray \
  --query "$query"
