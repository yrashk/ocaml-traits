(** Standard traits implementations for [int]

    It includes Stdlib's [Int] to be able to [open Traits] without losing access
    to [Int] *)

include module type of Int
module PartialEq : Partial_eq.Trait with type t = int and type rhs = int
module Eq : Eq.Trait with type t = int
module PartialOrd : Partial_ord.Trait with type t = int and type rhs = int
module Ord : Ord.Trait with type t = int
