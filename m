From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28095] X crash with PFIFO_CACHE_ERROR. (Nouveau on
	Riva TNT).
Date: Tue, 27 Jan 2015 21:18:42 +0000
Message-ID: <bug-28095-8800-lWtGsnbzpy@http.bugs.freedesktop.org/>
References: <bug-28095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1118592474=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1118592474==
Content-Type: multipart/alternative; boundary="1422393522.5F0bffd2.32494"; charset="UTF-8"


--1422393522.5F0bffd2.32494
Date: Tue, 27 Jan 2015 21:18:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28095

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Brent from comment #8)
> Tried Puppy Linux 6 with Linux kernel version 3.17.7, and got the identical
> errors as with 3.14.20.
> 
> I can't say if the PFIFO_CACHE_ERROR is still present, because I can't get
> past this error to run any XWindows apps.  X is running, it has not crashed,
> but the display is corrupted and unusable.

Those protection errors are expected... there's some minor difference between
NV04 and NV05, and so those happen.... iirc with the NOP handle or class or
something. I looked into it at one point and decided I didn't care enough (see
https://bugs.freedesktop.org/show_bug.cgi?id=68854). Does it cause any actual
issues though?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422393522.5F0bffd2.32494
Date: Tue, 27 Jan 2015 21:18:42 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095">bug 28095</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Brent from <a href="show_bug.cgi?id=28095#c8">comment #8</a>)
<span class="quote">&gt; Tried Puppy Linux 6 with Linux kernel version 3.17.7, and got the identical
&gt; errors as with 3.14.20.
&gt; 
&gt; I can't say if the PFIFO_CACHE_ERROR is still present, because I can't get
&gt; past this error to run any XWindows apps.  X is running, it has not crashed,
&gt; but the display is corrupted and unusable.</span >

Those protection errors are expected... there's some minor difference between
NV04 and NV05, and so those happen.... iirc with the NOP handle or class or
something. I looked into it at one point and decided I didn't care enough (see
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV04] PROTECTION_ERROR / PROTECTION_FAULT"
   href="show_bug.cgi?id=68854">https://bugs.freedesktop.org/show_bug.cgi?id=68854</a>). Does it cause any actual
issues though?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422393522.5F0bffd2.32494--

--===============1118592474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1118592474==--
