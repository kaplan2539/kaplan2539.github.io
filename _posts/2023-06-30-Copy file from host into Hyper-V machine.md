---
title: Copy file from host into Hyper-V machine
tags: windows hyper-v copy file
---

To copy a file from you host machine into a running Hyper-V Windows guest machine,
one first hast to enable the Guest Service Interface, then one can use `Copy-VMFile`:

```
Enable-VMIntegrationService -VMName MY_VM -Name ‘Guest Service Interface’
Copy-VMFile MY_VM -SourcePath “$env:userprofile\test.zip” -DestinationPath “C:\TEMP\test.ziop” -CreateFullPath -FileSource Host
```
