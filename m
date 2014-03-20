From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76319] [NVE6] MMIO FAULT, black screen on QHD+ K2100M
Date: Thu, 20 Mar 2014 11:30:24 +0000
Message-ID: <bug-76319-8800-UyxmzHrdg6@http.bugs.freedesktop.org/>
References: <bug-76319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0355559773=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0355559773==
Content-Type: multipart/alternative; boundary="1395315024.F2F75e01.4285"; charset="us-ascii"


--1395315024.F2F75e01.4285
Date: Thu, 20 Mar 2014 11:30:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D76319

--- Comment #8 from D. Moens <d-bugzilla-vUpi/VKO0VA@public.gmane.org> ---
Report of current status ...


1. Code :


I've updated to darktama's latest git :
$ git log | head -n 1
commit e7cdcda87d2c2158ef34d88c9632bf7541c07c3a


2. Environment :


I'm now running on stock Fedora 20 (as it is not feasible to run Rawhide on=
 a
production system until the F21 release in october/november).

2a. With current kernel 3.13.6-200.fc20.x86_64, compilation halts at :
nouveau/drm/core/subdev/mxm/base.c: In function =E2=80=98mxm_shadow_dsm=E2=
=80=99:
nouveau/drm/core/subdev/mxm/base.c:109:2: error: implicit declaration of
function =E2=80=98acpi_evaluate_dsm=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
  obj =3D acpi_evaluate_dsm(handle, muid, rev, 0x00000010, &argv4);

2b. For now, upgrading to 3.14.0-0.rc7.git0.1.fc20.x86_64 (backported FC20 =
rpms
are provided at
http://copr-be.cloud.fedoraproject.org/results/besser82/kernel-backport/fed=
ora-20-x86_64/kernel-3.14.0-0.rc7.git0.1.fc21/).
Current git compiles fine with 3.14rc7.


3. Issues :


3a. Sometimes (30-50% of the cases ? not conclusive, not enough iterations)=
 the
kernel completely halts when loading the nouveau module (CAPSLOCK led
responds). Cold restart needed ;

3b. The 540MHz patch in 'core/engine/disp/dport.c:nouveau_dp_train' is
appearantly still required ;

3c. MMIO FAULT / HUB_INIT timeouts still occur, cfr. attachment errors2.out=
 .

3d. Power saving (DPMS ?) : when returning from DPMS, only the mouse pointe=
r is
shown on an otherwise (dark grey) lit screen ;

3e. Suspend : after resume, display is not restored, only a black screen is
shown.


4. Preliminary conclusion :

Otherwise, everything appears to work very well (X & VT), in full resolution
and with the external monitor attached (single/cloned/extended displays).
I can live with the troublesome suspend, but failing DPMS is a deal-breaker=
 for
production use.

Not tested :
- thermal power management (fans?) ;
- performance metrics.


5. Further testing :

Due to the missing Optimus & other nVidia issues, I'm currently still runni=
ng
the M4800 next to my aging production system (M6600), but planning to migra=
te
in the near future.
If you'd like me to test new code, performance, ... on a NVE6 with QHD+/DP =
for
the next days, this would be the time to go ahead.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1395315024.F2F75e01.4285
Date: Thu, 20 Mar 2014 11:30:24 +0000
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
   title=3D"NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76319#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76319">bug 76319<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
d-bugzilla&#64;moens.cc" title=3D"D. Moens &lt;d-bugzilla&#64;moens.cc&gt;"=
> <span class=3D"fn">D. Moens</span></a>
</span></b>
        <pre>Report of current status ...


1. Code :


I've updated to darktama's latest git :
$ git log | head -n 1
commit e7cdcda87d2c2158ef34d88c9632bf7541c07c3a


2. Environment :


I'm now running on stock Fedora 20 (as it is not feasible to run Rawhide on=
 a
production system until the F21 release in october/november).

2a. With current kernel 3.13.6-200.fc20.x86_64, compilation halts at :
nouveau/drm/core/subdev/mxm/base.c: In function =E2=80=98mxm_shadow_dsm=E2=
=80=99:
nouveau/drm/core/subdev/mxm/base.c:109:2: error: implicit declaration of
function =E2=80=98acpi_evaluate_dsm=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
  obj =3D acpi_evaluate_dsm(handle, muid, rev, 0x00000010, &amp;argv4);

2b. For now, upgrading to 3.14.0-0.rc7.git0.1.fc20.x86_64 (backported FC20 =
rpms
are provided at
<a href=3D"http://copr-be.cloud.fedoraproject.org/results/besser82/kernel-b=
ackport/fedora-20-x86_64/kernel-3.14.0-0.rc7.git0.1.fc21/">http://copr-be.c=
loud.fedoraproject.org/results/besser82/kernel-backport/fedora-20-x86_64/ke=
rnel-3.14.0-0.rc7.git0.1.fc21/</a>).
Current git compiles fine with 3.14rc7.


3. Issues :


3a. Sometimes (30-50% of the cases ? not conclusive, not enough iterations)=
 the
kernel completely halts when loading the nouveau module (CAPSLOCK led
responds). Cold restart needed ;

3b. The 540MHz patch in 'core/engine/disp/dport.c:nouveau_dp_train' is
appearantly still required ;

3c. MMIO FAULT / HUB_INIT timeouts still occur, cfr. attachment errors2.out=
 .

3d. Power saving (DPMS ?) : when returning from DPMS, only the mouse pointe=
r is
shown on an otherwise (dark grey) lit screen ;

3e. Suspend : after resume, display is not restored, only a black screen is
shown.


4. Preliminary conclusion :

Otherwise, everything appears to work very well (X &amp; VT), in full resol=
ution
and with the external monitor attached (single/cloned/extended displays).
I can live with the troublesome suspend, but failing DPMS is a deal-breaker=
 for
production use.

Not tested :
- thermal power management (fans?) ;
- performance metrics.


5. Further testing :

Due to the missing Optimus &amp; other nVidia issues, I'm currently still r=
unning
the M4800 next to my aging production system (M6600), but planning to migra=
te
in the near future.
If you'd like me to test new code, performance, ... on a NVE6 with QHD+/DP =
for
the next days, this would be the time to go ahead.</pre>
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

--1395315024.F2F75e01.4285--

--===============0355559773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0355559773==--
