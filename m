From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101220] [NV137/GP107] xorg-server-1.19.3 crashes
 when trying to enable HDMI output
Date: Thu, 14 Sep 2017 10:31:51 +0000
Message-ID: <bug-101220-8800-wW9m7hRMiG@http.bugs.freedesktop.org/>
References: <bug-101220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960676254=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0960676254==
Content-Type: multipart/alternative; boundary="15053851112.4e3c.5033";
 charset="UTF-8"


--15053851112.4e3c.5033
Date: Thu, 14 Sep 2017 10:31:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101220

--- Comment #18 from Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> ---
(In reply to Carlo Caione from comment #16)
> Created attachment 133924 [details] [review]
> [PATCH] Don't advertise any PRIME offloading capabilities without
> acceleration
>=20
> (In reply to Michel D=C3=A4nzer from comment #6)
> > (In reply to Ilia Mirkin from comment #5)
> > > I wonder if this is due to the fact that it's running in NoAccel mode.
> >=20
> > Possibly, you might want something like
> >=20
> > https://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/
> > ?id=3Db19417e2fddf4df725951aea5ad5e9558338f59e
>=20
> Something like this for nouveau?

ping on this patch. It's not the solution for the underlying problem but at
least it's nice to have Xorg not crashing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15053851112.4e3c.5033
Date: Thu, 14 Sep 2017 10:31:51 +0000
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
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220">bug 10122=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carlo&#64;caione.org" title=3D"Carlo Caione &lt;carlo&#64;caione.org&gt;"> =
<span class=3D"fn">Carlo Caione</span></a>
</span></b>
        <pre>(In reply to Carlo Caione from <a href=3D"show_bug.cgi?id=3D10=
1220#c16">comment #16</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D133924" name=3D"attach_133924" title=3D"[PATCH] Don't advertise any=
 PRIME offloading capabilities without acceleration">attachment 133924</a> =
<a href=3D"attachment.cgi?id=3D133924&amp;action=3Dedit" title=3D"[PATCH] D=
on't advertise any PRIME offloading capabilities without acceleration">[det=
ails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D101220&am=
p;attachment=3D133924'>[review]</a> [review]
&gt; [PATCH] Don't advertise any PRIME offloading capabilities without
&gt; acceleration
&gt;=20
&gt; (In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?id=3D1012=
20#c6">comment #6</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D101220=
#c5">comment #5</a>)
&gt; &gt; &gt; I wonder if this is due to the fact that it's running in NoA=
ccel mode.
&gt; &gt;=20
&gt; &gt; Possibly, you might want something like
&gt; &gt;=20
&gt; &gt; <a href=3D"https://cgit.freedesktop.org/xorg/driver/xf86-video-at=
i/commit/">https://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/<=
/a>
&gt; &gt; ?id=3Db19417e2fddf4df725951aea5ad5e9558338f59e
&gt;=20
&gt; Something like this for nouveau?</span >

ping on this patch. It's not the solution for the underlying problem but at
least it's nice to have Xorg not crashing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15053851112.4e3c.5033--

--===============0960676254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0960676254==--
