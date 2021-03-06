type uni_level = int
type t =
  | Var of int (* DeBruijn indices for variables & ticks *)
  | Let of t * (* BINDS *) t | Check of t * t
  | Nat | Zero | Suc of t | NRec of (* BINDS *) t * t * (* BINDS 2 *) t * t
  | Pi of t * (* BINDS *) t | Lam of (* BINDS *) t | Ap of t * t
  | Sg of t * (* BINDS *) t | Pair of t * t | Fst of t | Snd of t
  | Id of t * t * t | Refl of t | J of (* BINDS 3 *) t * (* BINDS *) t * t
  | Box of t | Open of t | Shut of t
  | Uni of uni_level

type env = t list

val equal_uni_level : uni_level -> uni_level -> bool
val equal : t -> t -> bool

val pp_uni_level : Format.formatter -> uni_level -> unit
val show_uni_level : uni_level -> string

val pp : Format.formatter -> t -> unit
val show : t -> string
