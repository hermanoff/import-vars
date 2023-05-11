#!/bin/sh

# set environment variables coming from "vars" directory

VARS_DIR="vars"
if [ -d "${VARS_DIR}" ]; then
  for FILE in "${VARS_DIR}"/*; do
    while read -r VAR || [ -n "$VAR" ]; do
      export "${VAR}"
      echo "${VAR}"
    #   echo "Reading $FILE" or echo "Exporting $VAR"
    done <"${FILE}"
  done
fi

# RUN CMD
exec "$@"
