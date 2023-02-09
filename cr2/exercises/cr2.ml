(* Lab Exercises for Jayden's Code Review 1 - 2/10/2023 *)


(* Defining Records *)
type point_pair = int * int ;; 
type point_recd = {x : int; y: int} ;; 

let p: point_pair = (5, 1) ;; 
let p: point_recd = {x = 5; y = 1} ;; 

(* Extracting values from record *) 
(* Using pattern matching *)
let add_point_recd (p1 : point_recd) (p2: point_recd) : point_recd = 
  let {x = x1; y = y1}, {x = x2; y = y2} = p1, p2 in 
    {x = x1 + x2; y = y1 + y2} ;; 

(* Using dot notation *) 
let mult_point_recd (p1 : point_recd) (p2 : point_recd) : point_recd = 
  {x = p1.x * p2.x; y = p1.y * p2.y } ;;

(* Field punning *)
let point_pair_to_recd (p: point_pair) : point_recd = 
  let x, y = p in {x; y} ;; 

let point_pair_to_recd2 (x, y: point_pair) : point_recd = 
  {x ; y} ;; 

(* High-Order Functions *)
(* Exercise: Define a function floats_of_int that accepts a list of integers 
and converts it to a list of floating-point numbers *) 
let floats_of_int (xs: int list) : float list = 
  failwith "not yet implemented" ;;  

(* Exercise: Define a function invert_pairs that accepts a list of point_pairs 
and returns a list of those pairs with their x and y values inverted. *)
let invert_pairs (xs: point_pair list) : point_pair list = 
    failwith "not yet implemented" ;; 

(* Exercise: Define a function positive_pairs that accepts a list of point_pairs 
and returns a list of only those pairs whose x and y values are both positive. *) 
let positive_pairs : point_pair list -> point_pair list =
  failwith "not yet implemented" ;;

(* Exercise: Using List.fold_right, define a function length that returns the 
length of a list of elements. *)
let length (xs : 'a list) : int = 
  failwith "not yet implemented" ;; 

(* Exercise: Using List.fold_left, define a function reverse that reverses a list 
of elements. *) 
let reverse (xs : 'a list) : 'a list = 
  failwith "not yet implemented" ;; 

(* Currying *) 
let curry (uncurried : 'a * 'b -> 'c) : 'a -> 'b -> 'c = 
  fun x y -> uncurried (x, y) ;; 

let uncurry (curried: 'a -> 'b -> 'c) : 'a * 'b -> 'c = 
  fun (x, y) -> curried x y ;; 

(* Exercise: Write a function increment_opt that increments an int option value 
by 1. If the value is None, the function should return the value unchanged. *)
let increment_opt (x : int option) : int option = 
  failwith "not yet implemented" ;; 

(* Max_List_Opt from Lab *)
let rec max_list_opt (lst : int list): int option =
  match lst with
  | [] -> None
  | hd :: tl ->
    match max_list_opt tl with
    | None -> Some hd
    | Some max_tl -> Some (max hd max_tl) ;;

(* Exercise: can you spot the bug in this function? *)
let rec max_list (lst : int list) : int =
    match lst with
    | [] -> raise (Invalid_argument "max_list: empty list")
    | hd :: tl -> max hd (max_list tl) ;;

  
(* Additional Exercises *)

(* 1. Write a function that returns the last element of the list as an option. If 
the list is empty, return None *) 
let last (xs: 'a list) : 'a option = 
  failwith "not yet implemented" ;; 


(* 2. search takes in a key K and a list of key-value pairs. Find a key-value pair 
with the key K and return an option of that value. 
If the key does not exist in the list, return None. *) 

let search (K : 'a) (xs : ('a * 'b) list) : 'b option = 
  failwith "not yet implemented" ;; 


