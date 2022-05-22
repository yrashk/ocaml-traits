let%test "Eq.Make defines an Eq" =
  Alcotest.(check bool)
    "works as intended" true
    Traits.(
      let module Trait = struct
        module PartialEq = PartialEq.Make (struct
          type t = int
          type rhs = t

          let eq = Int.equal
        end)

        module Eq = Eq.Make (PartialEq)
      end in
      Eq.eq (module Trait) 1 1)
