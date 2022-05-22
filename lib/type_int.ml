(** Standard traits implementations for [int]

    It includes Stdlib's [Int] to be able to [open Traits] without losing access
    to [Int] *)

include Int

module PartialEq = Partial_eq.Make (struct
  type t = int
  type rhs = int

  let eq = Int.equal
end)

module Eq = Eq.Make (PartialEq)

module PartialOrd = struct
  type t = int
  type rhs = int

  let partial_cmp x y =
    Ordering.(
      Some
        (match Int.compare x y with
        | -1 -> Less
        | 0 -> Equal
        | 1 -> Greater
        | _ -> failwith "unexpected"))
end

module Ord = Ord.Make (PartialOrd)
