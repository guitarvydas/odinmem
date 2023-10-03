package zd

import "core:strings"
import "core:mem"
import "core:os"
import "core:fmt"

Datum :: struct { data : any }

main :: proc () {
    block1 ()
    block2 ()
    // block3 ()
    // block4 ()
    // block5 ()
}

block1 :: proc (){
    cs := "TARVY"
    fmt.printf ("%v\n", typeid_of (type_of (cs)))
    fmt.printf ("%v\n", raw_data (cs))
    fmt.printf ("%v\n", len (cs))
    fmt.printf ("%v\n", &cs)
}

block2 :: proc (){
    cs := "TARVY"
    fmt.printf ("\nBLOCK 2\n")
    clonedcs := strings.clone (cs)
    fmt.printf ("%v\n", typeid_of (type_of (clonedcs)))
    fmt.printf ("%v\n", raw_data (clonedcs))
    fmt.printf ("%v\n", len (clonedcs))
    fmt.printf ("%v\n", &clonedcs)
}

block3 :: proc (){
    cs := "TARVY"
    clonedcs := strings.clone (cs)
    // BLOCK 3
    fmt.printf ("\nBLOCK 3\n")
    pany : ^any = new (any)
    pany^ = clonedcs
    fmt.printf ("%v\n", typeid_of (type_of (pany.(string))))
    fmt.printf ("%v\n", raw_data (pany.(string)))
    fmt.printf ("%v\n", len (pany.(string)))
    fmt.printf ("0x%p\n", &pany)
}
    
block4 :: proc (){
    cs := "TARVY"
    // BLOCK 4
    fmt.printf ("\nBLOCK 4\n")
    pdatum : ^Datum = new (Datum)
    pdatum.data = strings.clone (cs)
    fmt.printf ("%v\n", typeid_of (type_of (pdatum.data.(string))))
    fmt.printf ("%v\n", raw_data (pdatum.data.(string)))
    fmt.printf ("%v\n", len (pdatum.data.(string)))
    fmt.printf ("0x%p\n", &pdatum)
}
    
block5 :: proc (){
    // BLOCK 5
    cs := "TARVY"
    fmt.printf ("\nBLOCK 5\n")
    pdatum5 := f (cs)
    fmt.printf ("%v\n", typeid_of (type_of (pdatum5.data.(string))))
    fmt.printf ("%v\n", raw_data (pdatum5.data.(string)))
    fmt.printf ("%v\n", len (pdatum5.data.(string)))
    fmt.printf ("0x%p\n", &pdatum5)
}

f :: proc (cs :string) -> ^Datum {
    pdatum5 : ^Datum = new (Datum)
    pdatum5.data = strings.clone (cs)
    return pdatum5
}
