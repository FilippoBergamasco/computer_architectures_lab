.global _start  // define a global symbol _start
_start:         // program entry point

    // This program swaps the value of global variables
    // a and b, using registers as additional memory
    // areas to store temporary values. Differently
    // than the C example, the variable c is unnecessary

    adr x0, a               // x0 = &a
    adr x1, b               // x1 = &b

    ldr w2, [x0]            // load the value of a
                            // into w2

    ldr w3, [x1]            // load the value of b
                            // into w3

    str w3, [x0]            // store w3 (the value of b) 
                            // into variable a (pointed by
                            // x0)

    str w2, [x1]            // store w2 (the value of a) 
                            // into variable b (pointed by
                            // x1)

    // now the global variables
    // a and b are swapped

    // Exit with return code 0
    mov x0, #0
    mov x8, #93
    svc #0
         

// Begin of data section
.data
.global a
a: .word 1230
.global b
b: .word -1
