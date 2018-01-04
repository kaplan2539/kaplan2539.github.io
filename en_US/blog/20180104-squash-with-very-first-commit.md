###### 2018-01-04

Squash within very first git commit
-----------------------------------

To squash the last git commit into the second last is very easy:
```
git rebase -i HEAD^^
```

and then squash your last commit `Y` into the second last `X`:
```
pick sha1 X
squash sha1 Y
```

But what if you wanto to squash something within the very first (initial commit)?
Assuming you're on the `master` branch, try this:
```
git rebase -i --root master
```

Now one just do as above:
```
pick sha1 A
squash sha1 B
```

