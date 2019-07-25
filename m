From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111218] Segmentation fault in
 nv50_ir::NVC0LegalizeSSA::handleDIV when dividing result of textureSize
Date: Thu, 25 Jul 2019 19:07:43 +0000
Message-ID: <bug-111218-8800-tIzDIFgcOe@http.bugs.freedesktop.org/>
References: <bug-111218-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1058568838=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111218-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1058568838==
Content-Type: multipart/alternative; boundary="15640816631.d8f5.9592"
Content-Transfer-Encoding: 7bit


--15640816631.d8f5.9592
Date: Thu, 25 Jul 2019 19:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111218

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to mmgrqnv from comment #2)
> Hi! Thank you for the very quick response!
>=20
> You are right! The value of cell was 0. Replacing that with 1 also avoids
> the crash.

[By the way, implicit in that isn't just that it's 0, but that it's statica=
lly
determinable to be 0.]

> Do you know if there are any binary packages available that include that
> commit?

Sorry, that's not my fort=C3=A9... I think there are some Ubuntu PPA's whic=
h track
mesa master? Perhaps something for Fedora Rawhide? There are a thousand bin=
ary
distros, and I use none of them, so it's hard to keep track.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15640816631.d8f5.9592
Date: Thu, 25 Jul 2019 19:07:43 +0000
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
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218">bug 11121=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to mmgrqnv from <a href=3D"show_bug.cgi?id=3D111218#=
c2">comment #2</a>)
<span class=3D"quote">&gt; Hi! Thank you for the very quick response!
&gt;=20
&gt; You are right! The value of cell was 0. Replacing that with 1 also avo=
ids
&gt; the crash.</span >

[By the way, implicit in that isn't just that it's 0, but that it's statica=
lly
determinable to be 0.]

<span class=3D"quote">&gt; Do you know if there are any binary packages ava=
ilable that include that
&gt; commit?</span >

Sorry, that's not my fort=C3=A9... I think there are some Ubuntu PPA's whic=
h track
mesa master? Perhaps something for Fedora Rawhide? There are a thousand bin=
ary
distros, and I use none of them, so it's hard to keep track.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15640816631.d8f5.9592--

--===============1058568838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1058568838==--
