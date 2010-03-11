From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Interrupt setting
Date: Fri, 12 Mar 2010 07:21:11 +0900
Message-ID: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: ja
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Hi all,

I am a Nouveau user on FC12 with GeForce 9500GT.
I have read the Nouveau wiki documents, and they imply that there are ways
to set GPU to send interrupts to CPU, when we want to be notified for
something, e.g., when DMA transfer or GPU operation is completed.
By default, when I run an OpenGL demo application from Gallium3D, the driver
gets no interrupts from GPU in nouveau_irq_handler(), except that it gets
one NV_PFIFO_INTR_CACHE_ERROR interrupt right after the FIFO is allocated.
According to the wiki docs, I need to set
NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN into the 'notify'
field of an object in a channel.
Hence, I tried seting a flag to a DMA notifier in nouveau_dma_init():

// seems entry[1] is related to a DMA notifier?
nv_wo32(dev, m2mf, 1,
NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN);

I also tried sending some command:

// guess this is a very wrong way ;-)
BEGIN_RING(chan, NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY, 1);
OUT_RING(chan, NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN);

But they both did not work...
How can we set GPU to send interrupts to CPU?
I would appreciate your comments.

Thanks,
- Shinpei
