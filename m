From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] KDE plasma locks randomly due to crash of
	nouveau driver
Date: Mon, 16 Nov 2015 21:14:16 +0000
Message-ID: <bug-92971-8800-UUJMHdueLJ@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1395168117=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1395168117==
Content-Type: multipart/alternative; boundary="1447708455.4A358E0.12065"; charset="UTF-8"


--1447708455.4A358E0.12065
Date: Mon, 16 Nov 2015 21:14:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92971

--- Comment #2 from Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> ---
Hello here the output:

Mesa version
# rpm -aq Mesa*
Mesa-libGLESv2-2-11.0.4-125.1.x86_64
Mesa-libEGL1-11.0.4-125.1.x86_64
Mesa-libglapi0-32bit-11.0.4-125.1.x86_64
Mesa-32bit-11.0.4-125.1.x86_64
Mesa-libGL1-11.0.4-125.1.x86_64
Mesa-libGL-devel-11.0.4-125.1.x86_64
Mesa-libglapi0-11.0.4-125.1.x86_64
Mesa-libEGL-devel-11.0.4-125.1.x86_64
Mesa-libEGL1-32bit-11.0.4-125.1.x86_64
Mesa-11.0.4-125.1.x86_64
Mesa-libGL1-32bit-11.0.4-125.1.x86_64

VIDEO Card

lspci -nn -d 10de::300=20
0a:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF100GL [Quadro
4000] [10de:06dd] (rev a1)

Regards
Philippe

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447708455.4A358E0.12065
Date: Mon, 16 Nov 2015 21:14:15 +0000
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
   title=3D"NEW - KDE plasma locks randomly due to crash of nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KDE plasma locks randomly due to crash of nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971">bug 92971<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>Hello here the output:

Mesa version
# rpm -aq Mesa*
Mesa-libGLESv2-2-11.0.4-125.1.x86_64
Mesa-libEGL1-11.0.4-125.1.x86_64
Mesa-libglapi0-32bit-11.0.4-125.1.x86_64
Mesa-32bit-11.0.4-125.1.x86_64
Mesa-libGL1-11.0.4-125.1.x86_64
Mesa-libGL-devel-11.0.4-125.1.x86_64
Mesa-libglapi0-11.0.4-125.1.x86_64
Mesa-libEGL-devel-11.0.4-125.1.x86_64
Mesa-libEGL1-32bit-11.0.4-125.1.x86_64
Mesa-11.0.4-125.1.x86_64
Mesa-libGL1-32bit-11.0.4-125.1.x86_64

VIDEO Card

lspci -nn -d 10de::300=20
0a:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF100GL [Quadro
4000] [10de:06dd] (rev a1)

Regards
Philippe</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447708455.4A358E0.12065--

--===============1395168117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1395168117==--
