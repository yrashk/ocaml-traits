(lang dune 2.0)

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
 (name traits)
 (synopsis "Common traits for generic functionality")
 (description "Common traits for generic functionality")
 (depends
  (ocaml (>= 4.08.0))
  (alcotest (and :with-test (>= 1.5.0)))
  (ppx_inline_alcotest (and :with-test (>= 1.0.0)))
  (dune (>= 2.0))
  (odoc :with-doc)))

(package
  (name traits-devenv)
  (synopsis "Development environment for Traits")
  (description "Development environment for Traits")
  (depends
    traits
    (dune (>= 3.2.0))
    (utop (>= 2.9.1))
    (ocamlformat (>= 0.21.0))))
  
