From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] [NVE6] Xorg random freeze
Date: Fri, 22 Jul 2016 08:22:00 +0000
Message-ID: <bug-92922-8800-P42veo9A4O@http.bugs.freedesktop.org/>
References: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0151723665=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0151723665==
Content-Type: multipart/alternative; boundary="14691757190.A2A2E5eAA.1202";
 charset="UTF-8"


--14691757190.A2A2E5eAA.1202
Date: Fri, 22 Jul 2016 08:21:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92922

--- Comment #6 from Victor Zhavoronkov <ishido.uu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Seems that I am hitting same bug while using Opera browser on my Fedora 24
Workstation (GNOME) with NVidia GTX 650 Ti. Desktop freezes completely,
keyboard and mouse are not responding.

Part of journald log:

Jul 22 10:58:15 localhost.localdomain kernel: nouveau 0000:01:00.0: gr: TRA=
P ch
9 [003f548000 gnome-shell[1489]]
Jul 22 10:58:15 localhost.localdomain kernel: nouveau 0000:01:00.0: gr:
GPC0/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x =3D 128, y =3D 64, =
format =3D
0, storage type =3D fe
Jul 22 10:58:15 localhost.localdomain kernel: nouveau 0000:01:00.0: gr:
GPC1/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x =3D 80, y =3D 64, f=
ormat =3D
0, storage type =3D fe

Package versions:

kernel - 4.6.3
mesa - 12.0.1
xorg-x11-drv-nouveau - 1.0.12

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14691757190.A2A2E5eAA.1202
Date: Fri, 22 Jul 2016 08:21:59 +0000
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
   title=3D"NEW - [NVE6] Xorg random freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92922#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] Xorg random freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92922">bug 92922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ishido.uu&#64;gmail.com" title=3D"Victor Zhavoronkov &lt;ishido.uu&#64;gmai=
l.com&gt;"> <span class=3D"fn">Victor Zhavoronkov</span></a>
</span></b>
        <pre>Seems that I am hitting same bug while using Opera browser on =
my Fedora 24
Workstation (GNOME) with NVidia GTX 650 Ti. Desktop freezes completely,
keyboard and mouse are not responding.

Part of journald log:

Jul 22 10:58:15 localhost.localdomain kernel: nouveau 0000:01:00.0: gr: TRA=
P ch
9 [003f548000 gnome-shell[1489]]
Jul 22 10:58:15 localhost.localdomain kernel: nouveau 0000:01:00.0: gr:
GPC0/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x =3D 128, y =3D 64, =
format =3D
0, storage type =3D fe
Jul 22 10:58:15 localhost.localdomain kernel: nouveau 0000:01:00.0: gr:
GPC1/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x =3D 80, y =3D 64, f=
ormat =3D
0, storage type =3D fe

Package versions:

kernel - 4.6.3
mesa - 12.0.1
xorg-x11-drv-nouveau - 1.0.12</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14691757190.A2A2E5eAA.1202--

--===============0151723665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0151723665==--
