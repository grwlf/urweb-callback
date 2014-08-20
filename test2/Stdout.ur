structure CB = Callback
structure C = CB.Default
structure T = Templ

table jobs : { JR : int }

fun monitor {} : transaction page = T.template (
  jr <- oneRow1(SELECT * FROM jobs);
  j <- C.get jr.JR;
  return <xml>{[Callback.blobLines j.Stdout]}</xml>)

fun lastline {} : transaction page = T.template (
  jr <- oneRow1(SELECT * FROM jobs);
  j <- C.get jr.JR;
  return <xml>{[CB.lastLines 1 j.Stdout]}</xml>)

fun main (s1:string) (s2:string) : transaction page = T.template (
  x <- C.abortMore 20;
  jr <- C.create (C.shellCommand ("printf '%s\\n%s' " ^ s1 ^ " " ^ s2));
  dml(INSERT INTO jobs(JR) VALUES ({[jr]}));
  return <xml>OK</xml>)

