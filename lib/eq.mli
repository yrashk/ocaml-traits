(** [Eq] defines primitives for
    {{:https://en.wikipedia.org/wiki/Equivalence_relation} equivalence} for type
    [t]

    In order for a module to implement [Eq], it has to conform to the {!T}
    signature, which implies conformance to {!PartialEq.T}. In fact, [Eq] builds
    on top of it and simplity denotes that in addition to symmetricity and
    transitivity properties, reflexivity property is to be observed ([eq a a]) *)

(** [Eq] implementation signature *)
module type Trait = sig
  type t
  (** Type being compared *)
end

(** Signature that defines [Eq] conformity *)
module type T = sig
  include Partial_eq.T
  module Eq : Trait
end

(** Defines a default implementation of {!Trait} over an existing
    {!PartialEq.Trait} definition *)
module Make : functor (T : Partial_eq.Trait) -> sig
  type t = T.t
end

val eq :
  (module T
     with type PartialEq.t = 't
      and type PartialEq.rhs = 't
      and type Eq.t = 't) ->
  't ->
  't ->
  bool
(** Tests [x] and [y] to be equal with a module [M] that implements signature
    {!T} *)

val ne :
  (module T with type PartialEq.t = 't and type PartialEq.rhs = 't) ->
  't ->
  't ->
  bool
(** Tests [x] and [y] to be unequal with a module [M] that implements signature
    {!T} *)
