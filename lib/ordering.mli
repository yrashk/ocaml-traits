(** Relative ordering *)

(** Relative ordering definition *)
type t = Less | Equal | Greater

module PartialEq : Partial_eq.Trait with type t = t and type rhs = t
module Eq : Eq.Trait with type t = t
