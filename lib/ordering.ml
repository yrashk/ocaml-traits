(** Relative ordering *)

(** Relative ordering definition *)
type t = Less | Equal | Greater

module PartialEq = Partial_eq.Make (struct
  type t' = t
  type t = t'
  type rhs = t

  let eq x y =
    match (x, y) with
    | Less, Less -> true
    | Equal, Equal -> true
    | Greater, Greater -> true
    | _ -> false
end)

module Eq = Eq.Make (PartialEq)
