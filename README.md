# Traits

This package provides simple building blocks for generic functionality in OCaml using modules and functors.

## Motivation

This package was originally developed to avoid coupling of operation (such as equality or ordering comparison) with the type information. Consider this:

```ocaml
Int.equal 1 2
```

The fact that we call [Int.equal] carries both the operation ([equal]) and the type ([int]). The original purpose has been stated
to de-couple these into separate things:

```ocaml
Eq.eq (module Int) 1 2
```

It is, however, planned to extend this package to provide more common abstractions.
