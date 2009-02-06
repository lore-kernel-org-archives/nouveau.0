From: Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Subject: DRM fills logs
Date: Fri, 06 Feb 2009 07:09:14 -0800
Message-ID: <498C529A.8060601@seiner.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I have a system with 3 video cards; 2 dual-DVI and one single DVI.  I'd 
like to get nouveau running on this system.

selene:/var/log# lspci | grep VGA
01:07.0 VGA compatible controller: nVidia Corporation NV34GL [Quadro NVS 
280 PCI] (rev a1)
02:00.0 VGA compatible controller: nVidia Corporation NV44 [Quadro NVS 
285] (rev a1)
07:00.0 VGA compatible controller: nVidia Corporation NV44 [Quadro NVS 
285] (rev a1)
selene:/var/log# uname -a
Linux selene 2.6.28.1 #1 SMP Wed Feb 4 06:37:57 PST 2009 x86_64 GNU/Linux

I'm playing around with nouveau.  So far I can usually get my mottled 
screen... But I'm having issues with drm filling logs with error messages:

Feb  6 06:20:56 selene kernel: [46184.757275] [drm] Initialized drm 
1.1.0 20060810
Feb  6 06:21:04 selene kernel: [46193.375960] [drm] Detected an NV30 
generation card (0x034a00b1)
Feb  6 06:21:04 selene kernel: [46193.375968] [drm] Initialized nouveau 
0.0.11 libdrm-2.4.4-8-ge37bd24d3c99319b3 on minor 0
Feb  6 06:21:04 selene kernel: [46193.376063] nouveau 0000:02:00.0: 
setting latency timer to 64
Feb  6 06:21:04 selene kernel: [46193.376282] [drm] Detected an NV44 
generation card (0x044500a2)
Feb  6 06:21:04 selene kernel: [46193.376288] [drm] Initialized nouveau 
0.0.11 libdrm-2.4.4-8-ge37bd24d3c99319b3 on minor 1
Feb  6 06:21:04 selene kernel: [46193.376353] nouveau 0000:07:00.0: 
setting latency timer to 64
Feb  6 06:21:04 selene kernel: [46193.376559] [drm] Detected an NV44 
generation card (0x044500a2)
Feb  6 06:21:04 selene kernel: [46193.376564] [drm] Initialized nouveau 
0.0.11 libdrm-2.4.4-8-ge37bd24d3c99319b3 on minor 2
Feb  6 06:28:53 selene kernel: [46662.450777] Xorg[27849] general 
protection ip:7f7763c7e0a3 sp:7fff6be91000 error:0 in 
ld-2.7.so[7f7763c75000+1c000]
Feb  6 06:30:30 selene kernel: [46759.205784] [drm] Allocating FIFO number 0
Feb  6 06:30:30 selene kernel: [46759.208208] [drm] nouveau_fifo_alloc: 
initialised FIFO 0
Feb  6 06:30:30 selene kernel: [46759.209835] [drm] Allocating FIFO number 1
Feb  6 06:30:30 selene kernel: [46759.211531] [drm] nouveau_fifo_alloc: 
initialised FIFO 1
Feb  6 06:30:30 selene kernel: [46759.425387] [drm] Allocating FIFO number 0
Feb  6 06:30:30 selene kernel: [46759.426912] [drm] nouveau_fifo_alloc: 
initialised FIFO 0
Feb  6 06:30:30 selene kernel: [46759.429360] [drm] Allocating FIFO number 1
Feb  6 06:30:30 selene kernel: [46759.430525] [drm] nouveau_fifo_alloc: 
initialised FIFO 1
Feb  6 06:32:18 selene kernel: [46866.525747] [drm] nouveau_fifo_free: 
freeing fifo 1

And from here on forever, drm starts filling my logs (this is partial; 
it dumps these messages at the rate of hundreds per second):

