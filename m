From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sat, 24 Oct 2015 12:04:31 +0000
Message-ID: <bug-92438-8800-5uyjsLudVx@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0368716315=="
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


--===============0368716315==
Content-Type: multipart/alternative; boundary="1445688271.7316C0.16251"; charset="UTF-8"


--1445688271.7316C0.16251
Date: Sat, 24 Oct 2015 12:04:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #17 from Gabriele Svelto <gabriele.svelto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks for the tip. From the comments in that bug I should be able to test that
patch in the 4.3+ kernels. I'm rolling my own build so I can try that out as
soon as I have some spare time. I'll also try mesa 11.0.4 when it will be
available in portage (which should be shortly after release).

I'd also like to do another experiment: traces gathered with apitrace always
end up with the seg-faulting command and always work fine when repeating them -
possibly because the last command needs to be fully executed to cause the
problem. I'll try gathering a much longer trace using the software render and
then try to replay that one with apitrace to see if I can trigger the bug.
Alternatively this might be a race condition of some sort (I can see in the
trace that there's at least 4 threads calling GL commands); possibly
re-executing the trace a lot of times might trigger it sooner or later.

I'll report back if I find anything useful.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445688271.7316C0.16251
Date: Sat, 24 Oct 2015 12:04:31 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:gabriele.svelto&#64;gmail.com" title="Gabriele Svelto &lt;gabriele.svelto&#64;gmail.com&gt;"> <span class="fn">Gabriele Svelto</span></a>
</span></b>
        <pre>Thanks for the tip. From the comments in that bug I should be able to test that
patch in the 4.3+ kernels. I'm rolling my own build so I can try that out as
soon as I have some spare time. I'll also try mesa 11.0.4 when it will be
available in portage (which should be shortly after release).

I'd also like to do another experiment: traces gathered with apitrace always
end up with the seg-faulting command and always work fine when repeating them -
possibly because the last command needs to be fully executed to cause the
problem. I'll try gathering a much longer trace using the software render and
then try to replay that one with apitrace to see if I can trigger the bug.
Alternatively this might be a race condition of some sort (I can see in the
trace that there's at least 4 threads calling GL commands); possibly
re-executing the trace a lot of times might trigger it sooner or later.

I'll report back if I find anything useful.</pre>
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

--1445688271.7316C0.16251--

--===============0368716315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0368716315==--
