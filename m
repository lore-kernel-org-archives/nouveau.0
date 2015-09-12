From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91986] Artifacts in models rendering with GeForce
 6150 (NV4x chipsets)
Date: Sat, 12 Sep 2015 23:20:59 +0000
Message-ID: <bug-91986-8800-mI9lrgLv0A@http.bugs.freedesktop.org/>
References: <bug-91986-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1366299089=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91986-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1366299089==
Content-Type: multipart/alternative; boundary="1442100058.4DAA4ed11.22183"; charset="UTF-8"


--1442100058.4DAA4ed11.22183
Date: Sat, 12 Sep 2015 23:20:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91986

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Mauro Rossi from comment #4)
> Just my curiosity, are these side effects to be expected when using 
> NV30_SWTNL=true ?

Strictly speaking, swtnl should work identically to hwtnl. However until
recently, the swtnl path was *totally* broken. I fixed it up, but I wouldn't
exclude the possibility of some remaining fail that I didn't notice.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442100058.4DAA4ed11.22183
Date: Sat, 12 Sep 2015 23:20:58 +0000
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
   title="NEW - Artifacts in models rendering with GeForce 6150 (NV4x chipsets)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91986#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Artifacts in models rendering with GeForce 6150 (NV4x chipsets)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91986">bug 91986</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Mauro Rossi from <a href="show_bug.cgi?id=91986#c4">comment #4</a>)
<span class="quote">&gt; Just my curiosity, are these side effects to be expected when using 
&gt; NV30_SWTNL=true ?</span >

Strictly speaking, swtnl should work identically to hwtnl. However until
recently, the swtnl path was *totally* broken. I fixed it up, but I wouldn't
exclude the possibility of some remaining fail that I didn't notice.</pre>
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

--1442100058.4DAA4ed11.22183--

--===============1366299089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1366299089==--
