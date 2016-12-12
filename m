From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99033] [NV67] Incomplete implementation of OpenGL 2.1
Date: Mon, 12 Dec 2016 21:22:00 +0000
Message-ID: <bug-99033-8800-gCRZkNRRLo@http.bugs.freedesktop.org/>
References: <bug-99033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0147648091=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99033-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0147648091==
Content-Type: multipart/alternative; boundary="14815777200.Cd0c3.18101";
 charset="UTF-8"


--14815777200.Cd0c3.18101
Date: Mon, 12 Dec 2016 21:22:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99033

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilya Indigo from comment #7)
> If this card is able to support later expansion, which should be implemen=
ted
> to the later video card, which shows a list of nvidia, why not add them to
> this card?

They are using software to work around the hardware's limitations. That
software is not written for nouveau.

> I thought, if in Mesa for nouveau declared support for OpenGL 4.1 at leas=
t,

For GF100+ GPUs, yes. NV67 is a fair bit older.

> the increasingly younger expansion should be implemented already, just
> depending on the graphics card will connect them to a different set?
>=20
> Or something I do not understand, and for each GPU you write from scratch
> every extension?

Each hardware generation supports what it supports. For NV67, which is
effectively a NV4x, that's basically the DX9 feature set.
ARB_framebuffer_object is, in essence, a DX10 feature, but NVIDIA was able =
to
provide the software fallbacks for the cases in the ext that aren't handled,
and fast-path the cases that are. Nouveau hasn't done this. Patches welcome.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14815777200.Cd0c3.18101
Date: Mon, 12 Dec 2016 21:22:00 +0000
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
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033">bug 99033<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilya Indigo from <a href=3D"show_bug.cgi?id=3D990=
33#c7">comment #7</a>)
<span class=3D"quote">&gt; If this card is able to support later expansion,=
 which should be implemented
&gt; to the later video card, which shows a list of nvidia, why not add the=
m to
&gt; this card?</span >

They are using software to work around the hardware's limitations. That
software is not written for nouveau.

<span class=3D"quote">&gt; I thought, if in Mesa for nouveau declared suppo=
rt for OpenGL 4.1 at least,</span >

For GF100+ GPUs, yes. NV67 is a fair bit older.

<span class=3D"quote">&gt; the increasingly younger expansion should be imp=
lemented already, just
&gt; depending on the graphics card will connect them to a different set?
&gt;=20
&gt; Or something I do not understand, and for each GPU you write from scra=
tch
&gt; every extension?</span >

Each hardware generation supports what it supports. For NV67, which is
effectively a NV4x, that's basically the DX9 feature set.
ARB_framebuffer_object is, in essence, a DX10 feature, but NVIDIA was able =
to
provide the software fallbacks for the cases in the ext that aren't handled,
and fast-path the cases that are. Nouveau hasn't done this. Patches welcome=
.</pre>
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

--14815777200.Cd0c3.18101--

--===============0147648091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0147648091==--
