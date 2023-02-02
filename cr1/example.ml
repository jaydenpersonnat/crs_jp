(* Compiling and Running OCaml Code *)

(* 
  To run this file, run the following commands: 
    $ ocamlbuild example.byte 
    $ ./example.byte 
*)

let hello () = 
  Printf.printf "Hello, world!\n" ;; 

hello () ;; 