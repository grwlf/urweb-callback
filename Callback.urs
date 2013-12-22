
type job
type jobref = Basis.int

val create : string -> string -> int -> transaction job
val run: job -> url -> transaction unit
val cleanup: job -> transaction unit

val tryDeref : jobref -> transaction (option job)
val deref : jobref -> transaction job
val ref : job -> jobref

val pid : job -> int
val exitcode : job -> int
val stdout : job -> string
val errors : job -> string
