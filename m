From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98630] Bad color and glitches on PPC64
Date: Tue, 08 Nov 2016 15:08:59 +0000
Message-ID: <bug-98630-8800-GJm4bQ5IM3@http.bugs.freedesktop.org/>
References: <bug-98630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2042024112=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2042024112==
Content-Type: multipart/alternative; boundary="14786177390.Ae8B1.11902";
 charset="UTF-8"


--14786177390.Ae8B1.11902
Date: Tue, 8 Nov 2016 15:08:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98630

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Mingcong Bai from comment #17)
> Suspecting that this could still be an application-based issue, I have fi=
led
> some issues to GNOME and KDE developers, as their desktop environment have
> the same coloring issue while XFCE and MATE worked just fine:
>=20
> - https://bugs.kde.org/show_bug.cgi?id=3D372202
> - https://bugzilla.gnome.org/show_bug.cgi?id=3D774085

Could you confirm that nouveau.nomodeset=3D1 (+ fbdev) produces these bad e=
ffects
as well? Should be able to use offb assuming that OF knows how to deal with
your GPU.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14786177390.Ae8B1.11902
Date: Tue, 8 Nov 2016 15:08:59 +0000
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
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630">bug 98630<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Mingcong Bai from <a href=3D"show_bug.cgi?id=3D98=
630#c17">comment #17</a>)
<span class=3D"quote">&gt; Suspecting that this could still be an applicati=
on-based issue, I have filed
&gt; some issues to GNOME and KDE developers, as their desktop environment =
have
&gt; the same coloring issue while XFCE and MATE worked just fine:
&gt;=20
&gt; - <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D372202">https://bu=
gs.kde.org/show_bug.cgi?id=3D372202</a>
&gt; - <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D774085">http=
s://bugzilla.gnome.org/show_bug.cgi?id=3D774085</a></span >

Could you confirm that nouveau.nomodeset=3D1 (+ fbdev) produces these bad e=
ffects
as well? Should be able to use offb assuming that OF knows how to deal with
your GPU.</pre>
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

--14786177390.Ae8B1.11902--

--===============2042024112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2042024112==--
