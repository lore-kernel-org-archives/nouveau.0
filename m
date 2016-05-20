From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] [NVE6] Xorg random freeze
Date: Fri, 20 May 2016 16:39:39 +0000
Message-ID: <bug-92922-8800-rwt1HBmfv9@http.bugs.freedesktop.org/>
References: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1283777730=="
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


--===============1283777730==
Content-Type: multipart/alternative; boundary="14637623792.c84025dB.25825";
 charset="UTF-8"


--14637623792.c84025dB.25825
Date: Fri, 20 May 2016 16:39:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92922

--- Comment #5 from D=C4=81vis <davispuh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I might be hitting this same bug with Nvidia GTX 650 Ti on Arch Linux using
released kernel 4.6, xf86-video-nouveau 1.0.12 and mesa 11.2.2

When using GNOME Shell and Chromium

[ 3589.722408] nouveau 0000:01:00.0: fifo: FB_FLUSH_TIMEOUT
[ 3672.824102] nouveau 0000:01:00.0: fifo: read fault at 0002708000 engine =
00
[GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on channel 5 [003f8aa000
gnome-shell[4706]]
[ 3672.824111] nouveau 0000:01:00.0: fifo: gr engine fault on channel 5,
recovering...
[ 3672.824126] nouveau 0000:01:00.0: gr: TRAP ch 5 [003f8aa000
gnome-shell[4706]]
[ 3672.824139] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000080
[ZETA_STORAGE_TYPE_MISMATCH] x =3D 64, y =3D 56, format =3D 0, storage type=
 =3D 0
[ 3672.824151] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000080
[ZETA_STORAGE_TYPE_MISMATCH] x =3D 48, y =3D 56, format =3D 0, storage type=
 =3D 0


maybe it's related to bug #93629 which also happens sometimes.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14637623792.c84025dB.25825
Date: Fri, 20 May 2016 16:39:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92922#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] Xorg random freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92922">bug 92922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
davispuh&#64;gmail.com" title=3D"D=C4=81vis &lt;davispuh&#64;gmail.com&gt;"=
> <span class=3D"fn">D=C4=81vis</span></a>
</span></b>
        <pre>I might be hitting this same bug with Nvidia GTX 650 Ti on Arc=
h Linux using
released kernel 4.6, xf86-video-nouveau 1.0.12 and mesa 11.2.2

When using GNOME Shell and Chromium

[ 3589.722408] nouveau 0000:01:00.0: fifo: FB_FLUSH_TIMEOUT
[ 3672.824102] nouveau 0000:01:00.0: fifo: read fault at 0002708000 engine =
00
[GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on channel 5 [003f8aa000
gnome-shell[4706]]
[ 3672.824111] nouveau 0000:01:00.0: fifo: gr engine fault on channel 5,
recovering...
[ 3672.824126] nouveau 0000:01:00.0: gr: TRAP ch 5 [003f8aa000
gnome-shell[4706]]
[ 3672.824139] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000080
[ZETA_STORAGE_TYPE_MISMATCH] x =3D 64, y =3D 56, format =3D 0, storage type=
 =3D 0
[ 3672.824151] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000080
[ZETA_STORAGE_TYPE_MISMATCH] x =3D 48, y =3D 56, format =3D 0, storage type=
 =3D 0


maybe it's related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"show_bug.cgi?id=3D93629">bug #93629</a> which also happens somet=
imes.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14637623792.c84025dB.25825--

--===============1283777730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1283777730==--
