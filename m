From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Tue, 28 Oct 2014 02:41:06 +0000
Message-ID: <bug-81136-8800-tn8YcE5DiI@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2118245658=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2118245658==
Content-Type: multipart/alternative; boundary="1414464066.cfDf22.23385"; charset="UTF-8"


--1414464066.cfDf22.23385
Date: Tue, 28 Oct 2014 02:41:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D81136

--- Comment #11 from Agust=C3=ADn Dall'Alba <agustin-G80yVrlpk+aH0oMTQjrRWA@public.gmane.org> ---
On 3.14.22 I get no FAULTs and suspend works fine.

On linux 3.17.1 I get a FAULT at 0x00e070 and 0x00e074 on boot, suspend,
resume, and when plugging the second monitor for the first time. But I can't
reproduce a FAULT at 0x00e180 in any way. Checking the logs it looks like i=
t's
quite rare (it happens every twenty or so FAULTs) and unrelated to the seco=
nd
monitor.
If I use the nouveau.nofbaccel=3D1 (only) one of the monitors comes back af=
ter
resume. If I don't I get the gabled display, 'GPU lockup' and PGRAPH errors=
 as
in the original post.

I'm downloading linux mainline now to test.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1414464066.cfDf22.23385
Date: Tue, 28 Oct 2014 02:41:06 +0000
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
   title=3D"NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136">bug 81136<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
agustin&#64;dallalba.com.ar" title=3D"Agust=C3=ADn Dall'Alba &lt;agustin&#6=
4;dallalba.com.ar&gt;"> <span class=3D"fn">Agust=C3=ADn Dall'Alba</span></a>
</span></b>
        <pre>On 3.14.22 I get no FAULTs and suspend works fine.

On linux 3.17.1 I get a FAULT at 0x00e070 and 0x00e074 on boot, suspend,
resume, and when plugging the second monitor for the first time. But I can't
reproduce a FAULT at 0x00e180 in any way. Checking the logs it looks like i=
t's
quite rare (it happens every twenty or so FAULTs) and unrelated to the seco=
nd
monitor.
If I use the nouveau.nofbaccel=3D1 (only) one of the monitors comes back af=
ter
resume. If I don't I get the gabled display, 'GPU lockup' and PGRAPH errors=
 as
in the original post.

I'm downloading linux mainline now to test.</pre>
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

--1414464066.cfDf22.23385--

--===============2118245658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2118245658==--
