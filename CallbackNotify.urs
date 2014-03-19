con jobrec = [
  JobRef = int,
  ExitCode = option int,
  Cmd = string,
  Stdout = string]

type job = record jobrec

datatype jobstatus = Ready of job | Running of (channel job) * (source job)

type jobref = CallbackFFI.jobref

val nextjob : unit -> transaction jobref

val create : jobref -> string -> blob -> transaction unit

val monitor : jobref -> transaction jobstatus

val monitorX : jobref -> (job -> xbody) -> transaction xbody

(*
 * Aborts the handler if the number of jobs exceeds the limit.
 * Returns the actual number of job objects in memory.
 *)
val abortMore : int -> transaction int
