From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Fri, 08 May 2015 18:33:43 +0000
Message-ID: <bug-78439-8800-xt6nN7Z0ge@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1800942021=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78439-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1800942021==
Content-Type: multipart/alternative; boundary="1431110023.7Ed3Bd41.2053"; charset="UTF-8"


--1431110023.7Ed3Bd41.2053
Date: Fri, 8 May 2015 18:33:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78439

--- Comment #25 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
Created attachment 115644
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D115644&action=3Dedit
dmesg.txt.xz (lower modes, reattaching)

only the lower modes are enabled:

{  324000, 0x06, 2 },
{  162000, 0x06, 1 }

When booting, everything starts fine. After reattaching DP connector, the r=
ight
side of the screen flickers. (Note that flickering in 648 mode is more seve=
re,
affects the whole screen and even causes blinking of the screen)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1431110023.7Ed3Bd41.2053
Date: Fri, 8 May 2015 18:33:43 +0000
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
   title=3D"NEW - [NVC1] Display corruption when DP connector is reattached"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] Display corruption when DP connector is reattached"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439">bug 78439<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrius&#64;stikonas.eu" title=3D"Andrius =C5=A0tikonas &lt;andrius&#64;sti=
konas.eu&gt;"> <span class=3D"fn">Andrius =C5=A0tikonas</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D115644=
" name=3D"attach_115644" title=3D"dmesg.txt.xz (lower modes, reattaching)">=
attachment 115644</a> <a href=3D"attachment.cgi?id=3D115644&amp;action=3Ded=
it" title=3D"dmesg.txt.xz (lower modes, reattaching)">[details]</a></span>
dmesg.txt.xz (lower modes, reattaching)

only the lower modes are enabled:

{  324000, 0x06, 2 },
{  162000, 0x06, 1 }

When booting, everything starts fine. After reattaching DP connector, the r=
ight
side of the screen flickers. (Note that flickering in 648 mode is more seve=
re,
affects the whole screen and even causes blinking of the screen)</pre>
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

--1431110023.7Ed3Bd41.2053--

--===============1800942021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1800942021==--
