include Stdlib.Option

module PartialEq (T : Partial_eq.T) = struct
  module PartialEq = Partial_eq.Make (struct
    type t = T.PartialEq.t option
    type rhs = T.PartialEq.rhs option

    let eq x y =
      match (x, y) with
      | Some x, Some y -> Partial_eq.eq (module T) x y
      | _ -> false
  end)
end

module PartialEqSome (T : Partial_eq.T) = struct
  module PartialEq = Partial_eq.Make (struct
    type t = T.PartialEq.t
    type rhs = T.PartialEq.rhs option

    let eq x y =
      match y with Some y -> Partial_eq.eq (module T) x y | _ -> false
  end)
end
