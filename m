From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Fri, 20 Nov 2015 22:47:37 +0000
Message-ID: <bug-71659-8800-olXmMTgYxS@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1355305554=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1355305554==
Content-Type: multipart/alternative; boundary="1448059657.4aac1.15181"; charset="UTF-8"


--1448059657.4aac1.15181
Date: Fri, 20 Nov 2015 22:47:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71659

--- Comment #27 from Viorel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu <rapitean=
u.catalin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm having the same problem on a Dell Latitude e6420 having an NVIDIA
Corporation GF119M [NVS 4200M] GPU with the following software installed:
xf86-video-nouveau 1.0.11+31+g1ff13a9-1
mesa 11.0.5-1
xorg-server 1.18.0-3

The error I'm getting on dmesg is the following:
[  215.375729] nouveau E[   PFIFO][0000:01:00.0] INTR 0x00800000

I've attached the complete Xorg log under the name "Xorg-21-11-15.log".

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1448059657.4aac1.15181
Date: Fri, 20 Nov 2015 22:47:37 +0000
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
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659">bug 71659<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rapiteanu.catalin&#64;gmail.com" title=3D"Viorel-C=C4=83t=C4=83lin R=C4=83p=
i=C8=9Beanu &lt;rapiteanu.catalin&#64;gmail.com&gt;"> <span class=3D"fn">Vi=
orel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu</span></a>
</span></b>
        <pre>I'm having the same problem on a Dell Latitude e6420 having an=
 NVIDIA
Corporation GF119M [NVS 4200M] GPU with the following software installed:
xf86-video-nouveau 1.0.11+31+g1ff13a9-1
mesa 11.0.5-1
xorg-server 1.18.0-3

The error I'm getting on dmesg is the following:
[  215.375729] nouveau E[   PFIFO][0000:01:00.0] INTR 0x00800000

I've attached the complete Xorg log under the name &quot;Xorg-21-11-15.log&=
quot;.</pre>
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

--1448059657.4aac1.15181--

--===============1355305554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1355305554==--
