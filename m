From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108982] GM206: MMIO write of 800000ec FAULT at
 10eb14 [ IBUS ]
Date: Thu, 20 Dec 2018 16:54:13 +0000
Message-ID: <bug-108982-8800-cMno1uU6xa@http.bugs.freedesktop.org/>
References: <bug-108982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0985661417=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108982-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0985661417==
Content-Type: multipart/alternative; boundary="15453248520.97cA71.14375"
Content-Transfer-Encoding: 7bit


--15453248520.97cA71.14375
Date: Thu, 20 Dec 2018 16:54:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108982

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Johnny B. Goode from comment #5)
> Created attachment 142870 [details]
> Rom
>=20
> Rom bios because Asus made few cards GTX 950 with different bioses
> hxxps://www.techpowerup.com/vgabios/
> ?architecture=3DNVIDIA&manufacturer=3DAsus&model=3DGTX+950&interface=3D&m=
emType=3D&memS
> ize=3D&since=3D
> Mine is 84.06.3d.00.6f

I was referring to the firmware that's supplied by NVIDIA in linux-firmware,
which has to be loaded to operate any of the acceleration components of the
board.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15453248520.97cA71.14375
Date: Thu, 20 Dec 2018 16:54:12 +0000
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
   title=3D"NEW - GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108982#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108982">bug 10898=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Johnny B. Goode from <a href=3D"show_bug.cgi?id=
=3D108982#c5">comment #5</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D142870" name=3D"attach_142870" title=3D"Rom">attachment 142870</a> =
<a href=3D"attachment.cgi?id=3D142870&amp;action=3Dedit" title=3D"Rom">[det=
ails]</a></span>
&gt; Rom
&gt;=20
&gt; Rom bios because Asus made few cards GTX 950 with different bioses
&gt; hxxps://www.techpowerup.com/vgabios/
&gt; ?architecture=3DNVIDIA&amp;manufacturer=3DAsus&amp;model=3DGTX+950&amp=
;interface=3D&amp;memType=3D&amp;memS
&gt; ize=3D&amp;since=3D
&gt; Mine is 84.06.3d.00.6f</span >

I was referring to the firmware that's supplied by NVIDIA in linux-firmware,
which has to be loaded to operate any of the acceleration components of the
board.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15453248520.97cA71.14375--

--===============0985661417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0985661417==--
