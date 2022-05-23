module type Trait = sig
  type t
  type rhs

  val eq : t -> rhs -> bool
  val ne : t -> rhs -> bool
end

module type T = sig
  module PartialEq : Trait
end

module Make (T : sig
  type t
  type rhs

  val eq : t -> rhs -> bool
end) =
struct
  include T

  let ne x y = not @@ eq x y
end

let eq (type a b)
    (module M : T with type PartialEq.t = a and type PartialEq.rhs = b) (x : a)
    (y : b) =
  M.PartialEq.eq x y

let ne (type a b)
    (module M : T with type PartialEq.t = a and type PartialEq.rhs = b) (x : a)
    (y : b) =
  M.PartialEq.ne x y
