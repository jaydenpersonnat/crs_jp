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
    3. An update method that takes in a field and changes it to new value 
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


class counter : counter_interface =
  object
    val mutable state = 0
    method bump n = state <- state + n
    method get_state = state
  end ;;


(* Write a class definition for a class loud_counter obeying the same counter_interface 
that works identically but also prints the resulting state each time the counter is bumped. *)


class loud_counter : counter_interface = 
  object 
  inherit counter 

  end ;; 

(* 
 Write a class type definition for an interface reset_counter_interface that’s just 
 like counter_interface but has an additional method to reset the state back to zero.
*)

class loud_counter : counter_interface =
  object (this)
    inherit counter as super
    method! bump n =
      let _ = super#bump n in 
      Printf.printf "State is now %d\n" this#get_state
    end ;;



class type reset_counter_interface = 
object
  inherit counter_interface 
  method reset : unit 
end ;;

(* subtype : reset_counter_interface *)
(* supertype : counter_interface *)


(* 
Write a class definition for a class loud_reset_counter that satisfies reset_counter_interface that is 
“loud” (prints state when bumped or reset) and allows resetting.
*)

class loud_reset_counter : reset_counter_interface = 
object (this)
  inherit loud_counter 
  method reset = this#bump (-1 * this#get_state)

end ;; 

