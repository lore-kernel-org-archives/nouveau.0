From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108520] [GK104] MST DisplayPort HiDPI screen flicker
Date: Tue, 23 Oct 2018 20:29:42 +0000
Message-ID: <bug-108520-8800-kpn687wcie@http.bugs.freedesktop.org/>
References: <bug-108520-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1845492154=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108520-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1845492154==
Content-Type: multipart/alternative; boundary="15403265821.23950.26240"
Content-Transfer-Encoding: 7bit


--15403265821.23950.26240
Date: Tue, 23 Oct 2018 20:29:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108520

--- Comment #7 from JM9 <jhnmlkvch9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to JM9 from comment #6)
> (In reply to Ilia Mirkin from comment #5)
> > OK, so ...
> >=20
> > A few facts:
> >=20
> >  - GK104
> >  - Driving 4 monitors
> >=20
> > Question: Are the 2560x1440 and 1920x1200 daisy-chained (hence the "MST"
> > reference), or is it just that the 2560x1440 monitor's manufacturer nam=
e is
> > "MST", without any reference to Multi-Stream Transport?
>=20
> They are not daisy-chained. I'm not sure about the MST reference. I think
> this is  a regression in X11 1.20. I filed a separate bug about that:
> https://bugzilla.freedesktop.org/show_bug.cgi?id=3D108516
> (If Hybrid Graphics is enabled, MST reference is gone.)
>=20

Scratch that. I was being confused. The MST reference is still there, but t=
he
naming scheme is different.

> Another odd thing I noticed is, if I start X and then hot plug the monito=
r,
> there is no flicker.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15403265821.23950.26240
Date: Tue, 23 Oct 2018 20:29:42 +0000
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
   title=3D"NEW - [GK104] MST DisplayPort HiDPI screen flicker"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108520#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GK104] MST DisplayPort HiDPI screen flicker"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108520">bug 10852=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jhnmlkvch9&#64;gmail.com" title=3D"JM9 &lt;jhnmlkvch9&#64;gmail.com&gt;"> <=
span class=3D"fn">JM9</span></a>
</span></b>
        <pre>(In reply to JM9 from <a href=3D"show_bug.cgi?id=3D108520#c6">=
comment #6</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D108520#c5">comment #5</a>)
&gt; &gt; OK, so ...
&gt; &gt;=20
&gt; &gt; A few facts:
&gt; &gt;=20
&gt; &gt;  - GK104
&gt; &gt;  - Driving 4 monitors
&gt; &gt;=20
&gt; &gt; Question: Are the 2560x1440 and 1920x1200 daisy-chained (hence th=
e &quot;MST&quot;
&gt; &gt; reference), or is it just that the 2560x1440 monitor's manufactur=
er name is
&gt; &gt; &quot;MST&quot;, without any reference to Multi-Stream Transport?
&gt;=20
&gt; They are not daisy-chained. I'm not sure about the MST reference. I th=
ink
&gt; this is  a regression in X11 1.20. I filed a separate bug about that:
&gt; <a href=3D"https://bugzilla.freedesktop.org/show_bug.cgi?id=3D108516">=
https://bugzilla.freedesktop.org/show_bug.cgi?id=3D108516</a>
&gt; (If Hybrid Graphics is enabled, MST reference is gone.)
&gt; </span >

Scratch that. I was being confused. The MST reference is still there, but t=
he
naming scheme is different.

<span class=3D"quote">&gt; Another odd thing I noticed is, if I start X and=
 then hot plug the monitor,
&gt; there is no flicker.</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15403265821.23950.26240--

--===============1845492154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1845492154==--
