From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85570] DPMS does not turn off LCD backlight on G73
 (NV4B) [GeForce 7600 GS]
Date: Fri, 13 Mar 2015 21:26:07 +0000
Message-ID: <bug-85570-8800-NGnNmZwnbF@http.bugs.freedesktop.org/>
References: <bug-85570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1274264269=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85570-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1274264269==
Content-Type: multipart/alternative; boundary="1426281967.c3Ae15843.18766"; charset="UTF-8"


--1426281967.c3Ae15843.18766
Date: Fri, 13 Mar 2015 21:26:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85570

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Erik van Pienbroek from comment #1)
> Hi,
> 
> I'm also on Fedora and have been observing similar issues on my Dell XPS
> 17/GeForce GT 555M where the backlight of the internal display doesn't turn
> off any more (xset dpms force off) starting with early kernel 3.16 snapshots
> (git tag v3.15-9837-g682b7c1c8ea8 was the first one to be broken). This was
> reported to Red Hat bugzilla @
> https://bugzilla.redhat.com/show_bug.cgi?id=1123661 which is currently still
> open.

The patch referenced in that bug report relates to DP outputs. This bug report
is about a NV4B which came out in ~2005, and has no DP outputs. It also uses
the 'dispnv04' path rather than the nv50_display path and is very different.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426281967.c3Ae15843.18766
Date: Fri, 13 Mar 2015 21:26:07 +0000
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
   title="NEW - DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85570#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85570">bug 85570</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Erik van Pienbroek from <a href="show_bug.cgi?id=85570#c1">comment #1</a>)
<span class="quote">&gt; Hi,
&gt; 
&gt; I'm also on Fedora and have been observing similar issues on my Dell XPS
&gt; 17/GeForce GT 555M where the backlight of the internal display doesn't turn
&gt; off any more (xset dpms force off) starting with early kernel 3.16 snapshots
&gt; (git tag v3.15-9837-g682b7c1c8ea8 was the first one to be broken). This was
&gt; reported to Red Hat bugzilla &#64;
&gt; <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1123661">https://bugzilla.redhat.com/show_bug.cgi?id=1123661</a> which is currently still
&gt; open.</span >

The patch referenced in that bug report relates to DP outputs. This bug report
is about a NV4B which came out in ~2005, and has no DP outputs. It also uses
the 'dispnv04' path rather than the nv50_display path and is very different.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426281967.c3Ae15843.18766--

--===============1274264269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1274264269==--