eb  6 06:32:18 selene kernel: 7] [drm] PFIFO_CACHE_ERROR - Ch1] [drm5] 
[drm1] [drm] PFIFO_CACHE_ERROR - C5] [drm8] [drm]4] [drm] 
PFIFO_CACHE_ERROR - Ch 38] [d2] [drm]8] [drm] PFIFO_CACHE_ERROR - Ch 
312] [d6] [drm2] [drm] PFIFO_CACHE_ERROR - Ch6] [d9] [drm]5] [drm] 
PFIFO_CACHE_ERROR - Ch9] [dr3] [drm9] [drm] PFIFO_CACHE_ERROR - Ch 3] 
[dr6] [dr3] [drm] PFIFO_CACHE_ERROR - 7] [dr0] [dr6] [drm] 
PFIFO_CACHE_ERROR - C0] [dr4] [drm0] [drm] PFIFO_CACHE_ERROR - Ch 4] 
[d8] [dr4] [drm] PFIFO_CACHE_ERROR - Ch8] [d1] [drm]7] [drm] 
PFIFO_CACHE_ERROR - C1] [d5] [drm]1] [drm] PFIFO_CACHE_ERROR - Ch 5] [8] 
[drm]5] [drm] PFIFO_CACHE_ERROR - Ch 9] [dr2] [drm8] [drm] 
PFIFO_CACHE_ERROR - Ch 2] [dr6] [drm2] [drm] PFIFO_CACHE_ERROR - Ch 6] 
[dr9] [d6] [drm] PFIFO_CACHE_ERROR - Ch 0] [d3] [drm]9] [drm] 
PFIFO_CACHE_ERROR - Ch 33] [dr7] [drm3] [drm] PFIFO_CACHE_ERROR - Ch 37] 
[dr1] [drm]7] [drm] PFIFO_CACHE_ERROR - Ch 31] [drm4] [drm]1] [drm] 
PFIFO_CACHE_ERROR - C5] [dr8] [drm]4] [drm] PFIFO_CACHE_ERROR - 8] [dr2] 
[drm8] [drm] PFIFO_CAC
Feb  6 06:32:18 selene kernel: RROR - Ch2] [d6] [drm2] [drm] 
PFIFO_CACHE_ERROR - 6] [d9] [drm5] [drm] PFIFO_CACHE_ERROR - Ch 9] [d3] 
[drm9] [drm] PFIFO_CACHE_ERROR - Ch 3] [d7] [drm]3] [drm] 
PFIFO_CACHE_ERROR - Ch 7] [dr0] [drm]7] [drm] PFIFO_CACHE_ERROR - C1] 
[dr4] [drm0] [drm] PFIFO_CACHE_ERROR - Ch 34] [d8] [drm4] [drm] 
PFIFO_CACHE_ERROR - Ch 318] [d2] [drm8] [drm] PFIFO_CACHE_ERROR - Ch 2] 
[drm5] [dr2] [drm] PFIFO_CACHE_ERROR - Ch 315] [dr9] [dr5] [drm] 
PFIFO_CACHE_ERROR - Ch9] [dr3] [drm]9] [drm] PFIFO_CACHE_ERROR - 3] 
[dr7] [drm3] [drm] PFIFO_CACHE_ERROR - 7] [d0] [drm6] [drm] 
PFIFO_CACHE_ERROR - 0] [d4] [drm0] [drm] PFIFO_CACHE_ERROR - Ch 4] [d8] 
[dr4] [drm] PFIFO_CACHE_ERROR - C8] [d1] [drm8] [drm] PFIFO_CACHE_ERROR 
- Ch 32] [dr5] [drm]1] [drm] PFIFO_CACHE_ERROR - Ch 5] [d9] [drm]5] 
[drm] PFIFO_CACHE_ERROR - 9] [d3] [drm]9] [drm] PFIFO_CACHE_ERROR - Ch 
33] [d6] [drm2] [drm] PFIFO_CACHE_ERROR - Ch 6] [dr0] [drm]6] [drm] 
PFIFO_CACHE_ERROR - Ch1] [d4] [drm1] [drm] PFIFO_CACHE_ERROR - Ch 5] 
[d8] [d5] [drm]
Feb  6 06:32:18 selene kernel: O_CACHE_ERROR - Ch9] [dr3] [d9] [drm] 
PFIFO_CACHE_ERROR - 3] [dr6] [drm3] [drm] PFIFO_CACHE_ERROR - Ch 7] 
[dr0] [d6] [drm] PFIFO_CACHE_ERROR - 0] [d4] [drm0] [drm] 
PFIFO_CACHE_ERROR - C4] [dr8] [drm]4] [drm] PFIFO_CACHE_ERROR - Ch8] 
[d2] [drm]8] [drm] PFIFO_CACHE_ERROR - Ch 2] [dr5] [dr1] [drm] 
PFIFO_CACHE_ERROR - Ch5] [d9] [drm5] [drm] PFIFO_CACHE_ERROR - Ch 39] 
[d3] [drm9] [drm] PFIFO_CACHE_ERROR - Ch 3] [dr6] [drm]3] [drm] 
PFIFO_CACHE_ERROR - Ch 7] [dr0] [drm6] [drm] PFIFO_CACHE_ERROR - Ch 0] 
[d4] [drm]0] [drm] PFIFO_CACHE_ERROR - Ch 4] [d8] [dr4] [drm] 
PFIFO_CACHE_ERROR - 8] [dr1] [dr7] [drm] PFIFO_CACHE_ERROR - Ch1] [dr5] 
[drm1] [drm] PFIFO_CACHE_ERROR - Ch5] [d9] [drm5] [drm] 
PFIFO_CACHE_ERROR - Ch9] [d2] [drm]8] [drm] PFIFO_CACHE_ERROR - 2] [d6] 
[drm2] [drm] PFIFO_CACHE_ERROR - Ch 6] [d0] [drm6] [drm] 
PFIFO_CACHE_ERROR - Ch0] [dr3] [drm]9] [drm] PFIFO_CACHE_ERROR - Ch3] 
[dr7] [drm]3] [drm] PFIFO_CACHE_ERROR - Ch 317] [dr1] [dr7] [drm] 
PFIFO_CACHE_ERROR - Ch 31] [d4] [dr1] [
Feb  6 06:32:18 selene kernel:  PFIFO_CACHE_ERROR - C5] [d8] [d4] [drm] 
PFIFO_CACHE_ERROR - Ch 318] [dr2] [d8] [drm] PFIFO_CACHE_ERROR - Ch 2] 
[6] [drm2] [drm] PFIFO_CACHE_ERROR - C6] [dr9] [dr6] [drm] 
PFIFO_CACHE_ERROR - 0] [dr3] 0] [drm] PFIFO_CACHE_ERROR - Ch 34] [d8] 
[drm]5] [drm] PFIFO_CACHE_ERROR - 9] [d2] [drm]9] [drm] 
PFIFO_CACHE_ERROR - Ch 3] [d6] [drm]3] [drm] PFIFO_CACHE_ERROR - Ch 37] 
[d0] [drm7] [drm] PFIFO_CACHE_ERROR - Ch 1] [dr4] [drm0] [drm] 
PFIFO_CACHE_ERROR - Ch 314] [d8] [drm4] [drm] PFIFO_CACHE_ERROR - Ch 38] 
[dr2] [drm8] [drm] PFIFO_CACHE_ERROR - Ch 2] [dr6] [drm2] [drm] 
PFIFO_CACHE_ERROR - Ch 6] [dr9] [drm]5] [drm] PFIFO_CACHE_ERROR - Ch 39] 
[dr3] [drm9] [drm] PFIFO_CACHE_ERROR - Ch 313] [dr7] [drm]3] [drm] 
PFIFO_CACHE_ERROR - 7] [dr0] [drm6] [drm] PFIFO_CACHE_ERROR - C0] [d4] 
[drm]0] [drm] PFIFO_CACHE_ERROR - Ch4] [8] [dr4] [drm] PFIFO_CACHE_ERROR 
- Ch8] [d1] [drm7] [drm] PFIFO_CACHE_ERROR - C1] [dr5] [drm]1] [drm] 
PFIFO_CACHE_ERROR - Ch 35] [dr9] [drm5] [drm] PFIFO_CACHE_ERROR - C9] [d2
Feb  6 06:32:18 selene kernel: rm8] [drm] PFIFO_CACHE_ERROR - Ch2] [dr6] 
[drm]2] [drm] PFIFO_CACHE_ERROR - Ch 36] [dr0] [dr6] [drm8] [drm] 
PFIFO_CACHE_E2] [d5] [d2] [drm] PFIFO_CACHE_ERROR - Ch6] [d9] [drm]6] 
[drm] PFIFO_CACHE_ERROR - Ch0] [dr4] [drm]1] [drm] PFIFO_CACHE_ERROR - 
Ch5] [d8] [drm5] [drm] PFIFO_CACHE_ERROR - Ch9] [dr2] [drm]9] [drm] 
PFIFO_CACHE_ERROR - Ch 3] [dr6] [drm3] [drm] PFIFO_CACHE_ERROR - Ch 7] 
[d0] [drm7] [drm] PFIFO_CACHE_ERROR - Ch1] [d4] [drm1] [drm] 
PFIFO_CACHE_ERROR - Ch 4] [dr8] [drm4] [drm] PFIFO_CACHE_ERROR - Ch 8] 
[d2] [drm8] [drm] PFIFO_CACHE_ERROR - Ch 2] [d5] [dr1] [drm] 
PFIFO_CACHE_ERROR - C5] [dr9] [drm]5] [drm] PFIFO_CACHE_ERROR - C9] [d3] 
[drm9] [drm] PFIFO_CACHE_ERROR - Ch3] [d6] [dr2] [drm] PFIFO_CACHE_ERROR 
- Ch 6] [d0] [drm6] [drm] PFIFO_CACHE_ERROR - Ch 0] [d4] [drm0] [drm] 
PFIFO_CACHE_ERROR - Ch 4] [d7] [drm]3] [drm] PFIFO_CACHE_ERROR - Ch 7] 
[d1] [drm7] [drm] PFIFO_CACHE_ERROR - Ch1] [dr5] [dr1] [drm] 
PFIFO_CACHE_ERROR - Ch 35] [d8] [drm]4] [drm] PFIFO_CACHE_ERROR -
Feb  6 06:32:18 selene kernel:  [d2] [drm]8] [drm] PFIFO_CACHE_ERROR - 
Ch 32] [d5] [drm2] [drm] PFIFO_CACHE_ERROR - Ch 5] [d9] [d5] [drm] 
PFIFO_CACHE_ERROR -9] [dr3] [drm9] [drm] PFIFO_CACHE_ERROR - C3] [dr6] 
[drm]3] [drm] PFIFO_CACHE_ERROR - C6] [d0] [drm6] [drm] 
PFIFO_CACHE_ERROR - Ch0] [d4] [drm] 0] [drm] PFIFO_CACHE_ERROR - C4] 
[d7] [drm3] [drm] PFIFO_CACHE_ERROR - Ch 37] [d1] [dr7] [drm] 
PFIFO_CACHE_ERROR - Ch 31] [dr5] [d1] [drm] PFIFO_CACHE_ERROR - Ch 5] 
[d8] [dr4] [drm] PFIFO_CACHE_ERROR - Ch 318] [drm2] [drm]8] [drm] 
PFIFO_CACHE_ERROR - Ch 2] [d5] [drm2] [drm] PFIFO_CACHE_ERROR - C5] 
[dr9] [drm]5] [drm] PFIFO_CACHE_ERROR - Ch 39] [d3] [dr9] [drm] 
PFIFO_CACHE_ERROR - C3] [d6] [3] [drm] PFIFO_CACHE_ERROR - Ch6] [d0] 
[drm6] [drm] PFIFO_CACHE_ERROR -0] [d4] [drm0] [drm] PFIFO_CACHE_ERROR - 
C4] [d7] [drm4] [drm] PFIFO_CACHE_ERROR - C8] [d1] [drm7] [drm] 
PFIFO_CACHE_ERROR - C1] [d5] [drm1] [drm] PFIFO_CACHE_ERROR - Ch 35] 
[d8] [drm5] [drm] PFIFO_CACHE_ERROR - Ch 8] [d2] [drm8] [drm] 
PFIFO_CACHE_ERROR - Ch 31
Feb  6 06:32:18 selene kernel: thd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.545072] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.545076] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611291] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611295] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611298] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611305] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611308] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611312] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611318] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611322] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611326] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611332] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611336] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611339] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611345] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611349] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611353] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611359] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611363] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611366] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611373] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611377] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611380] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611386] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611390] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611394] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611400] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611404] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611407] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611414] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611418] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611421] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611427] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611431] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611435] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611441] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611445] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611448] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611454] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611458] [drm] PFIFO_DMA_PUSHER - Ch 31
Feb  6 06:32:18 selene kernel: [46866.611462] [drm] Unhandled PFIFO_INTR 
- 0xffffeffe
Feb  6 06:32:18 selene kernel: [46866.611468] [drm] PFIFO_CACHE_ERROR - 
Ch 31/7 Mthd 0x1ffc Data 0xffffffff
Feb  6 06:32:18 selene kernel: [46866.611472] [drm] PFIFO_DMA_PUSHER - Ch 31
