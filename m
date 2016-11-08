From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98630] Bad color and glitches on PPC64
Date: Tue, 08 Nov 2016 15:12:10 +0000
Message-ID: <bug-98630-8800-LiKTPvstKV@http.bugs.freedesktop.org/>
References: <bug-98630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1572154288=="
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


--===============1572154288==
Content-Type: multipart/alternative; boundary="14786179290.3dfC3a2c.12374";
 charset="UTF-8"


--14786179290.3dfC3a2c.12374
Date: Tue, 8 Nov 2016 15:12:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98630

--- Comment #19 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #18)
> (In reply to Mingcong Bai from comment #17)
> > Suspecting that this could still be an application-based issue, I have =
filed
> > some issues to GNOME and KDE developers, as their desktop environment h=
ave
> > the same coloring issue while XFCE and MATE worked just fine:
> >=20
> > - https://bugs.kde.org/show_bug.cgi?id=3D372202
> > - https://bugzilla.gnome.org/show_bug.cgi?id=3D774085
>=20
> Could you confirm that nouveau.nomodeset=3D1 (+ fbdev) produces these bad
> effects as well? Should be able to use offb assuming that OF knows how to
> deal with your GPU.

Er, sorry - that should have been "nomodeset" bare in the kernel cmdline. Or
"nouveau.modeset=3D0". I think.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14786179290.3dfC3a2c.12374
Date: Tue, 8 Nov 2016 15:12:09 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630">bug 98630<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D986=
30#c18">comment #18</a>)
<span class=3D"quote">&gt; (In reply to Mingcong Bai from <a href=3D"show_b=
ug.cgi?id=3D98630#c17">comment #17</a>)
&gt; &gt; Suspecting that this could still be an application-based issue, I=
 have filed
&gt; &gt; some issues to GNOME and KDE developers, as their desktop environ=
ment have
&gt; &gt; the same coloring issue while XFCE and MATE worked just fine:
&gt; &gt;=20
&gt; &gt; - <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D372202">https=
://bugs.kde.org/show_bug.cgi?id=3D372202</a>
&gt; &gt; - <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D774085"=
>https://bugzilla.gnome.org/show_bug.cgi?id=3D774085</a>
&gt;=20
&gt; Could you confirm that nouveau.nomodeset=3D1 (+ fbdev) produces these =
bad
&gt; effects as well? Should be able to use offb assuming that OF knows how=
 to
&gt; deal with your GPU.</span >

Er, sorry - that should have been &quot;nomodeset&quot; bare in the kernel =
cmdline. Or
&quot;nouveau.modeset=3D0&quot;. I think.</pre>
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

--14786179290.3dfC3a2c.12374--

--===============1572154288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1572154288==--
