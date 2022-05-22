let%test "Ord.cmp works with trait implementation'" =
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

        module Eq = Traits.Eq.Make (PartialEq)

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

        module Ord = Ord.Make (PartialOrd)
      end in
      (Eq.eq (module Ordering) Equal @@ Ord.cmp (module Trait) 1 1)
      && (Eq.eq (module Ordering) Less @@ Ord.cmp (module Trait) 1 2)
      && (Eq.eq (module Ordering) Greater @@ Ord.cmp (module Trait) 2 1))
