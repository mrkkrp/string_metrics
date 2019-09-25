open Crowbar
open String_metrics

let check_symmetry f a b =
  check_eq ~pp:pp_int (f a b) (f b a)

let () =
  add_test ~name:"levenshtein symmetry" [bytes;bytes] (check_symmetry levenshtein)
