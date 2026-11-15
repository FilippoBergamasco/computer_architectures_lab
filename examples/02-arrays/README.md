# Arrays example

Simple program counting the number of zeros in an array.

The data section contains:

1. `A`: an array of integers (4 bytes) `A`
2. `n` (dword): the number of elements in A  
3. `r` (dword): variable used to store the result

```
.data
A:  .word 0,2,3,0,0,6,7,0,9,10,0,0,0
n:  .dword 13
r:  .dword 0
```

## Version 1 - array access using indices

`arrays_v1.s` shows how to access array elements using
indices.

[Try it in the simulator](https://www.dais.unive.it/~bergamasco/A64Playground/#code=PTAEGEHsFsAcFcAuBTAzqRALZoB29oAjZAJ1EgDNQAvUydAS1w21AEMSS2BPUAQXa4AJqFSJIJNACgQLHJNTwANolBNQANw4M2hJfIB0MsADVtu-XlABjSLkRsm6LDnxFS5Ksn3Rk9xsx8RsagJqSoDHagAIwAXOycPOzW1mjoAO4MWGrCDKmoIQCiAI7wDFr69hA2kELIsSEhoM0toAAeAAygALygABQAZHwA2h0AugCUTa3NbdE9eNMzbQBMC9bwnH6qTHVtS61tAMwLCsqIBy3Gl7NH3R0A3DegFBL9q-cP7SsAPHOgXwA1IDVqAprIZs0AN7PVoMCh9fjDVZjHq9LrgsCQ7G3QHdaJPCGQgC+oCkUmabCEZE6ABp+BT2NT2tF6bhGUpmXN6cjomNGYzoJANO0jvSAMQdAXNIUi1YSro4mayV5kJSQSCwHJZHRKBjUNiISLs5rWODfWlzRmEAwAcxwyDaWVV5KYzok8SulKEIjaABZ6XSLaAADIAZRDoHFa1AIH9CwGfRGKKmzU5ZHSAFYef7UUrmiAswtkyt+abzVmFdaDLgcKqmNZ8y1ZPC+kWAIToiagW2QcQvCQAWgbjKpvrFx1p4vmTdkx26x0B0Sk9dw1ga3t9K0t2+nTdjYA+qyXjLNWvl-3z1ZU2sQqv3LYR3z+827vf7bsQg5djvdJA3TI0gGoBkPuBaHn6CYkIyYg0mKoDIn6eb5rIZC9Mc5K-ogAG4Jq5JSAYQiGmwUh8J6BjpBIIgdLS25ijRNEAGy0gA7LSNEAJy0tEDHsexITML0lRJlMuDkUIlEkCI0RHFI-7NIRknUWSYGqc0QA)

Equivalent C code:

```
x0 = (&A[0])
x1 = n
x2 = current index
x3 = result


x3=0;
for (x2=0; x2<x1 ; ++x2 )
{
    if( A[x2] == 0 )
        x3+=1;
} 
```

## Version 2 - array access using indices

`arrays_v2.s` shows how to access array elements using
pointer arithmetics.

Equivalent C code:

```
x0 = (&A[0])
x1 = n
x2 = x0 + n*sizeof(int)  // pointer to the end of array
x3 = result

for( x3=0; x0<x2; x0+=sizeof(int) )
{
    if( mem[x0] == 0 )
        x3+=1;
} 
```

