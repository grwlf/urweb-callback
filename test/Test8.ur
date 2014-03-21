structure C = Callback.Default
structure CF = CallbackFFI

fun template (mb:transaction xbody) : transaction page =
  b <- mb;
  return
    <xml>
      <head/>
      <body>{b}</body>
    </xml>

fun feed jr i : transaction page =
  j <- CF.deref jr;
  CF.pushStdin j (textBlob i.Text) 1024;
  redirect (url (job_monitor jr))

and job_monitor (jr:C.jobref) : transaction page = template (
  j <- C.get jr;
  return <xml>
    <div>
      Job : {[jr]}
      <br/>
      ExitCode : {[j.ExitCode]}
      <br/>
      Stdout:  {[j.Stdout]}
    </div>
    <div>
      <form>
        Feed some input:
        <br/>
        <textbox{#Text}/>
        <br/>
        <submit action={feed jr}/>
      </form>
    </div>
  </xml>)

fun job_start {} : transaction page =
  jr <- C.nextjob {};
  C.create jr "cat" (textBlob "Hello, kitty");
  redirect (url (job_monitor jr))

fun main {} : transaction page = template (
  return
    <xml>
      <a link={job_start {}}>Start a sleep job</a>
    </xml>)