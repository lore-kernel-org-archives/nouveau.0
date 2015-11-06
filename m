From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92833] [NV117] nouveau E[ PFIFO][0000:01:00.0] read
 fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel
 0x007ed78000 [unknown]
Date: Fri, 06 Nov 2015 11:43:07 +0000
Message-ID: <bug-92833-8800-wBbg59sFBp@http.bugs.freedesktop.org/>
References: <bug-92833-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1218093751=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92833-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1218093751==
Content-Type: multipart/alternative; boundary="1446810187.4b6AffCa1.4835"; charset="UTF-8"


--1446810187.4b6AffCa1.4835
Date: Fri, 6 Nov 2015 11:43:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92833

--- Comment #2 from barry-LJgwZTY9oXz8xeUnPfcrCQ@public.gmane.org ---
(In reply to Ilia Mirkin from comment #1)
> Are those the first messages? 

There where some info ones. (sorry I've lost the setup for the moment to repro
this).

> What kernel are you using? Or to rephrase,
> does this still happen with kernel 4.3.0?

F23 is on 4.2.5. I will see if I can get a 4.3.0 to play with.

Is there any version of nouveau that I need to use with 4.3.0?

> nv50cal_space *basically* means the GPU has hung -- it's when we run out of
> IB space for pushbuf submission.

o.k.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446810187.4b6AffCa1.4835
Date: Fri, 6 Nov 2015 11:43:07 +0000
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
   title="NEW - [NV117] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel 0x007ed78000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92833#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV117] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel 0x007ed78000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92833">bug 92833</a>
              from <span class="vcard"><a class="email" href="mailto:barry&#64;barrys-emacs.org" title="barry&#64;barrys-emacs.org">barry&#64;barrys-emacs.org</a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92833#c1">comment #1</a>)
<span class="quote">&gt; Are those the first messages? </span >

There where some info ones. (sorry I've lost the setup for the moment to repro
this).

<span class="quote">&gt; What kernel are you using? Or to rephrase,
&gt; does this still happen with kernel 4.3.0?</span >

F23 is on 4.2.5. I will see if I can get a 4.3.0 to play with.

Is there any version of nouveau that I need to use with 4.3.0?

<span class="quote">&gt; nv50cal_space *basically* means the GPU has hung -- it's when we run out of
&gt; IB space for pushbuf submission.</span >

o.k.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446810187.4b6AffCa1.4835--

--===============1218093751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1218093751==--
