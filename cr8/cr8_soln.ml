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

type field = 
  | ID
  | YEAR 
  | HOUSE 
  | CONCENTRATION 
  | GPA  
;;



type student_info = {id : string; year: string; house : string; concentration : string; gpa: string} ;;

class type student_interface = 
object 
  method get : field -> string
  method get_all : student_info 
  method update : field -> string -> unit 

end ;; 

class student (id_init : string) (year_init : string) (house_init : string) (concentration_init : string) (gpa_init : string) : student_interface = 
object 
  val mutable id = id_init 
  val mutable house = house_init 
  val mutable concentration = concentration_init 
  val mutable gpa = gpa_init 
  val mutable year = year_init  

  method get (f : field) : 'a = 
    match f with 
    | ID -> id
    | YEAR -> year
    | HOUSE -> house
    | CONCENTRATION -> concentration
    | GPA ->  gpa 

  method get_all = 
    {id=id; house=house; year=year; concentration=concentration; gpa=gpa}

  method update (f : field) (v: 'a) : unit = 
    match f with 
    | ID -> id <- v 
    | YEAR -> year <- v 
    | HOUSE -> house <- v 
    | CONCENTRATION -> concentration <- v 
    | GPA -> gpa <- v
 
end ;; 

(* Write a class interface and definition for a account class 
  A bank has a series of accounts that have an ID and balance. At the minimum, 
  define methods to:
    1. obtain the id of the bank account 
    2. obtain the current balance of a bank account 
    3. widthdraw money 
    4. deposit money 
*)
class type account_interface = 
object
  method get_id : string 
  method get_balance : float 
  method widthdraw : float -> unit 
  method deposit : float -> unit
end 

class account (id : string) (balance_init : float) : account_interface =
object 
  val id = id 
  val mutable balance = balance_init

  method get_id = id 
  method get_balance = balance 
  method widthdraw amount = balance <- max (balance -. amount) 0.
  method deposit amount = balance <- balance +. amount 
end ;; 

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

