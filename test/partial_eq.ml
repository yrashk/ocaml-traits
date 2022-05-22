let%test "PartialEq.eq works with the trait implementation" =
  Alcotest.(check bool)
    "works as expected" true
    Traits.(
      let module Trait = struct
        module PartialEq = struct
          type t = int
          type rhs = t

          let eq = Int.equal
          let ne x y = not @@ eq x y
        end
      end in
      PartialEq.eq (module Trait) 1 1)

let%test "PartialEq.ne works with the trait implementation" =
  Alcotest.(check bool)
    "works as expected" false
    Traits.(
      let module Trait = struct
        module PartialEq = struct
          type t = int
          type rhs = t

          let eq = Int.equal
          let ne x y = not @@ eq x y
        end
      end in
      PartialEq.ne (module Trait) 1 1)

let%test "PartialEq.Make defines `ne`" =
  Alcotest.(check bool)
    "negates `eq`" true
    Traits.(
      let module Trait = struct
        module PartialEq = PartialEq.Make (struct
          type t = int
          type rhs = t

          let eq = Int.equal
        end)
      end in
      PartialEq.ne (module Trait) 1 2)
