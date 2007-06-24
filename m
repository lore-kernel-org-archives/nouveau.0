From: "Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: G80
Date: Sat, 23 Jun 2007 21:51:23 -0400
Message-ID: <62cc563b0706231851x5db3ba7cg387803714381f5a2@mail.gmail.com>
References: <3a7f9e660706230934k27e70a2ah60a5a90805664f2a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3a7f9e660706230934k27e70a2ah60a5a90805664f2a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Wladimir van der Laan <laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Wladimir,
   Check out:  http://dri.freedesktop.org/wiki/ReverseEngineering

I don't know how cuda drives that card, but you probably want kmmio or
libsegfault.

Those will catch the direct writes to the MMIO space of the card.
However, if they do clever things like put the commands in a buffer,
and then DMA that in to execute it, you have to get more sophisticated
to trace it.

I'm just a radeon guy, so the nouveau could probably fill in some more details.

Cheers,
--Phil

On 6/23/07, Wladimir van der Laan <laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi there,
>
> I'd like to help on finding out more details about the G8x hardware
> from NVidia, especially given these cards have more functionality than
> your average GPU: with CUDA (
> http://developer.nvidia.com/object/cuda.html ) it is possible to use
> them as compute devices.
>
> This makes me very interested in their low level capabilities, like
> microcode/shader specifications, and maybe even how to drive them
> without the NVidia binary driver blob. It seems the hardware has a lot
> more possibilities than the current libraries expose, for various
> reasons.
>
> To do this, I'd like to intercept communications between libcuda.so
> and the /dev/nvidia* devices, and /dev/nvidiactl. Is this what the
> Noveau developers have been doing already for GL? (I'm new to this)
>
> Also, as more people are working on it according to TiNDC #21, can I
> find the things that are already known somewhere?
>
> --
> Wladimir
> Ogre3D Team (http://www.ogre3d.org)
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
