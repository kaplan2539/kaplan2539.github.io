---
title: BASH function to create backup of files
tags: bash
---

```
function backup()
{
    A=$(ls "${1}".bak* |tail -n1)
    B=${A##*.bak}
    B=$((B + 1))
    cp "${1}" "${1}.bak$(printf '%03d' ${B})"
}
```

