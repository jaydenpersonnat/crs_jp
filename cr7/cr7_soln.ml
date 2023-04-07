
(* Jayden's Code Review 3/31/2023 *)

(* Exercises with Lazy Streams *)

type 'a stream_internal = Cons of 'a * 'a stream 
  and 'a stream = 'a stream_internal Lazy.t 


let head (s : 'a stream) : 'a =
  let Cons (hd, _tl) = Lazy.force s in hd ;;

let tail (s : 'a stream) : 'a stream =
  let Cons (_hd, tl) = Lazy.force s in tl ;;
  
let rec first (n : int) (s : 'a stream) : 'a list =
  if n = 0 then []
  else head s :: first (n - 1) (tail s) ;;


let rec smap (f : 'a -> 'b)
             (s : 'a stream)
           : 'b stream =
lazy (Cons (f (head s),
    smap f (tail s)));;


let rec smap2 (f : 'a -> 'b -> 'c) (s1 : 'a stream) (s2 : 'b stream)
: 'c stream = 
  lazy (Cons (f (head s1) (head s2), smap2 f (tail s1) (tail s2))) ;;


let rec sfilter (pred : 'a -> bool) (s : 'a stream) : 'a stream =
  lazy (if pred (head s) then Cons ((head s), sfilter pred (tail s))
    else Lazy.force (sfilter pred (tail s))) ;;

(* Generate stream of unbiased coin flips 
Suppose we are given a coin that lands heads with unknown probability p and a blocking 
group is deciding who will get the single for an entire year. 

They want to run a tournament where they flip a coin between every pair of people 
in the blocking group, and whoever guesses the most flips correctly gets the single. 

Since the coin could be potentially biased (p != 0.5), we want to come up with a coin 
flipping scheme that is fair. So, rather than only flipping the coin once, we flip the 
coin twice. If the sequence is HT, then we denote those two flips as a single Heads. If 
the sequeunce is TH, then we denote that as Tails. If the sequence is HH or TT, we ignore 
the two flips, and then flip twice again until we either land HT or TH. 
(This is not part of the problem, but try to figure out why this works as a fair scheme!)

Denote H as 1 and T as 0. Suppose we have an infinite stream of 1s and 0s that represent flips 
of a coin. 

The function flips : int stream -> int stream should take the input stream and 
return a stream of 1s and 0s by taking the original flips and converting them into a stream 
of unbiased coin flips. 

e.g. 
first 6 s 
[1;1;0;1;1;0]

first 2 (flips s)
[0;1]
*)

(* Gernerate random permuation of 0s and 1s *)
let perm : int stream = 
  let rec perm_aux n = 
    lazy(Cons(Random.int n, perm_aux n)) 
  in perm_aux 2 ;; 


let rec flips (s: int stream) : (int stream) = 
  let Cons (h1, t1) = Lazy.force s in 
   let Cons(h2, t2) = Lazy.force t1 in 
     match h1, h2 with 
     | 1, 0 -> lazy (Cons(1, flips t2))
     | 0, 1 -> lazy(Cons(0, flips t2))
     | _ -> flips t2 
 ;; 

 (* Define a stream of numbers generated from the Uniform(0, 1) distribution. 
   That is, define a stream of numbers where each element is a random number between 0 
   and 1. 
*)
 let uniform_stream : float stream = 
  let rec bound_stream = lazy (Cons(int_of_float (2. ** 29.), bound_stream)) in 
    smap (fun b -> float_of_int (Random.int b) /.  (float_of_int b)) bound_stream ;;


(* 
Recall the Taylor series for an exponential function (e^x). 

Define a function expo_term : float -> float stream, that returns the stream of the 
taylor expansion of e^x

For instance if x = 5, then the first few terms of the output stream should be 
  5^0/0!, 5^1/0!, etc. 
*)

let rec factorial n = 
  if n = 0. then  1. 
  else n *. factorial (n -. 1.) ;; 

let expo_terms (x : float) : float stream = 
  let rec aux x i = 
    lazy (Cons((x ** i) /. factorial(i), aux x (i +. 1.)))
  in aux x 0. ;; 

