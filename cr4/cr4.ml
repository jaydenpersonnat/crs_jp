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

  (* empty graph *)
  val empty: graph 
  (* add a vertex to the graph *)
  val addVertex : v -> graph -> graph 

  (* add a directed edge from a vertex u to a vertex v *)
  val addEdge : v -> v -> graph 

  (* Return the neighbors of a vertex `v` *)
  val neighbors : v -> v list 

  (* Return true if and only if the graph is a diagraph *)
  val is_directed : graph -> bool 

  (* Return the number of edges in the graph *)
  val count_edges : graph -> int 

  (* Return the in-degree (i.e. the number of edges) that come into v *)
  val in_degree : v -> int 

  (* Return the out-degree *)
  val out_degree : v -> int 

end ;; 

module MakeGraph(V : VERTEX) : (GRAPH with type v = V.t) = 
struct 
  type v = V.t 

  type graph = (V.t * V.t list) list
  let empty : graph = [] 

  let addVertex _ _ = failwith "not yet implemented" 
  let addEdge _ _ = failwith "not yet implemented"
  let neighbors _ = failwith "not yet implemented"
  let is_directed _ = failwith "not yet implemented" 
  let count_edges _ = failwith "not yet implemented" 
  let in_degree _  = failwith "not yet implemented"
  let out_degree _ = failwith "not yet implemented"
  
end ;;

