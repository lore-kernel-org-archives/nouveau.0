From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Thu, 05 Feb 2015 16:22:13 +0000
Message-ID: <bug-88868-8800-YTWfZD3wRw@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1734594228=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1734594228==
Content-Type: multipart/alternative; boundary="1423153333.477F01.31966"; charset="UTF-8"


--1423153333.477F01.31966
Date: Thu, 5 Feb 2015 16:22:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D88868

--- Comment #27 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Dmitriy from comment #26)
> =D0=B1=D0=BB=D0=B8=D0=BD =D0=BA=D0=B0=D0=BA=D0=BE=D0=B9-=D1=82=D0=BE =D1=
=82=D1=80=D0=B5=D1=88,
>=20
> =D0=BE=D0=B4=D0=B8=D0=BD =D0=BF=D0=B8=D1=88=D0=B5=D1=82 =D0=BF=D1=80=D0=
=BE=D0=B8=D0=BD=D0=B8=D1=86=D0=B8=D0=B0=D0=BB=D0=B8=D0=B7=D0=B8=D1=80=D0=BE=
=D0=B2=D0=B0=D0=BD=D0=B0, =D0=B4=D1=80=D1=83=D0=B3=D0=BE=D0=B9 =D0=BD=D0=B5=
 =D0=BF=D1=80=D0=BE=D0=B8=D0=BD=D0=B8=D1=86=D0=B8=D0=B0=D0=BB=D0=B8=D0=B7=
=D0=B8=D1=80=D0=BE=D0=B2=D0=B0=D0=BD=D0=B0. (((

You're misunderstanding what is written. Your questions are being answered,=
 but
you're not asking the questions you think you are, and you're not understan=
ding
the answers in the way they're intended.

You do not have a BIOS, so the VBIOS does not get initialized into the PRAM=
IN
area of the video card (which would happen when the BIOS executes the 16-bit
x86 code in the option rom supplied by the video card). This is why the x86
boot is different from the PPC boot. But that's OK -- the VBIOS can come fr=
om
many places, one of which is the PROM. As you can see in your logs, the VBI=
OS
is successfully read out from there.

And you're getting graphics (albeit with messed up coloring), which is a pr=
etty
good indicator that the card is mostly coming up OK.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1423153333.477F01.31966
Date: Thu, 5 Feb 2015 16:22:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88868#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88868">bug 88868<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Dmitriy from <a href=3D"show_bug.cgi?id=3D88868#c=
26">comment #26</a>)
<span class=3D"quote">&gt; =D0=B1=D0=BB=D0=B8=D0=BD =D0=BA=D0=B0=D0=BA=D0=
=BE=D0=B9-=D1=82=D0=BE =D1=82=D1=80=D0=B5=D1=88,
&gt;=20
&gt; =D0=BE=D0=B4=D0=B8=D0=BD =D0=BF=D0=B8=D1=88=D0=B5=D1=82 =D0=BF=D1=80=
=D0=BE=D0=B8=D0=BD=D0=B8=D1=86=D0=B8=D0=B0=D0=BB=D0=B8=D0=B7=D0=B8=D1=80=D0=
=BE=D0=B2=D0=B0=D0=BD=D0=B0, =D0=B4=D1=80=D1=83=D0=B3=D0=BE=D0=B9 =D0=BD=D0=
=B5 =D0=BF=D1=80=D0=BE=D0=B8=D0=BD=D0=B8=D1=86=D0=B8=D0=B0=D0=BB=D0=B8=D0=
=B7=D0=B8=D1=80=D0=BE=D0=B2=D0=B0=D0=BD=D0=B0. (((</span >

You're misunderstanding what is written. Your questions are being answered,=
 but
you're not asking the questions you think you are, and you're not understan=
ding
the answers in the way they're intended.

You do not have a BIOS, so the VBIOS does not get initialized into the PRAM=
IN
area of the video card (which would happen when the BIOS executes the 16-bit
x86 code in the option rom supplied by the video card). This is why the x86
boot is different from the PPC boot. But that's OK -- the VBIOS can come fr=
om
many places, one of which is the PROM. As you can see in your logs, the VBI=
OS
is successfully read out from there.

And you're getting graphics (albeit with messed up coloring), which is a pr=
etty
good indicator that the card is mostly coming up OK.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423153333.477F01.31966--

--===============1734594228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1734594228==--
