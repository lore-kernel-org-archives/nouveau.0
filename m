From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108906] New: nouveau driver causes system slowdown
Date: Thu, 29 Nov 2018 16:32:20 +0000
Message-ID: <bug-108906-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0349448467=="
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


--===============0349448467==
Content-Type: multipart/alternative; boundary="15435091401.abe423.22543"
Content-Transfer-Encoding: 7bit


--15435091401.abe423.22543
Date: Thu, 29 Nov 2018 16:32:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108906

            Bug ID: 108906
           Summary: nouveau driver causes system slowdown
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tom-3oKKFw2tKw/QT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I'm using x86-64 Fedora 29 on an HP Z desktop machine.

I suspect (I don't really know) that some interaction between
the nouveau driver and the hardware on this system will randomly
(I don't know the trigger) cause a severe slowdown, making
the machine unusable.

I'm appending the results of "journalctl -l | grep nouveau"
in case this is helpful.  Mostly it consists of "timeout"
warnings, but there is a "FAULT" in there with an "at" value
that I didn't previously find in bugzilla.


Nov 29 00:24:50 localhost.localdomain kernel: fb: switching to nouveaufb fr=
om
EFI VGA
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: NVIDIA
GP107 (137000a1)
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: bios:
version 86.07.3b.00.47
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: fb: 2048
MiB GDDR5
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: VR=
AM:
2048 MiB
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: GA=
RT:
536870912 MiB
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: BIT
table 'A' not found
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: BIT
table 'L' not found
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: TM=
DS
table version 2.0
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
version 4.1
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 00: 01800f56 04600020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 01: 01000f52 04620020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 02: 01811f46 04600010
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 03: 01011f42 04620010
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 04: 02822f76 04600020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 05: 02022f72 00020020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
conn 00: 00002046
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
conn 01: 00001146
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
conn 02: 00020246
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: MM:
using COPY for buffer copies
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: bus: MM=
IO
read of 00000000 FAULT at 122124 [ IBUS ]
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM:
allocated 1920x1080 fb: 0x200000, bo 0000000027ab8431
Nov 29 00:24:51 localhost.localdomain kernel: fbcon: nouveaufb (fb0) is pri=
mary
device
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: fb0:
nouveaufb frame buffer device
Nov 29 00:24:51 localhost.localdomain kernel: [drm] Initialized nouveau 1.3=
.1
20120801 for 0000:21:00.0 on minor 0
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0000
data 00000000 00003000 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0004
data 04380780 10003004 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0008
data 00007804 10003008 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
000c
data 0000cf00 1000300c 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0010
data 20000000 10003010 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0000
data 00000400 10001000 00000002
Nov 29 07:59:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:24 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:36 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:38 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 07:59:40 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:42 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:44 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:46 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:48 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:50 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 07:59:52 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:54 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:56 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:58 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:00 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 08:00:04 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:06 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:08 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:10 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:12 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:14 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:16 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:18 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:24 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 08:00:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:36 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:38 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:40 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:42 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:44 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:46 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:48 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:50 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:52 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:54 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:56 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:58 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:00 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:04 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:06 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:08 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:10 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:12 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:14 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:16 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:18 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:24 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:37 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:39 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:41 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:43 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:45 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:47 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:49 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:07 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:09 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:11 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:13 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:15 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:17 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:23 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:25 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:27 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:29 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:31 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:39 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:41 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:43 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:45 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:47 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:36 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:38 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:40 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:27 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:29 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:31 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:33 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:35 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:39 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:47 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:49 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:51 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:53 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:55 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:57 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:59 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:01 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:03 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:05 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:44 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:46 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:48 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:50 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:52 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:54 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:06:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:06:55 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:06:57 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:10 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:12 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:14 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:16 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:18 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:08:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15435091401.abe423.22543
Date: Thu, 29 Nov 2018 16:32:20 +0000
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
   title=3D"NEW - nouveau driver causes system slowdown"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108906">108906</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau driver causes system slowdown
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>tom&#64;tromey.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm using x86-64 Fedora 29 on an HP Z desktop machine.

I suspect (I don't really know) that some interaction between
the nouveau driver and the hardware on this system will randomly
(I don't know the trigger) cause a severe slowdown, making
the machine unusable.

I'm appending the results of &quot;journalctl -l | grep nouveau&quot;
in case this is helpful.  Mostly it consists of &quot;timeout&quot;
warnings, but there is a &quot;FAULT&quot; in there with an &quot;at&quot; =
value
that I didn't previously find in bugzilla.


Nov 29 00:24:50 localhost.localdomain kernel: fb: switching to nouveaufb fr=
om
EFI VGA
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: NVIDIA
GP107 (137000a1)
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: bios:
version 86.07.3b.00.47
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: fb: 2048
MiB GDDR5
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: VR=
AM:
2048 MiB
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: GA=
RT:
536870912 MiB
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: BIT
table 'A' not found
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: BIT
table 'L' not found
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: TM=
DS
table version 2.0
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
version 4.1
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 00: 01800f56 04600020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 01: 01000f52 04620020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 02: 01811f46 04600010
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 03: 01011f42 04620010
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 04: 02822f76 04600020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
outp 05: 02022f72 00020020
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
conn 00: 00002046
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
conn 01: 00001146
Nov 29 00:24:50 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: DCB
conn 02: 00020246
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM: MM:
using COPY for buffer copies
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: bus: MM=
IO
read of 00000000 FAULT at 122124 [ IBUS ]
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: DRM:
allocated 1920x1080 fb: 0x200000, bo 0000000027ab8431
Nov 29 00:24:51 localhost.localdomain kernel: fbcon: nouveaufb (fb0) is pri=
mary
device
Nov 29 00:24:51 localhost.localdomain kernel: nouveau 0000:21:00.0: fb0:
nouveaufb frame buffer device
Nov 29 00:24:51 localhost.localdomain kernel: [drm] Initialized nouveau 1.3=
.1
20120801 for 0000:21:00.0 on minor 0
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0000
data 00000000 00003000 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0004
data 04380780 10003004 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0008
data 00007804 10003008 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
000c
data 0000cf00 1000300c 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0010
data 20000000 10003010 00000000
Nov 29 07:59:18 murgatroyd kernel: nouveau 0000:21:00.0: disp: chid 1 mthd =
0000
data 00000400 10001000 00000002
Nov 29 07:59:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:24 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:36 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:38 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 07:59:40 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:42 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:44 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:46 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:48 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:50 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 07:59:52 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:54 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:56 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 07:59:58 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:00 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 08:00:04 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:06 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:08 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:10 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:12 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:14 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:16 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:18 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:24 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: core notifier
timeout
Nov 29 08:00:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:36 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:38 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:40 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:42 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:44 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:46 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:48 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:50 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:52 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:54 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:56 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:00:58 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:00 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:04 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:06 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:08 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:10 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:12 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:14 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:16 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:18 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:24 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:37 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:39 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:41 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:43 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:45 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:47 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:01:49 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:07 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:09 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:11 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:13 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:15 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:17 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:23 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:25 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:27 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:29 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:31 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:39 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:41 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:43 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:45 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:02:47 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:26 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:28 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:30 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:32 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:34 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:36 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:38 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:03:40 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:20 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:22 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:27 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:29 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:31 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:33 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:35 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:39 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:47 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:49 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:51 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:53 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:55 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:57 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:04:59 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:01 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:03 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:05 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:44 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:46 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:48 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:50 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:52 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:05:54 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:06:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:06:55 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:06:57 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:10 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:12 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:14 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:16 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:07:18 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut
Nov 29 08:08:02 murgatroyd kernel: nouveau 0000:21:00.0: DRM: base-0: timeo=
ut</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15435091401.abe423.22543--

--===============0349448467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0349448467==--
