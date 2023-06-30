---
title: Friday
tags: windows hyper-v nested virtualization
---

In order to run Hyper-V in a Hyper-V machine (e.g. to run WSL2 in a VM rather
than on the host), one needs to enable nested virtualization. First, create
your Hyper-V VM and then, when it is *not running* type the following into your
Powershell console (assuming the VM name is MY_VM):

```
Set-VMProcessor -VMName MY_VM -ExposeVirtualizationExtensions $true
```
