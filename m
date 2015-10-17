From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92515] New: Virtualbox with 3D acceleration and with
 installed vbox-additions crashes
Date: Sat, 17 Oct 2015 23:35:42 +0000
Message-ID: <bug-92515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1527568584=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1527568584==
Content-Type: multipart/alternative; boundary="1445124942.FE6def0.8491"; charset="UTF-8"


--1445124942.FE6def0.8491
Date: Sat, 17 Oct 2015 23:35:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92515

            Bug ID: 92515
           Summary: Virtualbox with 3D acceleration and with installed
                    vbox-additions crashes
           Product: Mesa
           Version: 10.5
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I'm running this setup:

libdrm:
 lib64drm_nouveau2-2.4.65-0.1-omv2014.0.x86_64
Mesa:
 lib64gl1-10.5.9-0.1-omv2014.0.x86_64
kernel:
 kernel-nrjQL-desktop-4.1.9-1omv-1-1-omv2014.0.x86_64
Vbox:
 virtualbox-5.0.6-0.2-omv2014.0.x86_64


My vbox setup have enabled 3D acceleration support and have installed
vbox-additions. This are needed for moder toolkit like Qt5 which heavily us=
es
3D acceleration.

Unfortunately my vbox crashes, or applications inside vbox does not work or
segfaults.

I found these in my host journal:

