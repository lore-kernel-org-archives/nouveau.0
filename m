From: pete nikolic <pg.nikolic1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Direct Firmware load error
Date: Tue, 9 Sep 2014 20:08:27 +0100
Message-ID: <20140909200827.67784613@7-of-9>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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


Hi Folks 

Getting a considerable number of these showing up  at the moment 


[  619.350185] nouveau 0000:01:00.0: Direct firmware load failed with error -2
[  619.350193] nouveau 0000:01:00.0: Falling back to user helper
[  619.352536] nouveau 0000:01:00.0: Direct firmware load failed with error -2
[  619.352543] nouveau 0000:01:00.0: Falling back to user helper
[  619.354243] nouveau E[    PBSP][0000:01:00.0] unable to load firmware data
[  619.354253] nouveau E[    PBSP][0000:01:00.0] init failed, -12


01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce GT 220] (rev a2)
 8.550547] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a5000a2
[    8.550552] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT216 (NVA5)
[    8.550554] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    8.550589] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    8.575610] microcode: CPU1: patch_level=0x010000c9
[    8.575626] microcode: CPU2: patch_level=0x010000c9
[    8.575640] microcode: CPU3: patch_level=0x010000c9
[    8.575743] microcode: Microcode Update Driver: v2.00
<tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba [    8.653229] nouveau
[   VBIOS][0000:01:00.0] ... appears to be valid [    8.653232] nouveau
[   VBIOS][0000:01:00.0] using image from PRAMIN [    8.653354] nouveau
[   VBIOS][0000:01:00.0] BIT signature found [    8.653357] nouveau
[   VBIOS][0000:01:00.0] version 70.16.39.00.0f [    8.653801] nouveau 0000:01:00.0:
irq 42 for MSI/MSI-X [    8.653810] nouveau  [     PMC][0000:01:00.0] MSI interrupts
enabled [    8.653852] nouveau
W[     PFB][0000:01:00.0][0x00000000][ffff880131719000] reclocking of this ram type
unsupported [    8.653855] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    8.653857] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB [    8.653859]
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 1920 tags [    8.654822] nouveau
[    VOLT][0000:01:00.0] GPU voltage: 900000uv

 9.221278] [TTM] Initializing DMA pool allocator
[    9.221302] nouveau  [     DRM] VRAM: 1024 MiB
[    9.221304] nouveau  [     DRM] GART: 1048576 MiB
[    9.221311] nouveau  [     DRM] TMDS table version 2.0
[    9.221314] nouveau  [     DRM] DCB version 4.0
[    9.221316] nouveau  [     DRM] DCB outp 00: 01000302 00020030
[    9.221319] nouveau  [     DRM] DCB outp 01: 02000300 00000000
[    9.221321] nouveau  [     DRM] DCB outp 02: 01032310 00000000
[    9.221322] nouveau  [     DRM] DCB outp 03: 02021362 00020010
[    9.221324] nouveau  [     DRM] DCB conn 00: 00001030
[    9.221326] nouveau  [     DRM] DCB conn 01: 00002161
[    9.221327] nouveau  [     DRM] DCB conn 02: 00000200
[    9.229117] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    9.229119] [drm] Driver supports precise vblank timestamp query.
[    9.237570] nouveau  [     DRM] MM: using COPY for buffer copies

Linux 7-of-9 3.16.2-1-ARCH #1 SMP PREEMPT Sat Sep 6 13:12:51 CEST 2014 x86_64
GNU/Linux

CPU    AMD  Phenome  quad core    4Gb Ram  

Need more info tell me what and how 


Cheers Pete 

-- 
Please note: No trees were killed in the sending of this message. 
However a large number of electrons were terribly inconvenienced.
