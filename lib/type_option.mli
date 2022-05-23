(** Standard traits implementations for [option]

    It includes Stdlib's [Option] to be able to [open Traits] without losing
    access to [Option] *)

include module type of Stdlib.Option

module PartialEq : functor (T : Partial_eq.T) -> sig
  module PartialEq :
    Partial_eq.Trait
      with type t = T.PartialEq.t option
       and type rhs = T.PartialEq.rhs option
end

(** Compare mandatory value with an optional one *)
module PartialEqSome : functor (T : Partial_eq.T) -> sig
  module PartialEq :
    Partial_eq.Trait
      with type t = T.PartialEq.t
       and type rhs = T.PartialEq.rhs option
end