pa=C5=BA 18 01:07:01 lazur kernel: ieee80211 phy0: rt61pci_txdone: Warning =
- TX
status report missed for entry 25
pa=C5=BA 18 01:08:06 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:08:08 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:08:14 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:08:14 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:08:15 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[4504]] get 0x002002f2d0 put 0x002002f914 ib_get 0x000000d3
ib_put 0x000000d4 state 0x8000a204 (e... push 0x00406040
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[VBoxCrWinCmd[4504]] push 1 buf=
fer not
in list
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[VBoxCrWinCmd[4504]] push 1 buf=
fer not
in list
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[4504]] get 0x00200455a4 put 0x0020045690 ib_get 0x00000208
ib_put 0x0000022b state 0x8000005c (e... push 0x00406040
pa=C5=BA 18 01:12:35 lazur kernel: ShCrOpenGL[4503]: segfault at 8a0 ip
00007fa8e55998fc sp 00007fa8e58717b0 error 4
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR=20
pa=C5=BA 18 01:12:35 lazur kernel: INVALID_BITFIELD
pa=C5=BA 18 01:12:35 lazur kernel:=20
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[4504]] subc 4 class 0x502d mthd 0x0200 data
0x00047454
pa=C5=BA 18 01:12:35 lazur kernel:  in libdrm_nouveau.so.2.0.0[7fa8e5597000=
+6000]
pa=C5=BA 18 01:12:57 lazur kernel: vboxdrv: ffffffffc0764020 VMMR0.r0
pa=C5=BA 18 01:12:57 lazur kernel: vboxdrv: ffffffffc085d020 VBoxDDR0.r0
pa=C5=BA 18 01:12:57 lazur kernel: vboxdrv: ffffffffc007d020 VBoxDD2R0.r0
pa=C5=BA 18 01:12:59 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:13:13 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:13:13 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:13:14 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:15:27 lazur kernel: vboxdrv: ffffffffc087b020 VMMR0.r0
pa=C5=BA 18 01:15:27 lazur kernel: vboxdrv: ffffffffc0974020 VBoxDDR0.r0
pa=C5=BA 18 01:15:27 lazur kernel: vboxdrv: ffffffffc0098020 VBoxDD2R0.r0
pa=C5=BA 18 01:15:29 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:15:33 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:15:33 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:15:34 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x002018cacc put 0x002018cb34 ib_get 0x0000028d
ib_put 0x000002ac state 0x80007b10 (e... push 0x00406040
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x002018cb3c put 0x002018cbb0 ib_get 0x0000028f
ib_put 0x000002ac state 0x80000024 (e... push 0x00406040
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x1b00 data
0x07800000
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_OPERATION
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x1b0c data
0x07800000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x0020081ff4 put 0x0020082ae0 ib_get 0x0000020e
ib_put 0x0000020f state 0x80008228 (e... push 0x00406040
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x021c data
0xffffffff
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0220 data
0xffffffff
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x002009d600 put 0x002009ded4 ib_get 0x000003cb
ib_put 0x000003cc state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0838 data
0x03b60000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x083c data
0x000c6a0c
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0844 data
0x43ed8000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x084c data
0x000c6a00
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0854 data
0xc3ed8000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x00200a4528 put 0x00200a46c4 ib_get 0x0000003a
ib_put 0x0000003b state 0x80006f05 (e... push 0x00406040
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x0910 data
0x000472e8
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x0020188d4c put 0x00201898f4 ib_get 0x00000203
ib_put 0x00000204 state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_ENUM
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x191c data
0x41c851ec
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_ENUM
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x1920 data
0x42780000
pa=C5=BA 18 01:22:23 lazur kernel: vboxdrv: ffffffffc0992020 VMMR0.r0
pa=C5=BA 18 01:22:23 lazur kernel: vboxdrv: ffffffffc0a8b020 VBoxDDR0.r0
pa=C5=BA 18 01:22:23 lazur kernel: vboxdrv: ffffffffc0159020 VBoxDD2R0.r0
pa=C5=BA 18 01:22:24 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:22:36 lazur kernel: vboxdrv: ffffffffc0aa9020 VMMR0.r0
pa=C5=BA 18 01:22:36 lazur kernel: vboxdrv: ffffffffc0ba2020 VBoxDDR0.r0
pa=C5=BA 18 01:22:36 lazur kernel: vboxdrv: ffffffffc01fb020 VBoxDD2R0.r0
pa=C5=BA 18 01:22:37 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:22:41 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:22:41 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:22:42 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:24:49 lazur kernel: vboxdrv: ffffffffc0764020 VMMR0.r0
pa=C5=BA 18 01:24:49 lazur kernel: vboxdrv: ffffffffc085d020 VBoxDDR0.r0
pa=C5=BA 18 01:24:49 lazur kernel: vboxdrv: ffffffffc007d020 VBoxDD2R0.r0
pa=C5=BA 18 01:24:51 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:25:11 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:25:11 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:25:12 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[VBoxCrWinCmd[7184]] multiple i=
nstances
of buffer 30 on validation list
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[VBoxCrWinCmd[7184]] validate_i=
nit
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[VBoxCrWinCmd[7184]] validate: =
-22
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x002003f5dc put 0x002003fd84 ib_get 0x0000019e
ib_put 0x000001c5 state 0x80007220 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x0020e41344 put 0x0020e41370 ib_get 0x0000019f
ib_put 0x000001c5 state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x002003ffd4 put 0x002003ffd8 ib_get 0x000001a0
ib_put 0x000001c5 state 0x80007b10 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[7184]] subc 3 class 0x8297 mthd 0x1b04 data
0x000475ec
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x0020379744 put 0x002037974c ib_get 0x000001a1
ib_put 0x000001c5 state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[7184]] subc 3 class 0x8297 mthd 0x1b0c data
0x000375f

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445124942.FE6def0.8491
Date: Sat, 17 Oct 2015 23:35:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Virtualbox with 3D acceleration and with installed vbox-a=
dditions crashes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92515">92515</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Virtualbox with 3D acceleration and with installed vbox-addit=
ions crashes
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.5
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>tpgxyz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm running this setup:

libdrm:
 lib64drm_nouveau2-2.4.65-0.1-omv2014.0.x86_64
Mesa:
 lib64gl1-10.5.9-0.1-omv2014.0.x86_64
kernel:
 kernel-nrjQL-desktop-4.1.9-1omv-1-1-omv2014.0.x86_64
Vbox:
 virtualbox-5.0.6-0.2-omv2014.0.x86_64


My vbox setup have enabled 3D acceleration support and have installed
vbox-additions. This are needed for moder toolkit like Qt5 which heavily us=
es
3D acceleration.

Unfortunately my vbox crashes, or applications inside vbox does not work or
segfaults.

I found these in my host journal:

pa=C5=BA 18 01:07:01 lazur kernel: ieee80211 phy0: rt61pci_txdone: Warning =
- TX
status report missed for entry 25
pa=C5=BA 18 01:08:06 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:08:08 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:08:14 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:08:14 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:08:15 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[4504]] get 0x002002f2d0 put 0x002002f914 ib_get 0x000000d3
ib_put 0x000000d4 state 0x8000a204 (e... push 0x00406040
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[VBoxCrWinCmd[4504]] push 1 buf=
fer not
in list
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[VBoxCrWinCmd[4504]] push 1 buf=
fer not
in list
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[4504]] get 0x00200455a4 put 0x0020045690 ib_get 0x00000208
ib_put 0x0000022b state 0x8000005c (e... push 0x00406040
pa=C5=BA 18 01:12:35 lazur kernel: ShCrOpenGL[4503]: segfault at 8a0 ip
00007fa8e55998fc sp 00007fa8e58717b0 error 4
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR=20
pa=C5=BA 18 01:12:35 lazur kernel: INVALID_BITFIELD
pa=C5=BA 18 01:12:35 lazur kernel:=20
pa=C5=BA 18 01:12:35 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[4504]] subc 4 class 0x502d mthd 0x0200 data
0x00047454
pa=C5=BA 18 01:12:35 lazur kernel:  in libdrm_nouveau.so.2.0.0[7fa8e5597000=
+6000]
pa=C5=BA 18 01:12:57 lazur kernel: vboxdrv: ffffffffc0764020 VMMR0.r0
pa=C5=BA 18 01:12:57 lazur kernel: vboxdrv: ffffffffc085d020 VBoxDDR0.r0
pa=C5=BA 18 01:12:57 lazur kernel: vboxdrv: ffffffffc007d020 VBoxDD2R0.r0
pa=C5=BA 18 01:12:59 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:13:13 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:13:13 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:13:14 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:15:27 lazur kernel: vboxdrv: ffffffffc087b020 VMMR0.r0
pa=C5=BA 18 01:15:27 lazur kernel: vboxdrv: ffffffffc0974020 VBoxDDR0.r0
pa=C5=BA 18 01:15:27 lazur kernel: vboxdrv: ffffffffc0098020 VBoxDD2R0.r0
pa=C5=BA 18 01:15:29 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:15:33 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:15:33 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:15:34 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x002018cacc put 0x002018cb34 ib_get 0x0000028d
ib_put 0x000002ac state 0x80007b10 (e... push 0x00406040
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x002018cb3c put 0x002018cbb0 ib_get 0x0000028f
ib_put 0x000002ac state 0x80000024 (e... push 0x00406040
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x1b00 data
0x07800000
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_OPERATION
pa=C5=BA 18 01:16:27 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x1b0c data
0x07800000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x0020081ff4 put 0x0020082ae0 ib_get 0x0000020e
ib_put 0x0000020f state 0x80008228 (e... push 0x00406040
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x021c data
0xffffffff
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0220 data
0xffffffff
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x002009d600 put 0x002009ded4 ib_get 0x000003cb
ib_put 0x000003cc state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0838 data
0x03b60000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x083c data
0x000c6a0c
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0844 data
0x43ed8000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x084c data
0x000c6a00
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 4 class 0x502d mthd 0x0854 data
0xc3ed8000
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x00200a4528 put 0x00200a46c4 ib_get 0x0000003a
ib_put 0x0000003b state 0x80006f05 (e... push 0x00406040
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:17:19 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x0910 data
0x000472e8
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[6947]] get 0x0020188d4c put 0x00201898f4 ib_get 0x00000203
ib_put 0x00000204 state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_ENUM
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x191c data
0x41c851ec
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_ENUM
pa=C5=BA 18 01:18:54 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[6947]] subc 3 class 0x8297 mthd 0x1920 data
0x42780000
pa=C5=BA 18 01:22:23 lazur kernel: vboxdrv: ffffffffc0992020 VMMR0.r0
pa=C5=BA 18 01:22:23 lazur kernel: vboxdrv: ffffffffc0a8b020 VBoxDDR0.r0
pa=C5=BA 18 01:22:23 lazur kernel: vboxdrv: ffffffffc0159020 VBoxDD2R0.r0
pa=C5=BA 18 01:22:24 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:22:36 lazur kernel: vboxdrv: ffffffffc0aa9020 VMMR0.r0
pa=C5=BA 18 01:22:36 lazur kernel: vboxdrv: ffffffffc0ba2020 VBoxDDR0.r0
pa=C5=BA 18 01:22:36 lazur kernel: vboxdrv: ffffffffc01fb020 VBoxDD2R0.r0
pa=C5=BA 18 01:22:37 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:22:41 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:22:41 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:22:42 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:24:49 lazur kernel: vboxdrv: ffffffffc0764020 VMMR0.r0
pa=C5=BA 18 01:24:49 lazur kernel: vboxdrv: ffffffffc085d020 VBoxDDR0.r0
pa=C5=BA 18 01:24:49 lazur kernel: vboxdrv: ffffffffc007d020 VBoxDD2R0.r0
pa=C5=BA 18 01:24:51 lazur kernel: PS2K: Selected scan set 2
pa=C5=BA 18 01:25:11 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:25:11 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:25:12 lazur kernel: HPET: Using timer above configured range=
: 3
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[VBoxCrWinCmd[7184]] multiple i=
nstances
of buffer 30 on validation list
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[VBoxCrWinCmd[7184]] validate_i=
nit
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[VBoxCrWinCmd[7184]] validate: =
-22
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x002003f5dc put 0x002003fd84 ib_get 0x0000019e
ib_put 0x000001c5 state 0x80007220 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x0020e41344 put 0x0020e41370 ib_get 0x0000019f
ib_put 0x000001c5 state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x002003ffd4 put 0x002003ffd8 ib_get 0x000001a0
ib_put 0x000001c5 state 0x80007b10 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_VALUE
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[7184]] subc 3 class 0x8297 mthd 0x1b04 data
0x000475ec
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PU=
SHER - ch
5 [VBoxCrWinCmd[7184]] get 0x0020379744 put 0x002037974c ib_get 0x000001a1
ib_put 0x000001c5 state 0x80000000 (e... push 0x00406040
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] DATA_E=
RROR
INVALID_BITFIELD
pa=C5=BA 18 01:26:12 lazur kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 5
[0x001f764000 VBoxCrWinCmd[7184]] subc 3 class 0x8297 mthd 0x1b0c data
0x000375f</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445124942.FE6def0.8491--

--===============1527568584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1527568584==--
