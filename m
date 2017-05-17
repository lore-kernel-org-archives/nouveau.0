From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Wed, 17 May 2017 22:05:29 +0000
Message-ID: <bug-94990-8800-N2rAu6goRI@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1722114854=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1722114854==
Content-Type: multipart/alternative; boundary="14950587290.Abcaae6.10371";
 charset="UTF-8"


--14950587290.Abcaae6.10371
Date: Wed, 17 May 2017 22:05:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #123 from Miko=C5=82aj =C5=9Awi=C4=85tek <mikolaj.swiatek@gmail=
.com> ---
As an owner of a MSI GTX970 4G, I can confirm that with 4.12-rc1, I can boot
perfectly fine with a single monitor connected, and with Mesa 17.1.0 on the
userspace side, my user experience with KDE Plasma is thus far
indistinguishable from the NVIDIA blob. Awesome work there, kudos.

Plasma's Wayland session does freeze shortly after login, but that's not
supposed to be mature and can be caused by any amount of things.

Now, if I try to add a second monitor, I get corrupted output after modeset
seemingly, but I'm pretty sure that's bug 89664.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14950587290.Abcaae6.10371
Date: Wed, 17 May 2017 22:05:29 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c123">Comme=
nt # 123</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikolaj.swiatek&#64;gmail.com" title=3D"Miko=C5=82aj =C5=9Awi=C4=85tek &lt;=
mikolaj.swiatek&#64;gmail.com&gt;"> <span class=3D"fn">Miko=C5=82aj =C5=9Aw=
i=C4=85tek</span></a>
</span></b>
        <pre>As an owner of a MSI GTX970 4G, I can confirm that with 4.12-r=
c1, I can boot
perfectly fine with a single monitor connected, and with Mesa 17.1.0 on the
userspace side, my user experience with KDE Plasma is thus far
indistinguishable from the NVIDIA blob. Awesome work there, kudos.

Plasma's Wayland session does freeze shortly after login, but that's not
supposed to be mature and can be caused by any amount of things.

Now, if I try to add a second monitor, I get corrupted output after modeset
seemingly, but I'm pretty sure that's <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"show_bug.cgi?id=3D89664">bug 89664</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14950587290.Abcaae6.10371--

--===============1722114854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1722114854==--
