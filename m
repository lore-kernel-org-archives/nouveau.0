From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: Interrupt setting
Date: Sat, 13 Mar 2010 06:14:58 +0900
Message-ID: <000b01cac229$148be2c0$3da3a840$@is.s.u-tokyo.ac.jp>
References: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>
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

Hi,

I am responding to myself...
Interrupts now work; I should have set the
NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN flag every time a
command is sent.
In fact, I thought this flag tells GPU to notify us of when DMA transfers
are done, but I got PGRAPH_NOTIFY interrupts by this.
It sounds to me that they notify of when GPU operations are done rather than
DMA transfers.
# PGRAPH_BUFFER_NOTIFY sounds more related to DMA transfers.

Is my understanding wrong?
I appreciate any comments or information about this.

Best regards,
- Shinpei

> -----Original Message-----
> From: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> [mailto:nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org] On Behalf Of Shinpei KATO
> Sent: Friday, March 12, 2010 7:21 AM
> To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: [Nouveau] Interrupt setting
> 
> Hi all,
> 
> I am a Nouveau user on FC12 with GeForce 9500GT.
> I have read the Nouveau wiki documents, and they imply that there are ways
> to set GPU to send interrupts to CPU, when we want to be notified for
> something, e.g., when DMA transfer or GPU operation is completed.
> By default, when I run an OpenGL demo application from Gallium3D, the
driver
> gets no interrupts from GPU in nouveau_irq_handler(), except that it gets
> one NV_PFIFO_INTR_CACHE_ERROR interrupt right after the FIFO is allocated.
> According to the wiki docs, I need to set
> NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN into the
> 'notify'
> field of an object in a channel.
> Hence, I tried seting a flag to a DMA notifier in nouveau_dma_init():
> 
> // seems entry[1] is related to a DMA notifier?
> nv_wo32(dev, m2mf, 1,
> NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN);
> 
> I also tried sending some command:
> 
> // guess this is a very wrong way ;-)
> BEGIN_RING(chan, NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY, 1);
> OUT_RING(chan,
> NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY_STYLE_WRITE_LE_AWAKEN);
> 
> But they both did not work...
> How can we set GPU to send interrupts to CPU?
> I would appreciate your comments.
> 
> Thanks,
> - Shinpei
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
