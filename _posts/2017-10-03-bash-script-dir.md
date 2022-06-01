---
title: Path to bash script test
tags: bash
---

This is the first line in almost all of the bash scripts I'm writing:
```bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```

