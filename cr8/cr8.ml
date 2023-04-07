(* Exercises for Code Review 4/27 Personnat *)


class type counter_interface =
  object
    method bump : int -> unit
    method get_state : int
  end ;;


(* Write a class interface and definition for a Student class 
   Each object in the class should have the following methods: 
    1. method to obtain student's ID, class year, house, and concentration, GPA (individiually)
      i.e. this method should take in a field, and then return a value 
    2. method that returns a record containing all of the student's information 
*)


(* Write a class interface and definition for a Bank class 
  A bank has a series of accounts that have an ID and balance. At the minimum, 
  define methods to:
    1. obtain the id of the bank account 
    2. obtain the current balance of a bank account 
    3. width draw money 
    4. deposit money 
*)


(* 
Above is a class type for a “counter” object that maintains an integer state 
that can be “bumped” by adding an integer. Write a class definition 
satisfying this interface.
*)


(* 
Write a class definition for a class loud_counter obeying the same counter_interface 
that works identically but also prints the resulting state each time the counter is bumped.
*)



(* 
 Write a class type definition for an interface reset_counter_interface that’s just 
 like counter_interface but has an additional method to reset the state back to zero.
*)


(* 
Write a class definition for a class loud_reset_counter that satisfies reset_counter_interface that is 
“loud” (prints state when bumped or reset) and allows resetting.
*)



