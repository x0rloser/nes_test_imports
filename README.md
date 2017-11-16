# nes_test_imports
Tests if S/NES mini kernel module use unsupported imports

This will print out any symbols that the kernel module wants to import, but that are not exported by the NES mini kernel.
If all symbols are supported then nothing wil be printed out.

Usage is just:
```
nes_test_imports.sh <kernel module filename>
```

So for example:
```
nes_test_imports.sh clovercon.ko
```

This might print out:
```
printk
```
Due to printk being used by default in clovercon, although not being exported by the kernel.
You will need to remove usage of printk if you want the kernel module to load successfully on the NES mini.
