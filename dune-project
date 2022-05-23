(lang dune 3.2)

(name traits)

(license ISC)

(authors
  "Yurii Rashkovskii")

(maintainers
  "Yurii Rashkovskii")

(source (github yrashk/ocaml-traits))
(version 0.1.0)

(generate_opam_files true)

(package
  (name traits-devenv)
  (allow_empty)
  (synopsis "Development environment for Traits")
  (description "Development environment for Traits")
  (depends
    traits
    (dune (>= 3.2.0))
    (dune-release (>= 1.6.1))
    (utop (>= 2.9.1))
    (ocamlformat (>= 0.21.0))))
 
(package
 (name traits)
 (synopsis "Common traits for generic functionality")
 (description "Common traits for generic functionality")
 (depends
  (ocaml (>= 4.08.0))
  dune
  (alcotest (and :with-test (>= 1.5.0)))
  (ppx_inline_alcotest (and :with-test (>= 1.0.0)))
  (odoc :with-doc))) 
