From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: NV_PFIFO_INTR_DMA_PUSHER
Date: Mon, 04 Jan 2010 21:46:51 +0100
Message-ID: <4B4253BB.2000704@wp.pl>
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

Hello,

Could someone briefly describe (or point me to the documentation) what 
can be a reason for getting NV_PFIFO_INTR_DMA_PUSHER status 
(nouveau_fifo_irq_handler).

This started happening immediately after I set the nouveau_vram_pushbuf 
flag to TRUE ,it's 100% repetitive and causes fences not to be signaled.

Below is the debug log from moment of creation of fifo 1 to some point 
in time where fences should already be signaled:

[drm] nouveau _redefined_nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau Ch0/0x000000d0: 0x00080184
[drm] nouveau Ch0/0x000000d4: 0x80000005
[drm] nouveau Ch0/0x000000d8: 0x80000004
[drm] nouveau Ch0/0x000000dc: 0x0020030c
[drm] nouveau Ch0/0x000000e0: 0x00004000
[drm] nouveau Ch0/0x000000e4: 0x0080b000
[drm] nouveau Ch0/0x000000e8: 0x00001000
[drm] nouveau Ch0/0x000000ec: 0x00001000
[drm] nouveau Ch0/0x000000f0: 0x00001000
[drm] nouveau Ch0/0x000000f4: 0x00000004
[drm] nouveau Ch0/0x000000f8: 0x00000101
[drm] nouveau Ch0/0x000000fc: 0x00000000
[drm] nouveau Ch0/0x00000100: 0x00040100
[drm] nouveau Ch0/0x00000104: 0x00000000
EMIT: Ch0 -> 2
[drm] nouveau Ch0/0x00000108: 0x00040050
[drm] nouveau Ch0/0x0000010c: 0x00000002
[drm] nouveau Ch0/0x00000110: PUSH!
SIGNALLED: Ch0 -> 2
[drm] nouveau Ch1/0x00000090: 0x0080b002
[drm] nouveau Ch1/0x00000094: 0x00000000
EMIT: Ch1 -> 1
[drm] nouveau Ch1/0x00000098: 0x00040050
[drm] nouveau Ch1/0x0000009c: 0x00000001
[drm] nouveau Ch1/0x000000a0: PUSH!
[drm] nouveau Ch1/0x000000a0: PUSH!
[drm] nouveau Ch1/0x000000a0: 0x0080b122
[drm] nouveau Ch1/0x000000a4: 0x00000000
EMIT: Ch1 -> 2
[drm] nouveau Ch1/0x000000a8: 0x00040050
[drm] nouveau Ch1/0x000000ac: 0x00000002
[drm] nouveau Ch1/0x000000b0: PUSH!
[drm] nouveau Ch1/0x000000b0: PUSH!
[drm] nouveau PFIFO_DMA_PUSHER - Ch 1
SIGNALLED: Ch1 -> 1
[drm] nouveau Ch1/0x000000b0: 0x0080b482
[drm] nouveau Ch1/0x000000b4: 0x00000000
EMIT: Ch1 -> 3
[drm] nouveau Ch1/0x000000b8: 0x00040050
[drm] nouveau Ch1/0x000000bc: 0x00000003
[drm] nouveau Ch1/0x000000c0: PUSH!
[drm] nouveau Ch1/0x000000c0: PUSH!
[drm] nouveau Ch1/0x000000c0: 0x0080b542
[drm] nouveau Ch1/0x000000c4: 0x00000000
EMIT: Ch1 -> 4
[drm] nouveau Ch1/0x000000c8: 0x00040050
[drm] nouveau Ch1/0x000000cc: 0x00000004
[drm] nouveau Ch1/0x000000d0: PUSH!
[drm] nouveau Ch1/0x000000d0: PUSH!
[drm] nouveau Ch1/0x000000d0: 0x0080b602
[drm] nouveau Ch1/0x000000d4: 0x00000000
EMIT: Ch1 -> 5
[drm] nouveau Ch1/0x000000d8: 0x00040050
[drm] nouveau Ch1/0x000000dc: 0x00000005
[drm] nouveau Ch1/0x000000e0: PUSH!
[drm] nouveau Ch1/0x000000e0: PUSH!

Best regards,
Krzysztof
