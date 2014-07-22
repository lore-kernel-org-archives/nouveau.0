From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Tue, 22 Jul 2014 20:28:30 +0000
Message-ID: <bug-71659-8800-d41qrUhqCX@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2110337540=="
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


--===============2110337540==
Content-Type: multipart/alternative; boundary="1406060910.5a3B1.20104"; charset="us-ascii"


--1406060910.5a3B1.20104
Date: Tue, 22 Jul 2014 20:28:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71659

--- Comment #24 from Adrian B=C4=83c=C3=AErcea <adrian.bacircea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
---
Hi, sorry for barging in but I'm also hitting this on the same graphics card
(NVS 4200M) on a Dell Latitude E6520 running Arch Linux.
I'm trying to use PRIME for a VA-API + VDPAU setup and also for some games =
but
as soon as I start I get this message in dmesg :=20
kernel: nouveau E[   PFIFO][0000:01:00.0] INTR 0x00800000
kernel: nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
I'm running the 3.15.6-1-ARCH kernel with the following packages:
intel-dri-git 10.3.0_devel.64000-1
lib32-intel-dri-git 10.3.0_devel.64007-1
lib32-mesa-git 10.3.0_devel.64007-1
lib32-mesa-libgl-git 10.3.0_devel.64007-1
lib32-nouveau-dri-git 10.3.0_devel.64007-1
lib32-opencl-mesa-git 10.3.0_devel.64007-1
lib32-svga-dri-git 10.3.0_devel.64007-1
libdrm-git 2.4.54.19.gc0b34dc-1
mesa-git 10.3.0_devel.64000-1
mesa-libgl-git 10.3.0_devel.64000-1
nouveau-dri-git 10.3.0_devel.64000-1
opencl-mesa-git 10.3.0_devel.64000-1
xf86-video-nouveau-git 1.0.10.34.gedd1608-1
If I stop the application the uses the NVIDIA card as soon as I see the
message, everything is OK. But if I continue, X freezes and the only way I =
can
regain control is by a cold reboot.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1406060910.5a3B1.20104
Date: Tue, 22 Jul 2014 20:28:30 +0000
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
   title=3D"NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] =
unhandled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] =
unhandled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659">bug 71659<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adrian.bacircea&#64;gmail.com" title=3D"Adrian B=C4=83c=C3=AErcea &lt;adria=
n.bacircea&#64;gmail.com&gt;"> <span class=3D"fn">Adrian B=C4=83c=C3=AErcea=
</span></a>
</span></b>
        <pre>Hi, sorry for barging in but I'm also hitting this on the same=
 graphics card
(NVS 4200M) on a Dell Latitude E6520 running Arch Linux.
I'm trying to use PRIME for a VA-API + VDPAU setup and also for some games =
but
as soon as I start I get this message in dmesg :=20
kernel: nouveau E[   PFIFO][0000:01:00.0] INTR 0x00800000
kernel: nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
I'm running the 3.15.6-1-ARCH kernel with the following packages:
intel-dri-git 10.3.0_devel.64000-1
lib32-intel-dri-git 10.3.0_devel.64007-1
lib32-mesa-git 10.3.0_devel.64007-1
lib32-mesa-libgl-git 10.3.0_devel.64007-1
lib32-nouveau-dri-git 10.3.0_devel.64007-1
lib32-opencl-mesa-git 10.3.0_devel.64007-1
lib32-svga-dri-git 10.3.0_devel.64007-1
libdrm-git 2.4.54.19.gc0b34dc-1
mesa-git 10.3.0_devel.64000-1
mesa-libgl-git 10.3.0_devel.64000-1
nouveau-dri-git 10.3.0_devel.64000-1
opencl-mesa-git 10.3.0_devel.64000-1
xf86-video-nouveau-git 1.0.10.34.gedd1608-1
If I stop the application the uses the NVIDIA card as soon as I see the
message, everything is OK. But if I continue, X freezes and the only way I =
can
regain control is by a cold reboot.</pre>
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

--1406060910.5a3B1.20104--

--===============2110337540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2110337540==--
