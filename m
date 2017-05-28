From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101215] New: Graphics Crash
Date: Sun, 28 May 2017 04:12:18 +0000
Message-ID: <bug-101215-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1587942548=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1587942548==
Content-Type: multipart/alternative; boundary="14959447370.876f74a.19238";
 charset="UTF-8"


--14959447370.876f74a.19238
Date: Sun, 28 May 2017 04:12:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101215

            Bug ID: 101215
           Summary: Graphics Crash
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: hansen.ross-EMRzualFZlS6c6uEtOJ/EA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When using Graphical display with Nouveau driver installed the screen,mouse=
 &
keyboard lock up.
Can still ssh to machine and can issue commands to system but GUI is comple=
tely
unresponsive.

Running the following system
OS: Fedora 25 64 bit
Arch: 64-bit
Graphics Card: GeForce GTX 660
Kernel: 4.10.15-200.fc25.x86_64
Nouveau Driver: xorg-x11-drv-nouveau-1.0.15-1.fc25.x86_64


Get the following Errors from dmesg
[May28 11:56] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000011] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1060, format =3D 2a, storage type =3D=
 0
[  +0.000884] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1062, format =3D 2a, storage type =3D=
 0
[  +0.001081] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1056, format =3D 2a, storage type =3D=
 0
[  +0.014835] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1060, format =3D 2a, storage type =3D=
 0
[  +0.000043] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000017] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000144] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000236] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000009] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1062, format =3D 2a, storage type =3D=
 0
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000008] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 208, y =3D 1056, format =3D 2a, storage type =3D 0
[  +0.000234] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000026] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000023] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000013] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000030] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000046] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000015] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000082] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000140] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000017] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000009] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1056, format =3D 2a, storage type =3D=
 0
[  +2.710441] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000011] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1060, format =3D 2a, storage type =3D=
 0
[  +0.000048] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000031] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000112] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000067] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000040] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000134] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000009] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1062, format =3D 2a, storage type =3D=
 0
[  +0.000014] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000008] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 608, y =3D 1072, format =3D 2a, storage type =3D 0
[  +0.000155] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000005] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000102] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000017] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000012] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000059] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000012] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000008] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1056, format =3D 2a, storage type =3D=
 0
[May28 12:01] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
[ +10.240079] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] hw_done timed out
[May28 12:02] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] flip_done timed out
[ +10.240040] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
[ +10.240060] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] hw_done timed out
[ +10.240050] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] flip_done timed out
[ +10.240051] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
[May28 12:03] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] hw_done timed out
[ +10.240127] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] flip_done timed out
[ +10.240017] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14959447370.876f74a.19238
Date: Sun, 28 May 2017 04:12:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics Crash"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101215">101215</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Graphics Crash
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>hansen.ross&#64;live.com.au
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When using Graphical display with Nouveau driver installed the=
 screen,mouse &amp;
keyboard lock up.
Can still ssh to machine and can issue commands to system but GUI is comple=
tely
unresponsive.

Running the following system
OS: Fedora 25 64 bit
Arch: 64-bit
Graphics Card: GeForce GTX 660
Kernel: 4.10.15-200.fc25.x86_64
Nouveau Driver: xorg-x11-drv-nouveau-1.0.15-1.fc25.x86_64


Get the following Errors from dmesg
[May28 11:56] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000011] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1060, format =3D 2a, storage type =3D=
 0
[  +0.000884] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1062, format =3D 2a, storage type =3D=
 0
[  +0.001081] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1056, format =3D 2a, storage type =3D=
 0
[  +0.014835] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1060, format =3D 2a, storage type =3D=
 0
[  +0.000043] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000017] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000144] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000236] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000009] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1062, format =3D 2a, storage type =3D=
 0
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000008] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 208, y =3D 1056, format =3D 2a, storage type =3D 0
[  +0.000234] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000026] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000023] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000013] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000030] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000046] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000015] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000082] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000003] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000140] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000017] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000009] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1056, format =3D 2a, storage type =3D=
 0
[  +2.710441] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000011] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1060, format =3D 2a, storage type =3D=
 0
[  +0.000048] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000031] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000112] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000067] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000040] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000134] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000009] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1062, format =3D 2a, storage type =3D=
 0
[  +0.000014] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000008] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 608, y =3D 1072, format =3D 2a, storage type =3D 0
[  +0.000155] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000005] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000005] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000102] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000000
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000017] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000012] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000000
[  +0.000010] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000003] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000059] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000011] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000004] nouveau 0000:01:00.0: gr: ROP0 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP1 80000000 80000002
[  +0.000004] nouveau 0000:01:00.0: gr: ROP2 80000000 80000002
[  +0.000012] nouveau 0000:01:00.0: gr: TRAP ch 6 [023f718000
systemd-logind[757]]
[  +0.000008] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1888, y =3D 1056, format =3D 2a, storage type =3D=
 0
[May28 12:01] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
[ +10.240079] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] hw_done timed out
[May28 12:02] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] flip_done timed out
[ +10.240040] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
[ +10.240060] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] hw_done timed out
[ +10.240050] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] flip_done timed out
[ +10.240051] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
[May28 12:03] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] hw_done timed out
[ +10.240127] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:37:head-0] flip_done timed out
[ +10.240017] [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14959447370.876f74a.19238--

--===============1587942548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1587942548==--
