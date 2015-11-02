From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Mon, 02 Nov 2015 09:21:59 +0000
Message-ID: <bug-90626-8800-tn9VQHqglh@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1043318819=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1043318819==
Content-Type: multipart/alternative; boundary="1446456121.5376E3.7926"; charset="UTF-8"


--1446456121.5376E3.7926
Date: Mon, 2 Nov 2015 09:22:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #31 from Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> ---
The delays during boot are not caused by the bios shadow code but by this:
[    5.878439] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)
[    7.877714] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)
[    9.876992] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)
[   11.876268] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)

So I think you could simply scrap the "fast" version and always use the 4K
"slow" version for compatibility.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446456121.5376E3.7926
Date: Mon, 2 Nov 2015 09:22:01 +0000
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
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c31">Commen=
t # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
odi&#64;odi.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span c=
lass=3D"fn">Ortwin Gl=C3=BCck</span></a>
</span></b>
        <pre>The delays during boot are not caused by the bios shadow code =
but by this:
[    5.878439] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)
[    7.877714] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)
[    9.876992] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)
[   11.876268] nouveau E[  PGRAPH][0000:01:00.0] wait for idle timeout (en:=
 1,
ctxsw: 0, busy: 1)

So I think you could simply scrap the &quot;fast&quot; version and always u=
se the 4K
&quot;slow&quot; version for compatibility.</pre>
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

--1446456121.5376E3.7926--

--===============1043318819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1043318819==--
