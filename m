From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100446] Backlight control not working on Pascal /
 GP106 using nouveau drivers
Date: Thu, 22 Mar 2018 14:26:52 +0000
Message-ID: <bug-100446-8800-oiBqDRG0rj@http.bugs.freedesktop.org/>
References: <bug-100446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591658588=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100446-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0591658588==
Content-Type: multipart/alternative; boundary="15217288122.C7585a.22490"
Content-Transfer-Encoding: 7bit


--15217288122.C7585a.22490
Date: Thu, 22 Mar 2018 14:26:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100446

--- Comment #7 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Carlo Caione from comment #4)
> For the sake of completeness some more info on this.
>=20
> The two settings differ only for couple of accesses:
>=20
> < MMIO32 W 0x00d980 0x000000ff PGPIO+0x980 <=3D 0xff
> ---
> > MMIO32 W 0x00d980 0x0000007f PGPIO+0x980 <=3D 0x7f
>=20
> < MMIO32 W 0x619484 0x0000ff00 PDISPLAY.VGA.CR+0x84 <=3D 0xff00
> ---
> > MMIO32 W 0x619484 0x00007000 PDISPLAY.VGA.CR+0x84 <=3D 0x7000
>=20
> The problem is that poking at those registers using nvapeek / nvapoke
> doesn't change the brightness.
>=20
> Also trying to use nvammiotracereplay to reply step-by-step the mmio trace
> has no effect on the brightness.

Can you check that this is fixed in 4.16-rc6? A fix landed to address backl=
ight
problems and it might be the same you had:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv4.16-rc6&id=3D9e75dc61eaa9acd1bff83c3b814ac2af6dc1f64c

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15217288122.C7585a.22490
Date: Thu, 22 Mar 2018 14:26:52 +0000
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
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446">bug 10044=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Carlo Caione from <a href=3D"show_bug.cgi?id=3D10=
0446#c4">comment #4</a>)
<span class=3D"quote">&gt; For the sake of completeness some more info on t=
his.
&gt;=20
&gt; The two settings differ only for couple of accesses:
&gt;=20
&gt; &lt; MMIO32 W 0x00d980 0x000000ff PGPIO+0x980 &lt;=3D 0xff
&gt; ---
&gt; &gt; MMIO32 W 0x00d980 0x0000007f PGPIO+0x980 &lt;=3D 0x7f
&gt;=20
&gt; &lt; MMIO32 W 0x619484 0x0000ff00 PDISPLAY.VGA.CR+0x84 &lt;=3D 0xff00
&gt; ---
&gt; &gt; MMIO32 W 0x619484 0x00007000 PDISPLAY.VGA.CR+0x84 &lt;=3D 0x7000
&gt;=20
&gt; The problem is that poking at those registers using nvapeek / nvapoke
&gt; doesn't change the brightness.
&gt;=20
&gt; Also trying to use nvammiotracereplay to reply step-by-step the mmio t=
race
&gt; has no effect on the brightness.</span >

Can you check that this is fixed in 4.16-rc6? A fix landed to address backl=
ight
problems and it might be the same you had:
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?h=3Dv4.16-rc6&amp;id=3D9e75dc61eaa9acd1bff83c3b814ac2af6dc1f64c"=
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?h=3Dv4.16-rc6&amp;id=3D9e75dc61eaa9acd1bff83c3b814ac2af6dc1f64c</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15217288122.C7585a.22490--

--===============0591658588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0591658588==--
