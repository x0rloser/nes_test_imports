# nes_test_imports
Tests if NES mini kernel module contains unsupported kernel symbol imports.

This will print out any symbols that the kernel module wants to import, but that are not exported by the NES mini kernel.
If all symbols are supported then nothing will be printed out.

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
This is due to printk being used by default in clovercon, although it is not exported by the kernel.
You will need to remove usage of printk if you want the kernel module to load successfully on the NES mini.
