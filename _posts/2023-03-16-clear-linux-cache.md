---
title: Clear Linux Cache
tags: linux cache
---

For benchmarking e.g. the performance of the SquashFS file system it might be
necessary to drop caches:

```
# free pagecache
sync; echo 1 > /proc/sys/vm/drop_caches
# free reclaimable slab objects (includes dentries and inodes):
sync; echo 2 > /proc/sys/vm/drop_caches
# free slab objects and pagecache:
sync; echo 3 > /proc/sys/vm/drop_caches
```

Also see https://www.kernel.org/doc/Documentation/sysctl/vm.txt
