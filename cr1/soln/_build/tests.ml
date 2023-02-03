(* Test for Code Review 1 Exercises *)

open Exercises ;; 

(* The Absbook module contains simple functions for unit testing:
   `unit_test` and `unit_test_within`. *)
open CS51Utils ;;
open Absbook ;;


let length_test () = 
  unit_test (length [1] = 2) "list length 1"; 
  unit_test (length [1;2;3;4] = 4) "list length 4";
  unit_test (length [] = 0) "list length 0"; 
  unit_test (length [1;2;3;4;5; -2] = 6) "list length 6"; 
;; 

let sum_test () = 
  unit_test (sum [1;2;3;4] = 10) "sum of list"; 
;; 

let test_all () = 
  length_test ();
  sum_test ();  ;; 

test_all () ;; 
    
