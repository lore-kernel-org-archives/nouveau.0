From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99532] Compute shader doesn't give right result
 under some circumstances
Date: Wed, 25 Jan 2017 14:07:09 +0000
Message-ID: <bug-99532-8800-03Bsx4C88i@http.bugs.freedesktop.org/>
References: <bug-99532-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0554740464=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99532-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0554740464==
Content-Type: multipart/alternative; boundary="14853532290.7E4a323B3.17042";
 charset="UTF-8"


--14853532290.7E4a323B3.17042
Date: Wed, 25 Jan 2017 14:07:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99532

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Samuel Pitoiset from comment #8)
> A missing OP_CCTL maybe? I have something which could help (but it's
> definitely not the right thing to do).
>=20
> The possible fix is here:
> https://cgit.freedesktop.org/~hakzsam/mesa/commit/
> ?h=3Datomic_fixes&id=3Dd3a1158acde83d9d7a2a58e431623dd89e59ca65

Nope. It does change the rendering very slightly - there's now one bar
consistently in the histogram - still incorrect.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14853532290.7E4a323B3.17042
Date: Wed, 25 Jan 2017 14:07:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532">bug 99532<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Samuel Pitoiset from <a href=3D"show_bug.cgi?id=
=3D99532#c8">comment #8</a>)
<span class=3D"quote">&gt; A missing OP_CCTL maybe? I have something which =
could help (but it's
&gt; definitely not the right thing to do).
&gt;=20
&gt; The possible fix is here:
&gt; <a href=3D"https://cgit.freedesktop.org/~hakzsam/mesa/commit/">https:/=
/cgit.freedesktop.org/~hakzsam/mesa/commit/</a>
&gt; ?h=3Datomic_fixes&amp;id=3Dd3a1158acde83d9d7a2a58e431623dd89e59ca65</s=
pan >

Nope. It does change the rendering very slightly - there's now one bar
consistently in the histogram - still incorrect.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14853532290.7E4a323B3.17042--

--===============0554740464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0554740464==--
