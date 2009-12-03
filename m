From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strange change in commit
 38c34b28f04518fec8ec474a6530d0fb37002cf5
Date: Fri, 04 Dec 2009 09:23:46 +1000
Message-ID: <1259882627.10792.0.camel@araqiel>
References: <6d4bc9fc0912031357w323cfe58v5dbe26fbc4a4aeca@mail.gmail.com>
	<91752840912031415v53d83b8dtc9e0bc98fd3c5e1@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752840912031415v53d83b8dtc9e0bc98fd3c5e1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2009-12-03 at 23:15 +0100, Xavier wrote:
> On Thu, Dec 3, 2009 at 10:57 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > diff --git a/drivers/gpu/drm/nouveau/nv10_fifo.c
> > b/drivers/gpu/drm/nouveau/nv10_fifo.c
> > index 877f00e..ed7f466 100644
> > --- a/drivers/gpu/drm/nouveau/nv10_fifo.c
> > +++ b/drivers/gpu/drm/nouveau/nv10_fifo.c
> > @@ -216,7 +216,7 @@ nv10_fifo_init_ramxx(struct drm_device *dev)
> >                                       (dev_priv->ramht_offset >> 8));
> >        nv_wr32(dev, NV03_PFIFO_RAMRO, dev_priv->ramro_offset>>8);
> >
> > -       if (dev_priv->card_type > NV_11) {
> > +       if (dev_priv->chipset < 0x17) {
> >                nv_wr32(dev, NV03_PFIFO_RAMFC, (dev_priv->ramfc_offset >> 8) |
> >                                               (1 << 16) /* 64 Bytes entry*/);
> >                /* XXX nvidia blob set bit 18, 21,23 for nv20 & nv30 */
> >
> >
> >
> > That strikes me as somewhat odd.
> >
> 
> This change made my nv25 literally angry :D
Oops, sorry about that.  Fixed in git.

Ben.
> 
> [   16.303268] [drm] nouveau 0000:03:00.0: PFIFO still angry after 101
> spins, halt
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
