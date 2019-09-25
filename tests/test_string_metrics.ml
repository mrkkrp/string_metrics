open String_metrics

let test_pair (f : string -> string -> int) (a : string) (b : string)
    (distance : int) =
  let name = Printf.sprintf "\"%s\" and \"%s\"" a b in
  Alcotest.test_case name `Quick (fun () ->
      Alcotest.(check int) name distance (f a b))

let () =
  Alcotest.run "string_metrics"
    [
      ( "levenshtein",
        [
          test_pair levenshtein "kitten" "sitting" 3;
          test_pair levenshtein "cake" "drake" 2;
          test_pair levenshtein "saturday" "sunday" 3;
          test_pair levenshtein "red" "wax" 3;
          test_pair levenshtein "lucky" "lucky" 0;
          test_pair levenshtein "" "" 0;
        ] );
    ]
