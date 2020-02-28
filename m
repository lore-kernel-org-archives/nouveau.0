From: Sid Boyce <sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org>
Subject: 5.6-rc3 nouveau failure, 5.6-rc2 OK
Date: Fri, 28 Feb 2020 21:53:19 +0000
Message-ID: <f69d1012-b502-da2a-6a80-21981d661108@blueyonder.co.uk>
Reply-To: sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

[94.455712] [T411] nouveau 0000:07:00.0 disp ctor failed, -12

Welcome to openSUSE Tumbleweed 20200224 - Kernel 5.6.0-rc3 (tty1)

ens3s0: 192.168.10.214 .......

login:


I can login here but X does not start -- lspci

07:00.0 VGA compatible controller: NVIDIA Corporation TU117 [GeForce GTX 
1650] (rev a1)

from dmesg:-

[Wed Feb 26 22:42:39 2020] nouveau 0000:07:00.0: NVIDIA TU117 (167000a1)
[Wed Feb 26 22:42:39 2020] nouveau 0000:07:00.0: bios: version 
90.17.2a.00.39
[Wed Feb 26 22:44:12 2020] nouveau 0000:07:00.0: disp ctor failed, -12
[Wed Feb 26 22:44:12 2020] nouveau: probe of 0000:07:00.0 failed with 
error -12


Another box with VGA compatible controller: NVIDIA Corporation GP107 
[GeForce GTX 1050 Ti] (rev a1) boots to graphical environment with 5.6-rc3.

tindog:~ # dmesg -T|grep nouveau
[Mon Feb 24 12:50:16 2020] nouveau 0000:07:00.0: NVIDIA GF106 (0c3100a1)
[Mon Feb 24 12:50:16 2020] nouveau 0000:07:00.0: bios: version 
70.26.37.00.01
[Mon Feb 24 12:50:16 2020] nouveau 0000:07:00.0: fb: 4096 MiB GDDR5
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: VRAM: 4096 MiB
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: GART: 1048576 MiB
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: TMDS table version 2.0
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB version 4.0
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 00: 
02000300 00000000
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 01: 
01000302 00020030
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 02: 
04011380 00000000
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 03: 
08011382 00020030
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 04: 
02022362 00020010
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB conn 00: 00001030
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB conn 01: 00000100
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB conn 02: 00002261
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: MM: using COPY0 
for buffer copies
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: allocated 
1920x1080 fb: 0x60000, bo 000000008db05e25
[Mon Feb 24 12:50:17 2020] fbcon: nouveaudrmfb (fb0) is primary device
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: fb0: nouveaudrmfb frame 
buffer device

[Mon Feb 24 12:50:17 2020] [drm] Initialized nouveau 1.3.1 20120801 for 
0000:07:00.0 on minor 0

I have tried the new firmware, result is the same.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=2277987a593d54c1e922a9f25445802071015f42


Regards

Sid.

-- 
Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks
