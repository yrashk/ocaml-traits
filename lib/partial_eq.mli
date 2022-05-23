(** [PartialEq] defines primitives for
    {{:https://en.wikipedia.org/wiki/Partial_equivalence_relation} partial
    equivalence} for two types ([t] and [rhs])

    In order for a module to implement [PartialEq], it has to conform to the
    {!T} signature. *)

(** [PartialEq] implementation signature *)
module type Trait = sig
  type t
  (** Type being compared *)

  type rhs
  (** Type being compared with *)

  val eq : t -> rhs -> bool
  (** Equality definition.

      It must satisfy all of the following conditions:

      + Symmetry: if module [A] implements [PartialEq] and module [B] implements
        [PartialEq], and [A.PartialEq.t] is equal to [B.PartialEq.rhs] and
        [B.PartialEq.t] is equal to [A.PartialEq.rhs], then [eq (module A) a b]
        implies [eq (module B) b a]
      + Transitivity: if modules [A], [A'], [B] and [C] all implement
        [PartialEq], and [A.PartialEq.rhs] is equal to [B.PartialEq.t], and
        [B.PartialEq.rhs] is equal to [C.PartialEq.t], and [A'.Partial.rhs] is
        equal to [c.PartialEq.t], then [eq (module A) a b] and
        [eq (module B) b c] implies [eq (module A') a c] *)

  val ne : t -> rhs -> bool
  (** Inequality definition. Must ensure that it is consistent with {!eq}:
      [ne x y] if true if and only if [not (eq x y)]

      In most cases, {!Traits.PartialEq.Make} should be used to derive this
      function automatically. However, there may be cases where it may be more
      desirable (efficient, clear) to implement it manually. *)
end

(** Signature that defines [PartialEq] conformity *)
module type T = sig
  module PartialEq : Trait
end

(** Defines a default implementation of {!Trait.ne} over an existing {!Trait.eq}
    definition *)
module Make : functor
  (T : sig
     type t
     type rhs

     val eq : t -> rhs -> bool
   end)
  -> sig
  type t = T.t
  type rhs = T.rhs

  val eq : t -> rhs -> bool
  val ne : t -> rhs -> bool
end

val eq :
  (module T with type PartialEq.t = 't and type PartialEq.rhs = 'rhs) ->
  't ->
  'rhs ->
  bool
(** Tests [x] and [y] to be equal with a module [M] that implements signature
    {!T} *)

val ne :
  (module T with type PartialEq.t = 't and type PartialEq.rhs = 'rhs) ->
  't ->
  'rhs ->
  bool
(** Tests [x] and [y] to be unequal with a module [M] that implements signature
    {!T} *)
