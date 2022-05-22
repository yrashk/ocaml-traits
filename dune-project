(lang dune 2.0)

(name traits)

(license ISC)

(authors
  "Yurii Rashkovskii")

(maintainers
  "Yurii Rashkovskii")

(generate_opam_files true)

(package
 (name traits)
 (synopsis "Common traits for generic functionality")
 (description "Common traits for generic functionality")
 (depends
  (ocaml (>= 4.08.0))
  (alcotest (and :with-test (>= 1.5.0)))
  (ppx_inline_alcotest (and :with-test (>= 1.0.0)))
  (dune (and :build (>= 3.2.0)))
  (utop (and :build (>= 2.9.1)))
  (ocamlformat (and :build (>= 0.21.0)))
  (odoc :with-doc)))
