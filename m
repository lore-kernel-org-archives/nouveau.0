From: Jan Vlietland <j.vlietland@nisi.nl>
Subject: Nouveau module results in total lockups without any dmesg trace on a
 NP900X5N Kaby Lake machine
Date: Tue, 1 Jan 2019 21:59:02 +0100
Message-ID: <cb43e1cb-dffa-26d8-c938-49ca4b48d38a@nisi.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: nl
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi Ben, David and Daniel ,

First of all happy new year. Based on advice of Greg K-H herewith a mail=20
about a number of Nouveau issues with my laptop.

I installed various Kali linux versions up to Linux 4.20.0-rc7=20
(downloaded, compiled and installed) on a Samsung NP900X5N laptop and=20
have an issue with the driver after loading.

My configuration:

- i7 7500
- 16 gb / 256 gb ssd
- nvidia 940MX (for 3D graphics)

When I enable loading of the nouveau module for my Nvidia 3D card I get=20
three MMIO faults:

[   35.984104] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4 [ IBUS ]
[   35.997510] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08 [ IBUS ]
[   37.551790] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444 [ IBUS ]

I see currenty varous discussions on bugzilla: (as summarized by Bruno=20
Pagani) https://bugs.freedesktop.org/show_bug.cgi?id=3D100423.

But I do not see any confirmed solutions on the MMIO faults.

The module is loaded but X server cannot run in framebuffer mode. I=20
assume that the module does not provide any video memory to X to run in=20
graphics mode.

First of all I would like to understand what the faults impose.
And I also would like to help you providing testing to fix the errors.

Many thanks for your kind support.


--=20

Met vriendelijke groet,

*dr. Jan Vlietland*, namens

spin-off

Nederlands Instituut voor de Software Industrie

_j.vlietland@nisi.nl_| 06 =E2=80=93 20 411 834 | 030 =E2=80=93 268 53 98
Princetonplein 5 | 3584 CC=C2=A0 Utrecht | www.nisi.nl
