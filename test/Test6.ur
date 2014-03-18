
structure C = CallbackNotify

fun template (mb:transaction xbody) : transaction page =
  b <- mb;
  return
    <xml>
      <head/>
      <body>{b}</body>
    </xml>

fun render (j:C.job) : xbody =
    <xml>
      Job : {[j.JobRef]}
      <br/>
      ExitCode : {[j.ExitCode]}
      <br/>
      Stdout:  {[j.Stdout]}
    </xml>

fun toXml (jres:C.jobresult) : transaction xbody =
  case jres of
    |C.Ready job => return (render job)
    |C.Running (c,ss) =>
      return <xml>
        <dyn signal={v <- signal ss; return (render v)}/>
        <active code={spawn (v <- recv c; set ss v); return <xml/>}/>
        </xml>

fun job_monitor (jr:C.jobref) : transaction page = template (
  j <- C.monitor jr;
  toXml j)

fun job_start {} : transaction page =
  jr <- C.nextjob {};
  C.create jr "for i in `seq 1 1 5`; do echo -n $i; sleep 2 ; done" (textBlob "");
  redirect (url (job_monitor jr))

fun main {} : transaction page = template (
  return
    <xml>
      <a link={job_start {}}>Start a sleep job</a>
    </xml>)

