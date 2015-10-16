From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Fri, 16 Oct 2015 09:00:09 +0000
Message-ID: <bug-92438-8800-8fkrA0lrhB@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1788321412=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1788321412==
Content-Type: multipart/alternative; boundary="1444986008.1841E3a50.11334"; charset="UTF-8"


--1444986008.1841E3a50.11334
Date: Fri, 16 Oct 2015 09:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #15 from Gabriele Svelto <gabriele.svelto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #14)
> NV94 is a tesla. Tesla is G80:MCP89 (aka nv50 family).

Right, my bad, I've got confused with the actual Tesla card.

> If you can make an apitrace that repros it for you consistently on replay
> that'd be incredibly useful. However I suspect there's more to it and a
> plain apitrace won't be able to repro the issue.

I gave it a spin today and the trace I gathered doesn't crash when replaying as
you suggested. The bottom of the trace contains an incomplete glFlush() call
followed by a glDrawArrays() which is also incomplete. I'll try grabbing more
traces in the hope of finding one that reproduces the crash.

Alternatively if you have the appropriate hardware to reproduce I can walk you
through how to build this stuff and reproduce yourself (it's a procedure that
might take a few hours though, the full Firefox OS emulator build is *large*).

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444986008.1841E3a50.11334
Date: Fri, 16 Oct 2015 09:00:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:gabriele.svelto&#64;gmail.com" title="Gabriele Svelto &lt;gabriele.svelto&#64;gmail.com&gt;"> <span class="fn">Gabriele Svelto</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92438#c14">comment #14</a>)
<span class="quote">&gt; NV94 is a tesla. Tesla is G80:MCP89 (aka nv50 family).</span >

Right, my bad, I've got confused with the actual Tesla card.

<span class="quote">&gt; If you can make an apitrace that repros it for you consistently on replay
&gt; that'd be incredibly useful. However I suspect there's more to it and a
&gt; plain apitrace won't be able to repro the issue.</span >

I gave it a spin today and the trace I gathered doesn't crash when replaying as
you suggested. The bottom of the trace contains an incomplete glFlush() call
followed by a glDrawArrays() which is also incomplete. I'll try grabbing more
traces in the hope of finding one that reproduces the crash.

Alternatively if you have the appropriate hardware to reproduce I can walk you
through how to build this stuff and reproduce yourself (it's a procedure that
might take a few hours though, the full Firefox OS emulator build is *large*).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444986008.1841E3a50.11334--

--===============1788321412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1788321412==--
