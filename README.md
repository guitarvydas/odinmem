See the essay and diagrams in "2023-10-02-Odin Memory Layouts" in my blog https://guitarvydas.github.io/

usage: make



Diagrams for the essay: see stringclone.drawio.  Use draw.io.


update: 2023/10/04
- My problem is not, fundamentally, with understanding `any` but with understanding `strings.clone()` and the difference between _values_ and _variables_.

- A string - like an int - is a _value_.  You can hold that _value_ and you can save it somewhere.  If you want to save that _value_ in the heap, then you have to make a _variable_ in the heap into which you can assign the _value_.  Unlike an int, a string usually consists of a _value_ that is too large (or, too variable) to fit inside a _register_, so we have to save parts of it somewhere.

- a string is a 16-byte _value_
- a string _variable_ is a cubby-hole that can contain the 16-byte _value_
- strings.clone() clones the bytes of the string to the heap, but does not create a string _variable_ in the heap
- strings.clone() creates a _value_ that points to the bytes in the heap, and, returns that _value_ (without putting the _value_ in the heap)
- analogy: an `int` is an 8-byte _value_, whereas an `int` _variable_ is a cubby-hole that is 8 bytes wide and can contain the _value_ of the `int` ; when you "clone" an `int`, you don't expect to create a new `int` _variable_ in the heap, you simply xerox the _value_ ; when you declare an `int` variable inside a proc, you create a _variable_ and when you assign to that _variable_ you are stuffing a _value_ into the _variable_
