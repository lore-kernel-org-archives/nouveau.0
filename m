From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102106] xorg crashes when running gscan2pdf
 (libgtk2-perl) test case
Date: Thu, 10 Aug 2017 17:53:52 +0000
Message-ID: <bug-102106-8800-HJ6JQO2jS5@http.bugs.freedesktop.org/>
References: <bug-102106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0911476386=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0911476386==
Content-Type: multipart/alternative; boundary="15023876311.C853C4dA.12119";
 charset="UTF-8"


--15023876311.C853C4dA.12119
Date: Thu, 10 Aug 2017 17:53:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102106

--- Comment #7 from jffry-VwIFZPTo/vqsTnJN9+BGXg@public.gmane.org ---
X.Org X Server 1.19.3
Module nouveau: vendor=3D"X.Org Foundation"
[    18.179]    compiled for 1.19.3, module version =3D 1.0.15

NOUVEAU(0): Chipset: "NVIDIA NVC1"
nouveau 0000:01:00.0: NVIDIA GF108

I'd be happy to do some more debugging if you can help me get some useful
information out of the crash.

Unfortunately, as I said before, as long as gdb is attached to the process,=
 and
the -dbg package is installed, xorg does not crash.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15023876311.C853C4dA.12119
Date: Thu, 10 Aug 2017 17:53:51 +0000
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
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106">bug 10210=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jffry&#64;posteo.net" title=3D"jffry&#64;posteo.net">jffry&#64;posteo.net</=
a>
</span></b>
        <pre>X.Org X Server 1.19.3
Module nouveau: vendor=3D&quot;X.Org Foundation&quot;
[    18.179]    compiled for 1.19.3, module version =3D 1.0.15

NOUVEAU(0): Chipset: &quot;NVIDIA NVC1&quot;
nouveau 0000:01:00.0: NVIDIA GF108

I'd be happy to do some more debugging if you can help me get some useful
information out of the crash.

Unfortunately, as I said before, as long as gdb is attached to the process,=
 and
the -dbg package is installed, xorg does not crash.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15023876311.C853C4dA.12119--

--===============0911476386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0911476386==--
