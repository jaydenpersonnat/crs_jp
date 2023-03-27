(* References *)

let x = ref 51 ;;
let y = !x ;; 
x := 42 ;;
let z = !x ;; 

(* During the function declaration, we're initializing a reference called memory 
and having it point to "" *)
let remember = 
  let memory = ref "" in 
  fun msg -> 
    let previous = !memory in 
    memory := msg; previous ;; 




(* What is the value of x? *)

let x =
  let y = ref 10 in
  y := !y * 2; !y
;;

(* Structural vs Physical Equality *)

let w = ref 42 ;;
let x = ref 42 ;;
let y = ref 51 ;;
let z = x ;;

w = x ;; (* true or false? *)
x = y ;;  (* true or false? *)
w == x ;; (* true or false? *)
x == z ;; (* true or false? *)

(* Mutable Lists *)
type 'a mlist = 'a mlist_internal ref
 and 'a mlist_internal = 
   | Nil
   | Cons of 'a * 'a mlist ;;

let m1 : int mlist = ref Nil ;;
let m2 : int mlist =
  ref (Cons (1, m1)) ;;

(* Define a function mfirst : int -> ’a mlist -> ’a list that returns a list (im-
mutable) of the first n elements of a mutable list: *)
let rec mfirst (n : int) (lst : 'a mlist) : 'a list = 
  if n = 0 then [] else 
    match !lst with 
    | Nil -> [] 
    | Cons (hd, tl) -> hd :: mfirst (pred n) tl ;; 

(* Write code to define a mutable integer list alternating such that for all integers n, the
expression mfirst n alternating returns a list of alternating 1s and 2s, for example, *)

let rec alternating =
  ref (Cons (1, ref (Cons (2, alternating)))) ;;