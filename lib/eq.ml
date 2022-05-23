module type Trait = sig
  type t
end

module type T = sig
  include Partial_eq.T
  module Eq : Trait
end

module Make (T : Partial_eq.Trait) = struct
  type t = T.t
end

let eq (type a)
    (module M : T
      with type PartialEq.t = a
       and type PartialEq.rhs = a
       and type Eq.t = a) (t : a) (rhs : a) =
  M.PartialEq.eq t rhs

let ne (type a)
    (module M : T with type PartialEq.t = a and type PartialEq.rhs = a) (t : a)
    (rhs : a) =
  M.PartialEq.ne t rhs
