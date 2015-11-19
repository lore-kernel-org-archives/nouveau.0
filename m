From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Thu, 19 Nov 2015 16:03:53 +0000
Message-ID: <bug-92991-8800-MoW4awvejo@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1931949471=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1931949471==
Content-Type: multipart/alternative; boundary="1447949033.1eE01.17458"; charset="UTF-8"


--1447949033.1eE01.17458
Date: Thu, 19 Nov 2015 16:03:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Oliver Neukum from comment #5)
> (In reply to Ilia Mirkin from comment #3)
> 
> > That seems much happier.
> 
> Unfortunately the result does not work. xrandr leads to an instant hard
> lockup with and without the additional parameter.

Can you recover any information when this happens? Perhaps with netconsole? Do
you have anything like bumblebee installed? [If so, try without it.]

Separately, can you try booting with nouveau.runpm=0 (in addition to the other
workaround thing)? That will prevent nouveau from runtime-suspending your GPU
and will increase battery usage, but it's a good debugging step.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447949033.1eE01.17458
Date: Thu, 19 Nov 2015 16:03:53 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Oliver Neukum from <a href="show_bug.cgi?id=92991#c5">comment #5</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92991#c3">comment #3</a>)
&gt; 
&gt; &gt; That seems much happier.
&gt; 
&gt; Unfortunately the result does not work. xrandr leads to an instant hard
&gt; lockup with and without the additional parameter.</span >

Can you recover any information when this happens? Perhaps with netconsole? Do
you have anything like bumblebee installed? [If so, try without it.]

Separately, can you try booting with nouveau.runpm=0 (in addition to the other
workaround thing)? That will prevent nouveau from runtime-suspending your GPU
and will increase battery usage, but it's a good debugging step.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447949033.1eE01.17458--

--===============1931949471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1931949471==--
