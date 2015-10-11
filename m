From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92306] GL Excess demo renders incorrectly on nv43
Date: Sun, 11 Oct 2015 18:58:50 +0000
Message-ID: <bug-92306-8800-xqY98vuLi5@http.bugs.freedesktop.org/>
References: <bug-92306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1402150453=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1402150453==
Content-Type: multipart/alternative; boundary="1444589929.0C6bE1.15634"; charset="UTF-8"


--1444589929.0C6bE1.15634
Date: Sun, 11 Oct 2015 18:58:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92306

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Andrew Randrianasulu from comment #11)
> "Mismatched color and zeta formats, ignoring zeta."

Yeah, as I suspected... unfortunately there's not a ton you can do besides
fixing the issue. The problem is that you can't render to a 32-bit color format
(e.g. RGBA8) while using a 16-bit zeta (Z16), and conversely you can't render
to a 16-bit color format (e.g. RGB565) while using a 32-bit zeta (Z24S8).

My current solution to this problem is to just not set the zeta buffer and move
on with life. This leads to incorrect rendering, but at least no hangs.

The proper solution is to have 2 depth textures that you copy to and fro and
set the "right" one for the given color format. Ideally while minimizing the
number of copies.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444589929.0C6bE1.15634
Date: Sun, 11 Oct 2015 18:58:49 +0000
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
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306">bug 92306</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Andrew Randrianasulu from <a href="show_bug.cgi?id=92306#c11">comment #11</a>)
<span class="quote">&gt; &quot;Mismatched color and zeta formats, ignoring zeta.&quot;</span >

Yeah, as I suspected... unfortunately there's not a ton you can do besides
fixing the issue. The problem is that you can't render to a 32-bit color format
(e.g. RGBA8) while using a 16-bit zeta (Z16), and conversely you can't render
to a 16-bit color format (e.g. RGB565) while using a 32-bit zeta (Z24S8).

My current solution to this problem is to just not set the zeta buffer and move
on with life. This leads to incorrect rendering, but at least no hangs.

The proper solution is to have 2 depth textures that you copy to and fro and
set the &quot;right&quot; one for the given color format. Ideally while minimizing the
number of copies.</pre>
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

--1444589929.0C6bE1.15634--

--===============1402150453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1402150453==--
