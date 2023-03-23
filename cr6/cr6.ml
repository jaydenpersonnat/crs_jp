(* References *)

let x = ref 51 ;;
let y = !x ;; 
x := 42 ;;
let z = !x ;; 

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


(* Write code to define a mutable integer list alternating such that for all integers n, the
expression mfirst n alternating returns a list of alternating 1s and 2s, for example, *)



