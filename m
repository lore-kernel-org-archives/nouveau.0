From: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mesa: Patch that fix/add missing WAIT_RING calls
Date: Fri, 17 Dec 2010 10:23:12 +0100
Message-ID: <AANLkTinc=jqbXdU2KKrS8DWT4bBd1ScxWWJN6K_qGs22@mail.gmail.com>
References: <AANLkTinj4TObB1Mb9mG3T74OQiyKd+vK1Dk-WYuT6=Qc@mail.gmail.com>
	<1292516458.2113.21.camel@Portable-Work>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1292516458.2113.21.camel@Portable-Work>
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

2010/12/16 Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>:
> Hi Michel,
>
> had a short look on this, as far as i can tell at the time the patch
> looks fairly good and we really need this checks.
>
> Some small notes:
>
> 1. In loops with fixed iterations the WAIT_RING should be called before
> the loop, not inside. I think it is ok if we waste a few pushbuf entries
> to avoid calling libdrm too often.
>
> See for example nvfx_push_vbo and nvfx_render_prim.
>

Calling WAIT_RING is almost a NOOP since most of the function is
inlined in the short path (more likely to happen, else the buffer is
too really small).
So wasting is few pushbuffer entries is ok for me, but since it is
almost a NOOP, I see it as a bad practice. I mean, if you group the
atomical RING command together, one can hardly make a misstake.
On IRC I was advised to change most of the WAIT_RING to BEGIN_RING,
that as quite some sence to me. Even if I guess the subchannel was
binded explicitly for performance reasons or because it's the only
subchannel to support the 3D objects (I didn't checked, but I guess
it's a pure convention), lets be in the safe way, if one day we remove
the explicit bind. While I agree it as some cost to call BEGIN_RING,
it still sounds quite resonable, since it is inlined.


>
> 2. You decreased the size of the checks in several places. We should
> review all of them before pushing this changes. I remember some of them
> had some offset for some crude reason. I will review them by this
> weekend if no one does it earlier.
>

Review them ;) I'm quite confident since I used one game (using quake
engine) for around 45 minutes before quitting cleanly, while in the
past it was crashing randomly ine less then 1 minutes when huge vertex
loads happened ;)
