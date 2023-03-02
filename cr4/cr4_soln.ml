(* Lab Exercises for Jayden's Code Review 4 - 2/25/2023 *)

module type VERTEX =
  sig
    type t
    type label 
    val compare : t -> t -> int 
    val equal : t -> t -> bool 
    val create : label -> t
    val label : t -> label 

  end ;; 

module type GRAPH = 
sig
  type v 
  type graph 
  exception VertexDoesNotExist
  exception EdgeAlreadyExists 



  (* empty graph *)
  val empty: graph 
  (* add a vertex to the graph *)
  val addVertex : v -> graph -> graph 

  (* add a directed edge from a vertex u to a vertex v *)
  val addEdge : v -> v -> graph -> graph 

  (* Return the neighbors of a vertex `v` *)
  val neighbors : v -> graph -> v list 

  (* Return true if and only if the graph is a diagraph *)
  val is_directed : graph -> bool 

  (* Return the number of edges in the graph *)
  val count_edges : graph -> int 

  (* Return the in-degree (i.e. the number of edges) that come into v *)
  val in_degree : v -> graph -> int 

  (* Return the out-degree *)
  val out_degree : v -> graph -> int 

end ;; 

module MakeGraph(V : VERTEX) : (GRAPH with type v = V.t) = 
struct 
  exception VertexDoesNotExist
  exception EdgeAlreadyExists 

  type v = V.t 

  type graph = (V.t * V.t list) list
  let empty : graph = [] 

  (* [(2, [3;4]); (1, [3])]*)
  let rec search (u : v) (g : graph) : bool = 
    match g with 
    | [] -> false 
    | (vertex, _) :: t -> u = vertex || search u t

  
  let addVertex (u : v) (g : graph) : graph = 
    if not (search u g) then raise VertexDoesNotExist else 
    (u, []) :: g


  (* Define a function that returns true if an edge (u, w) is in the graph *)
  let rec checkEdge (u : v) (w : v) (g : graph) = 
    let rec checkNeighbor w nbrs = 
      match nbrs with 
      | [] -> false 
      | h :: t -> w = h || checkNeighbor w t in 
      match g with 
      | [] -> false 
      | (vertex, lst) :: t -> checkNeighbor w lst || checkEdge u w t 

  let addEdge (u : v) (f : v) (g : graph) : graph = 
    if checkEdge u f g then raise EdgeAlreadyExists else 
    if not (search u g) || not (search f g) then raise VertexDoesNotExist 
    else List.fold_left 
          (fun acc ((vertex, nbrs) as elt) -> 
            if vertex = u then (u, f :: nbrs) :: acc else elt :: acc) [] g


  let rec neighbors (u : v) (g : graph) : v list = 
    match g with 
    | [] -> raise VertexDoesNotExist
    | (vertex, lst) :: t -> if vertex = u then lst else neighbors u t 

  (* an empty graph is considered to be undirected for our purposes *)
  let rec is_directed (g : graph) : bool = 
    match g with 
    | [] -> false 
    | (vertex, lst) :: t -> 
      List.for_all (fun w -> checkEdge vertex w g && checkEdge w vertex g) lst && is_directed t
      

  let rec count_edges (g : graph) : int = 
    match g with 
    | [] -> 0 
    | (_, lst) :: t-> List.length lst + count_edges t 


  let in_degree (u : v) (g : graph) = 
    let rec in_degree' (u : v) (g : graph) (deg: int) : int = 
     match g with 
      | [] -> raise VertexDoesNotExist
      | [(v, l)] -> deg
      | (vertex, lst) :: t -> if List.mem u lst then in_degree' u t (succ deg) else in_degree' u t deg 
    in in_degree' u g 0 

  let rec out_degree (u : v) (g: graph) : int = 
    match g with  
    | [] -> raise VertexDoesNotExist 
    | (vertex, lst) :: t -> if vertex = u then List.length lst else in_degree u t 

  
end ;;
