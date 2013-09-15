From: P NIKOLIC <p.nikolic1-FhtRXb7CoQBt1OO0OYaSVA@public.gmane.org>
Subject: nouveau errors failure  lockups
Date: Sun, 15 Sep 2013 10:38:55 +0100
Message-ID: <20130915103855.18b73ef8.p.nikolic1@btinternet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi .

For some time now i have had problems with video on this system  .

from dmesg iget the following 

 6.408406] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a5000a2
[    6.408411] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT216 (NVA5)
[    6.408414] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    6.409206] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.513939] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.513941] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    6.514101] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.514104] nouveau  [   VBIOS][0000:01:00.0] version 70.16.39.00.0f
[    6.514469] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    6.514471] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    6.514473] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 1920 tags


 7.188561] nouveau  [     DRM] VRAM: 1024 MiB
[    7.188567] nouveau  [     DRM] GART: 512 MiB
[    7.188575] nouveau  [     DRM] TMDS table version 2.0
[    7.188577] nouveau  [     DRM] DCB version 4.0
[    7.188581] nouveau  [     DRM] DCB outp 00: 01000302 00020030
[    7.188583] nouveau  [     DRM] DCB outp 01: 02000300 00000000
[    7.188586] nouveau  [     DRM] DCB outp 02: 01032310 00000000
[    7.188587] nouveau  [     DRM] DCB outp 03: 02021362 00020010
[    7.188589] nouveau  [     DRM] DCB conn 00: 00001030
[    7.188592] nouveau  [     DRM] DCB conn 01: 00002161
[    7.188594] nouveau  [     DRM] DCB conn 02: 00000200
[    7.197040] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    7.197042] [drm] No driver support for vblank timestamp query.
[    7.197188] nouveau  [     DRM] 3 available performance level(s)
[    7.197191] nouveau  [     DRM] 0: core 135MHz shader 270MHz memory 135MHz
 voltage 850mV [    7.197194] nouveau  [     DRM] 1: core 405MHz shader 810MHz
 memory 324MHz voltage 900mV [    7.197197] nouveau  [     DRM] 3: core 625MHz
 shader 1360MHz memory 400MHz voltage 1000mV [    7.197200] nouveau  [     DRM] c:
 core 405MHz shader 810MHz memory 324MHz voltage 900mV fanspeed 32% [    7.205654]
 nouveau  [     DRM] MM: using COPY for buffer copies [    7.267852] nouveau
 [     DRM] allocated 1280x1024 fb: 0x70000, bo ffff8800c277e000 [    7.267939]
 fbcon: nouveaufb (fb0) is primary device


 730.397758] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[274]] get
 0x00200294bc put 0x0020029508 ib_get 0x00000255 ib_put 0x00000256 state 0x80004290
 (err: INVALID_CMD) push 0x00400040 [  730.397937] nouveau E[  PGRAPH][0000:01:00.0]
 DATA_ERROR INVALID_VALUE [  730.397946] nouveau E[  PGRAPH][0000:01:00.0]
 DATA_ERROR [  730.397955] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000
 X[274]] subc 2 class 0x502d mthd 0x0284 data 0xffffffff [  730.397982] nouveau
 E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE [  730.397987] nouveau
 E[  PGRAPH][0000:01:00.0]  DATA_ERROR [  730.397999] nouveau
 E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000 X[274]] subc 2 class 0x502d mthd
 0x0288 data 0xffffffff [  730.398023] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
 INVALID_VALUE [  730.398027] nouveau E[  PGRAPH][0000:01:00.0]  DATA_ERROR
 [  730.398033] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000 X[274]] subc 2
 class 0x502d mthd 0x028c data 0xffffffff [ 1468.048083] nouveau
 E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[274]] get 0x00200333f0 put
 0x002003343c ib_get 0x00000098 ib_put 0x00000099 state 0x80004290 (err:
 INVALID_CMD) push 0x00400040 [ 1468.048262] nouveau E[  PGRAPH][0000:01:00.0]
 DATA_ERROR INVALID_VALUE [ 1468.048270] nouveau E[  PGRAPH][0000:01:00.0]
 DATA_ERROR [ 1468.048279] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000
 X[274]] subc 2 class 0x502d mthd 0x0280 data 0xffffffff [ 1468.048306] nouveau
 E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE [ 1468.048311] nouveau
 E[  PGRAPH][0000:01:00.0]  DATA_ERROR [ 1468.048319] nouveau
 E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000 X[274]] subc 2 class 0x502d mthd
 0x0284 data 0xffffffff [ 1468.048339] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR
 INVALID_VALUE [ 1468.048349] nouveau E[  PGRAPH][0000:01:00.0]  DATA_ERROR
 [ 1468.048355] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000 X[274]] subc 2
 class 0x502d mthd 0x0288 data 0xffffffff [ 1468.048376] nouveau
 E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE [ 1468.048385] nouveau
 E[  PGRAPH][0000:01:00.0]  DATA_ERROR [ 1468.048391] nouveau
 E[  PGRAPH][0000:01:00.0] ch 2 [0x003fb3a000 X[274]] subc 2 class 0x502d mthd
 0x028c data 0xffffffff [ 1488.832401] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER
 - ch 2 [X[274]] get 0x002003226c put 0x0020032324 ib_get 0x000001ca ib_put
 0x000001cb state 0x80000020 (err: INVALID_CMD) push 0x00400040


this leads to a completely locked system the onoy sucsessful way out is a hard reset

the system is 
 Linux 7-of-9 3.10.10-1-ARCH #1 SMP PREEMPT Fri Aug 30 11:30:06 CEST 2013 x86_64
GNU/Linux

AMD Phenome quad core  4Gb ram  GT216 video card 1Gb  
latest Arch linux fully updated KDE 4.11.1   

This has been happening for the last 6 kernel upgrades  

Thanks for any insight 


Pete .


-- 
Linux 7-of-9 3.10.10-1-ARCH #1 SMP PREEMPT Fri Aug 30 11:30:06 CEST 2013 x86_64
GNU/Linux
