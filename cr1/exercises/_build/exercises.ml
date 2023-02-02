
(* Lab Exercises for Jayden's Code Review 1 - 2/2/2023 *)


(* What do these expression evaluate to? *)

(* a *) let x = 2 in x + x ;; 
(* b *) let y = 11 in (let x = 12 in x + 5) + y ;; 


(* What's the type? *)
let add (x : int) (y : int) : int = 
  x + y in add 5 1;; 

fun x -> fun y -> 10 * x + y ;; 

fun a b c -> if c then a *. float_of_int b else a ;; 

let greet y = 
  "Hello " ^ y in fun a -> fun b -> if a then b else greet b ;; 

(* Using Recursion example *)
let rec factorial (x : int) = 
  if x < 0 then raise (Invalid_argument "Input must be non-negative")
  else if x = 0 then 1 
  else x * factorial (x - 1) ;;


(* Pattern Matching Example *)
let rec length (xs: int list) : int = 
  match xs with 
  | [] -> 0 
  | _hd :: tl -> 2 + length tl ;; 
(* 
(* Performs an operation on all elements of a list *)
let rec max_list(lst : int list) : int = 
  failwith "not yet implemented" ;; 

(* Define a function squares that accepts a list of integers and returns 
   a list with the squares of each integer *)
let squares (lst : int list) : int list = 
  failwith "not yet implemented" ;; 

(* Define a function evens that accepts a list of integers and returns a list 
   with only the even integers. *)
let evens (lst : int list) : int list = 
  failwith "not yet implemented" ;; 

(* Define a function sum that accepts a list of integers and returns their 
   sum *)
let sum (lst : int list) : int = 
  failwith "not yet implemented" ;; 

(* Define a function reverse : int list -> int list, which returns the reversal 
   of its argument list. Instead of using explicit recursion, define reverse 
   by mapping, folding, or filtering *)

let reverse (lst : int list) : int list = 
  failwith "not yet implemented" ;; 

(* Define a function append : int list -> int list -> int list to calculate the 
   concatentation of two integer lists. Again, avoid explicit recursion, using 
   map, fold, or filter functions instead. *)
let append (lst1 : int list) (lst2 : int list): 
  failwith "not yet implemented" ;; 

(* Eliminate consecutive duplicates of elements 
  e.g 
   # compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string list = ["a"; "b"; "c"; "a"; "d"; "e"]
*)

let compress (lst: string list) : string list = 
  failwith "not yet implemented" ;; 


(* Remove the kth element of the list 
  # remove_at 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "c"; "d"]
*)

let remove_at (k : int) (lst : string list): string list = 
  failwith "not yet implemented" ;;  *)