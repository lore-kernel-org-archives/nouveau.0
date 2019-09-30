From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111868] xorg with nouveau crash when starting
 mate-session in debian 10
Date: Mon, 30 Sep 2019 13:31:19 +0000
Message-ID: <bug-111868-8800-XSYPjoucdj@http.bugs.freedesktop.org/>
References: <bug-111868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0984845548=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0984845548==
Content-Type: multipart/alternative; boundary="15698502790.2200a7e.27394"
Content-Transfer-Encoding: 7bit


--15698502790.2200a7e.27394
Date: Mon, 30 Sep 2019 13:31:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111868

--- Comment #5 from alain.prignet-oQvnLCQn66E@public.gmane.org ---
Yes I have a fool-proof sequence to reproduce it, even not using gdm3 or
lightdm.

I can reproduce it using "startx" and an .xinitrc containing only
"exec mate-session". Since the computer does not freeze, I can reproducing =
at
demand.

(The bug is not show when having in .xinitrc "exec xfce4-session", or when
using gdm3 or lightdm with xfce, even if launching mate-session during the
xfce4 session)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698502790.2200a7e.27394
Date: Mon, 30 Sep 2019 13:31:19 +0000
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
   title=3D"NEW - xorg with nouveau crash when starting mate-session in deb=
ian 10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111868#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg with nouveau crash when starting mate-session in deb=
ian 10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111868">bug 11186=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alain.prignet&#64;u-pem.fr" title=3D"alain.prignet&#64;u-pem.fr">alain.prig=
net&#64;u-pem.fr</a>
</span></b>
        <pre>Yes I have a fool-proof sequence to reproduce it, even not usi=
ng gdm3 or
lightdm.

I can reproduce it using &quot;startx&quot; and an .xinitrc containing only
&quot;exec mate-session&quot;. Since the computer does not freeze, I can re=
producing at
demand.

(The bug is not show when having in .xinitrc &quot;exec xfce4-session&quot;=
, or when
using gdm3 or lightdm with xfce, even if launching mate-session during the
xfce4 session)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698502790.2200a7e.27394--

--===============0984845548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0984845548==--
