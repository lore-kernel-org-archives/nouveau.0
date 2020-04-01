From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: gp104: regression on Linux 5.6
Date: Wed, 1 Apr 2020 21:56:21 +0300
Message-ID: <20200401185621.GA24692@avx2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
Cc: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

gp104 refuses to switch to "graphic" mode and show anything past
this line:

	fb0: switching to nouveaufb from EFI VGA

Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
normally.

5.5 is OK. 5.6 is broken.
Bisecting is kinda painful with miscompilation and init/main.c breakage.

BTW do I need all those megabytes of firmware?

[    0.923273] fb0: switching to nouveaufb from EFI VGA
[    0.923440] nouveau 0000:02:00.0: NVIDIA GP104 (134000a1)
[    1.026681] nouveau 0000:02:00.0: bios: version 86.04.1e.00.01
[    1.026930] nouveau 0000:02:00.0: gr: failed to load firmware "gr/sw_nonctx"
[    1.026934] nouveau 0000:02:00.0: gr: failed to load gr/sw_nonctx
[    1.027196] nouveau 0000:02:00.0: fb: 8192 MiB GDDR5
[    1.040683] nouveau 0000:02:00.0: DRM: VRAM: 8192 MiB
[    1.040686] nouveau 0000:02:00.0: DRM: GART: 536870912 MiB
[    1.040689] nouveau 0000:02:00.0: DRM: BIT table 'A' not found
[    1.040692] nouveau 0000:02:00.0: DRM: BIT table 'L' not found
[    1.040695] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
[    1.040698] nouveau 0000:02:00.0: DRM: DCB version 4.1
[    1.040701] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000f42 00020030
[    1.040704] nouveau 0000:02:00.0: DRM: DCB outp 01: 04811f96 04600020
[    1.040707] nouveau 0000:02:00.0: DRM: DCB outp 02: 04011f92 00020020
[    1.040710] nouveau 0000:02:00.0: DRM: DCB outp 03: 04822f86 04600010
[    1.040713] nouveau 0000:02:00.0: DRM: DCB outp 04: 04022f82 00020010
[    1.040716] nouveau 0000:02:00.0: DRM: DCB outp 06: 02033f62 00020010
[    1.040718] nouveau 0000:02:00.0: DRM: DCB outp 07: 02844f76 04600020
[    1.040721] nouveau 0000:02:00.0: DRM: DCB outp 08: 02044f72 00020020
[    1.040724] nouveau 0000:02:00.0: DRM: DCB conn 00: 00001031
[    1.040727] nouveau 0000:02:00.0: DRM: DCB conn 01: 02000146
[    1.040729] nouveau 0000:02:00.0: DRM: DCB conn 02: 01000246
[    1.040732] nouveau 0000:02:00.0: DRM: DCB conn 03: 00010361
[    1.040734] nouveau 0000:02:00.0: DRM: DCB conn 04: 00020446
[    1.041003] nouveau 0000:02:00.0: DRM: failed to create kernel channel, -22
[    1.041145] nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
[    1.322372] nouveau 0000:02:00.0: DRM: allocated 1920x1200 fb: 0x200000, bo 000000002ca87195
[    1.322442] fbcon: nouveaudrmfb (fb0) is primary device
[    1.646937] nouveau 0000:02:00.0: fb0: nouveaudrmfb frame buffer device
[    1.647186] [drm] Initialized nouveau 1.3.1 20120801 for 0000:02:00.0 on minor 0
