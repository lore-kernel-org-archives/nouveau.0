From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Tue, 06 Nov 2018 16:05:34 +0000
Message-ID: <bug-93629-8800-9bwntF5HmA@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052117782=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1052117782==
Content-Type: multipart/alternative; boundary="15415203347.dc0b37b0.15485"
Content-Transfer-Encoding: 7bit


--15415203347.dc0b37b0.15485
Date: Tue, 6 Nov 2018 16:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #45 from Bluenote <bluenotee-GANU6spQydw@public.gmane.org> ---
Same bug for me with :

Linux Achille 4.9.0-8-amd64 #1 SMP Debian 4.9.110-3+deb9u6 (2018-10-08) x86=
_64
GNU/Linux


kern.log :


nouveau 0000:01:00.0: fifo: write fault at 0000240000 engine 00 [GR] client=
 0f
[GPC0/PROP_0] reason 02 [PTE] on channel 2 [007fb4a000 Xorg[768]]
Nov  6 08:34:23 Achille kernel: [ 1046.932801] nouveau 0000:01:00.0: fifo: =
gr
engine fault on channel 2, recovering...


GPU :

VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 710B] (rev =
a1)


I try this : https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D864349#20

/etc/modprobe.d/nouveau.conf :

options nouveau noaccel=3D1 runpm=3D0 nofbaccel=3D1 modeset=3D1


News in a few hours...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15415203347.dc0b37b0.15485
Date: Tue, 6 Nov 2018 16:05:34 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c45">Commen=
t # 45</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bluenotee&#64;free.fr" title=3D"Bluenote &lt;bluenotee&#64;free.fr&gt;"> <s=
pan class=3D"fn">Bluenote</span></a>
</span></b>
        <pre>Same bug for me with :

Linux Achille 4.9.0-8-amd64 #1 SMP Debian 4.9.110-3+deb9u6 (2018-10-08) x86=
_64
GNU/Linux


kern.log :


nouveau 0000:01:00.0: fifo: write fault at 0000240000 engine 00 [GR] client=
 0f
[GPC0/PROP_0] reason 02 [PTE] on channel 2 [007fb4a000 Xorg[768]]
Nov  6 08:34:23 Achille kernel: [ 1046.932801] nouveau 0000:01:00.0: fifo: =
gr
engine fault on channel 2, recovering...


GPU :

VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 710B] (rev =
a1)


I try this : <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=
=3D864349#20">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D864349#20=
</a>

/etc/modprobe.d/nouveau.conf :

options nouveau noaccel=3D1 runpm=3D0 nofbaccel=3D1 modeset=3D1


News in a few hours...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15415203347.dc0b37b0.15485--

--===============1052117782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1052117782==--
