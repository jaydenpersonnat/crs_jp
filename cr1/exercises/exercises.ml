
(* Lab Exercises for Jayden's Code Review 1 - 2/2/2023 *)


(* What do these expression evaluate to? *)

(* a *) let x = 2 in x + x ;; 
(* 4 *)
(* b *) let y = 11 in (let x = 12 in x + 5) + y ;; 
(* 28 *)


(* What's the type? *)
let add (x : int) (y : int) : int = 
  x + y in add 5 1;; 
  (* Value: 6 *)
  (* Type: int *)

fun x -> fun y -> 10 * x + y ;; 
fun x y -> 10 * x + y ;; 
(* <fun> *)
(* int -> int -> int *)

fun a b c -> if c then a *. float_of_int b else a ;;
(* float -> int -> bool *)

let greet y = 
  "Hello " ^ y in fun a -> fun b -> if a then b else greet b ;; 

(* greet: string -> string *)
(* bool -> string -> string *)

(* Using Recursion example *)
let rec factorial (x : int) = 
  if x < 0 then raise (Invalid_argument "Input must be non-negative")
  else if x = 0 then 1 
  else x * factorial (x - 1) ;;

  (* 
  x = 4 
  factorial (4)

  4 * factorial (3) 

  4 * 3 * factorial (2) 

  4 * 3 * 2 * factorial (1) 

  4 * 3 * 2 * 1 * factorial (0) 
  4 * 3 * 2 * 1 = 24 
  *)
(* Pattern Matching Example *)
let rec length (xs: int list) : int = 
  match xs with 
  | [] -> 0 
  | _hd :: tl -> 1 + length tl ;; 

(* let rec length (xs : int list) : int = 
  if xs = [] then 0 else 
    let hd :: tl = xs in 
      1 + length tl ;; 
   *)
(* 
Performs an operation on all elements of a list 
e.g. [20; 40; 5; 7; -3]

max_list [20, 40, 5, 7, -3] = 40 


    
return 40 
*)
let rec max_list(lst : int list) : int = 
  match lst with 
  | [] -> raise (Invalid_argument "list is empty")
  | [a] -> a
  | hd :: tl -> max hd (max_list tl) ;; 

(* Define a function squares that accepts a list of integers and returns 
   a list with the squares of each integer *)

(* partial application *)
open List ;; 

let squares : int list -> int list = 
  List.map (fun x -> x * x)  ;; 

(* Define a function evens that accepts a list of integers and returns a list 
   with only the even integers. *)
let evens : int list -> int list = 
  List.filter (fun x -> x mod 2 = 0) ;; 

(* Define a function sum that accepts a list of integers and returns their 
   sum *)
let sum : int list -> int  = 
  List.fold_left (+) 0 ;; 

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


(* Remove the kth element of the list 
  # remove_at 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "c"; "d"]
*)

let remove_at (k : int) (lst : string list): string list = 
  failwith "not yet implemented" ;; 


(* Solution will be posted right after lab *)