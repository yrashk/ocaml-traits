(** [Ord] defines primitives for {{:https://en.wikipedia.org/wiki/Total_order}
    total order} over type [t]

    In order for a module to implement [Ord], it has to conform to the {!T}
    signature, which implies conformance to {!Ord.T} *)

(** [Ord] implementation signature *)
module type Trait = sig
  type t
  (* Type being compared *)

  val cmp : t -> t -> Ordering.t
  (** Returns ordering between two values of [t], left to right *)
end

(** Signature that defines [Ord] conformity *)
module type T = sig
  include Eq.T
  module Ord : Trait
end

(** Defines a default implementation of {!Trait} over an existing
    {!PartialOrd.Trait} definition *)
module Make : functor (T : Partial_ord.Trait) -> sig
  type t = T.t

  val cmp : t -> T.rhs -> Ordering.t
end

val cmp : (module T with type Ord.t = 't) -> 't -> 't -> Ordering.t
(** Compares values [x] and [y] with module [M] and returns an ordering, left to
    right *)
