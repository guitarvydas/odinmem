package zd

import "core:strings"
import "core:mem"
import "core:os"
import "core:fmt"

Datum :: struct { data : any }

main :: proc () {
    // BLOCK 1
    cs := "TARVY"
    fmt.printf ("%v\n", typeid_of (type_of (cs)))
    fmt.printf ("%v\n", raw_data (cs))
    fmt.printf ("%v\n", len (cs))
    fmt.printf ("%v\n", &cs)

    // BLOCK 2
    fmt.printf ("\nBLOCK 2\n")
    clonedcs := strings.clone (cs)
    fmt.printf ("%v\n", typeid_of (type_of (clonedcs)))
    fmt.printf ("%v\n", raw_data (clonedcs))
    fmt.printf ("%v\n", len (clonedcs))
    fmt.printf ("%v\n", &clonedcs)

    // BLOCK 3
    fmt.printf ("\nBLOCK 3\n")
    pany : ^any = new (any)
    pany^ = clonedcs
    fmt.printf ("%v\n", typeid_of (type_of (pany.(string))))
    fmt.printf ("%v\n", raw_data (pany.(string)))
    fmt.printf ("%v\n", len (pany.(string)))
    fmt.printf ("0x%p\n", &pany)

    // BLOCK 4
    fmt.printf ("\nBLOCK 4\n")
    pdatum : ^Datum = new (Datum)
    (pdatum^).data = strings.clone (cs)
    fmt.printf ("%v\n", typeid_of (type_of (pdatum.data.(string))))
    fmt.printf ("%v\n", raw_data (pdatum.data.(string)))
    fmt.printf ("%v\n", len (pdatum.data.(string)))
    fmt.printf ("0x%p 0x%p %v\n",
		&pdatum,
		pdatum,
		transmute([2]rawptr)(pdatum^)
	       )
    ptr_to_datum := pdatum
    contents_of_datum := ptr_to_datum^
    raw_data_in_datum := transmute([2]rawptr)(contents_of_datum)
    ptr_to_string := raw_data_in_datum[0]
    str := (transmute(^string)ptr_to_string)^
    raw_data_in_string := transmute([2]rawptr)(str)
    fmt.printf ("address of ptr_to_datum on stack: 0x%p\n contents of ptr to datum: 0x%p\n  .any. in datum: %v\n  address string:  0x%p\n   contents of string object: %v\n    string object interpreted as string: %v\n",
		&ptr_to_datum,
		ptr_to_datum,
		raw_data_in_datum,
		ptr_to_string,
		raw_data_in_string,
		str
	       )

    // BLOCK 5
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
