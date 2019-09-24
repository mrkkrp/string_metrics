let test_x () =
  Alcotest.(check int) "x is 5" String_metrics.magic_x 5

let () =
  Alcotest.run "string_metrics"
    [ ( "magic x",
        [ Alcotest.test_case "magic x" `Quick test_x
        ]
      )
    ]
