From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] [NV106] unknown kepler chipset 0x106
Date: Wed, 03 Dec 2014 11:12:20 +0000
Message-ID: <bug-86935-8800-AeJaFePQLF@http.bugs.freedesktop.org/>
References: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0698557174=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86935-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0698557174==
Content-Type: multipart/alternative; boundary="1417605140.2B025C1.14991"; charset="UTF-8"


--1417605140.2B025C1.14991
Date: Wed, 3 Dec 2014 11:12:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

--- Comment #7 from Sven <sven.koehler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)
> (In reply to Sven from comment #5)
> > I will try to do the mmiotrace of the blob. Problem is, that the binary
> > nvidia drivers gives me a kernel OOPS. Yay!
> 
> D'oh! Maybe try a newer driver? If it oopses "later" rather than on load/X
> start, then that should be enough for a mmiotrace.

I'm on gentoo. I was using the newest nvidia driver. But I suspect the kernel
was too new. Anyhow, on the 3rd try it didn't oops. Trace has been emailed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417605140.2B025C1.14991
Date: Wed, 3 Dec 2014 11:12:20 +0000
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
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">bug 86935</a>
              from <span class="vcard"><a class="email" href="mailto:sven.koehler&#64;gmail.com" title="Sven &lt;sven.koehler&#64;gmail.com&gt;"> <span class="fn">Sven</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=86935#c6">comment #6</a>)
<span class="quote">&gt; (In reply to Sven from <a href="show_bug.cgi?id=86935#c5">comment #5</a>)
&gt; &gt; I will try to do the mmiotrace of the blob. Problem is, that the binary
&gt; &gt; nvidia drivers gives me a kernel OOPS. Yay!
&gt; 
&gt; D'oh! Maybe try a newer driver? If it oopses &quot;later&quot; rather than on load/X
&gt; start, then that should be enough for a mmiotrace.</span >

I'm on gentoo. I was using the newest nvidia driver. But I suspect the kernel
was too new. Anyhow, on the 3rd try it didn't oops. Trace has been emailed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417605140.2B025C1.14991--

--===============0698557174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0698557174==--
