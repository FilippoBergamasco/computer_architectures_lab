# variables / variables_c

Simple programs demonstrating how variables are managed in C and assembly.

- `variables.s` – temporary register version. [Test it in the simulator](https://www.dais.unive.it/~bergamasco/A64Playground/#code=PTAEBUAsEsGdQA4CcD2BzJBDAtqWB3TBeAF0gFNQA3TAGwFdz4UAzUNWlAIzusyWiYutJgCgQoTJIB2AE1BcANKHqxo0tKCTk0cEuSTxMR2bOgloKab2zlsKJAE9xYfuWOgSKPF+2e7CA78jnwMTAB0oAAi0CwsBuTSJLTOEmSY0p4UoADCoOQAHjgIIspklDQCQiKgAMagcCrS0uS1TLDBoqKYskigBQAMylKgo2Pj4xKDoAC8oABkmN29-QCMylwTW5NgBauzC1xdtCv4AEzKANqDALrbExKcPVkVdIygrJKi9z-bEupeUDnY6nADMVz2d1+oEeKGe5VC70+R2hqJhYAB3nwoK6sBIfWxEIGUN+EjxDko2NAAAoETQwh82FwAJSgb5o0kYpLeSqCYSUKTUwIA8jyLjODmc-oDZm4-FAi6ga6rEk-Mm+SlnGl0t6UT6YVnsyV-LmA3nVSibIUoEViiXGk1rWVGrYuUAAIR06kZoFkmBIUlgrQsVlE4T9Ae6AC5QOF8A55KszqCBqIuDG4wnQABaVZAA)
- `variables_stack.s` – stack version. [Test it in the simulator](https://www.dais.unive.it/~bergamasco/A64Playground/#code=PTAEBUAsEsGdQA4CcD2BzJBDAtqWB3TBeAF0gFNQA3TAGwFdKUAzUNWlAIzusyWkyda5WACgQoTJIB2AE1CcANKHqxo0tKDKVYJTAGMA1pPiZpk2bOgloKaT2zlsKJAE9xYPuUwA6UAGV1fUptJEovRGFpEldQFlAwtDgSciR4dS0KD1AAQQAlAFkANgAWSSR9GBT9Enow5XxKfRR6WnlITCpKVXJ5KUTk1Oz1XW95eO08PSM-AAkURq6kZTI4RFQMHFA1tWxoWj5skhRQfA6SSVAAYVBm7AR91NAACnxrSFBpE5QEGz2AL0wNjssAAlKcWm1QNlkChZPRgj5RMjMLIkKAAB4ABmUUlA+IJhMJEmxoAAvKAAGSYUSo9EYgCMyk4RNZxLAjPJVM4yNEbXR+AATMoANrYgC6bKJEg4qMylBoDCYrBpUrVbIk6mOp0FyN0AuFoBF-gACsoAMQAWgZRXFAEJpWAEKoPlItSdJroDIZkfydaLGZL1aAZSg5ZNFYw4qwecG4yGwO6dXqSAaA1ig+qJLoXJQhS8I3Qo-FOODRPHg5roicaPxBMJLs8ECgtb0FO4K1mOVjQb60f6jabxRabRqnT9LsxULhPdMfaJ9QOxQzM2rs8cwjqCxReEro5Iy5214nq7w60JKCymy3om3OB2j2PMQze8iJAAhchJczxWRAqSwOQNS2NIog+H+ei0gAXKAPj4C48gMoKADMWKiJwMFwQhoDWkAA)

Run ```make``` to compile everything.

## Things to notice

In ```variables.assembled.dump```

- Lables have been removed from ```ADR``` instructons;
- ```.data``` segment contains 3 (little-endian) integers.

In ```variables.assembled.readelf.dump```

- Relocation information are stored in the ```.rela.text``` section. ```Offset``` indicate
the address of instructions that needs to be updated when linking;
- symbol table ```.symtab``` contains the 2 global variables ```a``` and ```b```.


In ```variables.linked.dump```

- The ```ADR``` instructions now refer to the correct (absolute) addresses of
  global variables.


In ```variables.linked.readelf.dump```

- ```.rela.text``` is now empty because, after linking, all the addresses are known;
- symbol table contain references of the global symbols;
- ELF type is now "executable file".


In ```variables_c.assembled.dump```

- the compiler loads and store global variables with a combination of
  ```ADRP``` and ```ADD x0,x0,#0``` instructions;
- accessing the variable ```c``` involve loading and storing from the stack
  pointer ```SP```.

In ```variables_c.linked.readelf.dump```

- the symbol table ```.symtab``` contains global symbols ```a``` and ```b```
  but not ```c``` (which is in the stack instead);
- there are no relocation information as well.


## How to debug

Run ```gdb --command=gdbinit ./variables``` for the assembly-based program and
```gdb --command=gdbinit_c ./variables_c``` for the c-based program.
