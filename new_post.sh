#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TITLE="${1}"

DATE=$(date +%Y-%m-%d)
TITLE="${TITLE:-$(date +%A)}"
FILENAME="${SCRIPT_DIR}/_posts/${DATE}-${TITLE}.md"

touch "${FILENAME}"

TEMPLATE=$(mktemp)
cat <<EOF >"${TEMPLATE}"
---
title: ${TITLE}
tags: none
---

EOF

vim -c "read ${TEMPLATE}" "${FILENAME}"
