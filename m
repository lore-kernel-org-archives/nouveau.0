From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100446] Backlight control not working on Pascal /
 GP106 using nouveau drivers
Date: Tue, 16 May 2017 11:20:26 +0000
Message-ID: <bug-100446-8800-vo5TsqowiM@http.bugs.freedesktop.org/>
References: <bug-100446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1888099166=="
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


--===============1888099166==
Content-Type: multipart/alternative; boundary="14949336260.C2bbCDA8a.5796";
 charset="UTF-8"


--14949336260.C2bbCDA8a.5796
Date: Tue, 16 May 2017 11:20:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100446

--- Comment #4 from Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> ---
For the sake of completeness some more info on this.

The two settings differ only for couple of accesses:

< MMIO32 W 0x00d980 0x000000ff PGPIO+0x980 <=3D 0xff
---
> MMIO32 W 0x00d980 0x0000007f PGPIO+0x980 <=3D 0x7f

< MMIO32 W 0x619484 0x0000ff00 PDISPLAY.VGA.CR+0x84 <=3D 0xff00
---
> MMIO32 W 0x619484 0x00007000 PDISPLAY.VGA.CR+0x84 <=3D 0x7000

The problem is that poking at those registers using nvapeek / nvapoke doesn=
't
change the brightness.

Also trying to use nvammiotracereplay to reply step-by-step the mmio trace =
has
no effect on the brightness.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14949336260.C2bbCDA8a.5796
Date: Tue, 16 May 2017 11:20:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446">bug 10044=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carlo&#64;caione.org" title=3D"Carlo Caione &lt;carlo&#64;caione.org&gt;"> =
<span class=3D"fn">Carlo Caione</span></a>
</span></b>
        <pre>For the sake of completeness some more info on this.

The two settings differ only for couple of accesses:

&lt; MMIO32 W 0x00d980 0x000000ff PGPIO+0x980 &lt;=3D 0xff
---
<span class=3D"quote">&gt; MMIO32 W 0x00d980 0x0000007f PGPIO+0x980 &lt;=3D=
 0x7f</span >

&lt; MMIO32 W 0x619484 0x0000ff00 PDISPLAY.VGA.CR+0x84 &lt;=3D 0xff00
---
<span class=3D"quote">&gt; MMIO32 W 0x619484 0x00007000 PDISPLAY.VGA.CR+0x8=
4 &lt;=3D 0x7000</span >

The problem is that poking at those registers using nvapeek / nvapoke doesn=
't
change the brightness.

Also trying to use nvammiotracereplay to reply step-by-step the mmio trace =
has
no effect on the brightness.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14949336260.C2bbCDA8a.5796--

--===============1888099166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1888099166==--
