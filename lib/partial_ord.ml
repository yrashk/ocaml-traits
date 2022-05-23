module type Trait = sig
  type t
  type rhs

  val partial_cmp : t -> rhs -> Ordering.t option
end

module type T = sig
  include Partial_eq.T
  module PartialOrd : Trait
end

let partial_cmp (type a b)
    (module M : T with type PartialOrd.t = a and type PartialOrd.rhs = b)
    (x : a) (y : b) =
  M.PartialOrd.partial_cmp x y
