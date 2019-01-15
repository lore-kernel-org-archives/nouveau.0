From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109341] Plasma Wayland locks up immediately on sign
 in
Date: Tue, 15 Jan 2019 01:30:32 +0000
Message-ID: <bug-109341-8800-BN0lYEnU1N@http.bugs.freedesktop.org/>
References: <bug-109341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0228597942=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0228597942==
Content-Type: multipart/alternative; boundary="15475158320.963f5feA2.24970"
Content-Transfer-Encoding: 7bit


--15475158320.963f5feA2.24970
Date: Tue, 15 Jan 2019 01:30:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109341

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to etna from comment #5)
> Do you mean to say that this issue 'should' not appear on newer releases =
of
> Mesa?
>=20
> Reason being on my current setup Gnome Wayland and Weston are working fine
> under Mesa 18.0.5. It's just Plasma Wayland causing the lockups.
>=20
> I also tested running a nested Wayland session in Weston and then startin=
g a
> Plasma Wayland session in that nested session. No dice; locks up the syst=
em
> as well. :(

No. I'm saying that there are patches that improve nouveau's handling of
multi-threaded GL usage, but they're against latest mesa version, not somet=
hing
older.

Plasma + nouveau have, generally, not played very well together.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15475158320.963f5feA2.24970
Date: Tue, 15 Jan 2019 01:30:32 +0000
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
   title=3D"NEW - Plasma Wayland locks up immediately on sign in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109341#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Plasma Wayland locks up immediately on sign in"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109341">bug 10934=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to etna from <a href=3D"show_bug.cgi?id=3D109341#c5"=
>comment #5</a>)
<span class=3D"quote">&gt; Do you mean to say that this issue 'should' not =
appear on newer releases of
&gt; Mesa?
&gt;=20
&gt; Reason being on my current setup Gnome Wayland and Weston are working =
fine
&gt; under Mesa 18.0.5. It's just Plasma Wayland causing the lockups.
&gt;=20
&gt; I also tested running a nested Wayland session in Weston and then star=
ting a
&gt; Plasma Wayland session in that nested session. No dice; locks up the s=
ystem
&gt; as well. :(</span >

No. I'm saying that there are patches that improve nouveau's handling of
multi-threaded GL usage, but they're against latest mesa version, not somet=
hing
older.

Plasma + nouveau have, generally, not played very well together.</pre>
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

--15475158320.963f5feA2.24970--

--===============0228597942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0228597942==--
