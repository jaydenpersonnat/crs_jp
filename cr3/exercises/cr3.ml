(* Lab Exercises for Jayden's Code Review 3 - 2/17/2023 *)

(* Examples of ADTs in Lab *)

type color_label = 
  | Red 
  | Orange 
  | Yellow 
  | Green 
  | Blue 
  | Indigo 
  | Violet ;; 

let color1 : color_label = Red ;; 
let color2 : color_label = Blue ;;
let color3 : color_label = Green ;; 


type color = 
  | Simple of color_label 
  | RGB of int * int * int ;; 

let color1 : color = RGB (0, 0, 0) ;;

let color2 : color = RGB (85, 3, 3) ;;

let color3 : color = RGB (102, 51, 153) ;;


(* Binary Trees *)
type 'a bintree = 
 | Empty 
 | Node of 'a * 'a bintree * 'a bintree ;; 

let tree1 = Empty ;; 
let tree2 = Node (2, Empty, Empty) ;; 

let tree3 = Node (2, Empty, 
                    Node (8, Empty, Empty)) ;; 

let tree4 =
  Node (2, Node (5, Node (1, Empty, Empty), Empty),
        Node (8, Empty, Empty))
;;


(* Construct a binary search tree from a list of elements
# construct [3; 2; 5; 7; 1];;
- : int binary_tree =
Node (3, Node (2, Node (1, Empty, Empty), Empty),
 Node (5, Empty, Node (7, Empty, Empty)))
*)

let rec insert (t : 'a bintree) (value : 'a) : 'a bintree = 
  failwith "not yet implemented" ;; 

let construct : 'a list -> 'a bintree = 
 failwith "not yet implemented" ;; 

(* 

3 -> tree with 3 as the root 
2 -> insert 2 as the left child of 3 
5 -> insert 5 as the right child of 3
*)

(* Count the number of leaves in a binary tree. A leaf is a node with 
no children 

count_leaves Empty;;
- : int = 0
*)
let count_leaves (tr : 'a bintree) : int = 
  failwith "not yet implemented" ;; 

(* Find the sum of the nodes in a binary tree *)
let sum_bintree (tr : 'a bintree) : int = 
  failwith "not yet implemented" ;; 

(* Define a function preorder of type ’a bintree -> ’a list that returns a list of all of
the values stored in a tree in P R E O R D E R, that is, placing values stored at a node before
the values in the left subtree, in turn before the values in the right subtree. For instance,
# preorder int_bintree ;;
- : int list = [16; 93; 3; 42]*)

let preorder (tr : 'a bintree) : 'a list = 
  failwith "not yet implemented" ;; 

(* Define a function map that performs an operation on every node in the binary ree
and returns a binary tree *)
let mapbt (f : 'a -> 'b) (tr : 'a bintree) : 'b bintree = 
  failwith "not yet implemented" ;; 



(* Define a function foldbt walks the entire tree and performs an operation on 
   each node and the accumulator. Consider why the type of foldbt is defined like 
   so! *)
let foldbt (f: 'a -> 'b -> 'b -> 'b) (acc : 'b) (tr : 'a bintree) : 'b = 
  "failwith not yet implemented" ;;

