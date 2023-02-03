
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
  | _hd :: tl -> 1 + length tl ;; 
  
(* 
Performs an operation on all elements of a list *)
let rec max_list(lst : int list) : int = 
  match lst with 
  | [] -> raise (Invalid_argument "list is empty")
  | [elt] -> elt 
  | hd :: tl -> max hd (max_list tl) ;; 

(* The solutions below use partial application! *)

(* Define a function squares that accepts a list of integers and returns 
   a list with the squares of each integer (use a HOF) *)

let squares : int list -> int list = 
  List.map (fun x -> x * x) ;; 

(* Define a function evens that accepts a list of integers and returns a list 
   with only the even integers. (use a HOF) *)
let evens : int list -> int list  = 
  List.filter (fun x -> x mod 2 = 0) ;; 

(* Define a function sum that accepts a list of integers and returns their 
   sum (use a HOF) *)
let sum : int list -> int = 
  List.fold_left (+) 0  ;; 

(* Here is a fold right solution, why can't partial application be used here? 
  let sum (lst : int list) : int = 
  List.fold_right (+) lst 0 ;;  
*)

(* Define a function reverse : int list -> int list, which returns the reversal 
   of its argument list. Instead of using explicit recursion, define reverse 
   by mapping, folding, or filtering *)

let reverse (lst : int list) : int list = 
  List.fold_left (fun acc elt -> elt :: acc) [] lst ;; 

(* Define a function append : int list -> int list -> int list to calculate the 
   concatentation of two integer lists. Again, avoid explicit recursion, using 
   map, fold, or filter functions instead. 
   
   # append [1;2;3] [4;5;6] ;;
- : int list = [1; 2; 3; 4; 5; 6]
   
   *)
let append (lst1 : int list) (lst2 : int list) : int list = 
  List.fold_right (fun elt acc -> elt :: acc) lst1 lst2 ;; 

(* Remove the kth element of the list 
  # remove_at 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "c"; "d"]
*)

let rec remove_at (n : int) (lst : string list) : string list = 
  match lst with 
    | [] -> []
    | h :: t -> if n = 0 then t else h :: remove_at (n - 1) t ;;