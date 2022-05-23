(** [PartialOrd] defines primitives for
    {{:https://en.wikipedia.org/wiki/Partially_ordered_set#Partial_order}
    partial order} over two types ([t] and [rhs])

    In order for a module to implement [PartialOrd], it has to conform to the
    {!T} signature, which implies conformance to {!PartialEq.T}

    The comparison must satisfy the following conditions:

    + Transitivity: [a < b] and [b < c] imples [a < c]. The same holds of
      equality and [>]
    + Duality: [a < b] if and only if [b > a] *)

(** [PartialOrd] implementation signature *)
module type Trait = sig
  type t
  (** Type being compared *)

  type rhs
  (** Type being compared with *)

  val partial_cmp : t -> rhs -> Ordering.t option
  (** Compares values of {!t} and {!rhs} and returns an ordering if one exists *)
end

(** Signature that defines [PartialOrd] conformity *)
module type T = sig
  include Partial_eq.T
  module PartialOrd : Trait
end

val partial_cmp :
  (module T with type PartialOrd.t = 't and type PartialOrd.rhs = 'rhs) ->
  't ->
  'rhs ->
  Ordering.t option
(** Compares values [x] and [y] with module [M] and returns an ordering if one
    exists *)
