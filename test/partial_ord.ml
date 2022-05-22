let%test "PartialOrd.partial_cmp works with trait implementation'" =
  Alcotest.(check bool)
    "works as intended" true
    Traits.(
      let module Trait = struct
        open Ordering

        module PartialEq = Traits.PartialEq.Make (struct
          type t = int
          type rhs = t

          let eq = Int.equal
        end)

        module PartialOrd = struct
          type t = int
          type rhs = t

          let partial_cmp x y =
            Some
              (match Int.compare x y with
              | -1 -> Less
              | 0 -> Equal
              | _ -> Greater)
        end
      end in
      let module M = Option.PartialEqSome (Ordering) in
      PartialEq.eq (module M) Equal
      @@ PartialOrd.partial_cmp (module Trait) 1 1
      && PartialEq.eq (module M) Less
         @@ PartialOrd.partial_cmp (module Trait) 1 2
      && PartialEq.eq (module M) Greater
         @@ PartialOrd.partial_cmp (module Trait) 2 1)
