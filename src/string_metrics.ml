let levenshtein a b =
  let lena = String.length a in
  let lenb = String.length b in
  if lena = 0 then lenb
  else if lenb = 0 then lena
  else
    let v_len = lenb + 1 in
    let v = Array.init (v_len * 2) (fun i -> i) in
    let rec goi i v0 v1 =
      if i < lena then (
        v.(v1) <- i + 1;
        for j = 0 to lenb - 1 do
          let cost = if a.[i] = b.[j] then 0 else 1 in
          let x = 1 + v.(v1 + j) in
          let y = 1 + v.(v0 + j + 1) in
          let z = cost + v.(v0 + j) in
          v.(v1 + j + 1) <- min x (min y z)
        done;
        goi (i + 1) v1 v0 )
    in
    goi 0 0 v_len;

    v.((lenb + if lena mod 2 = 0 then 0 else v_len))
