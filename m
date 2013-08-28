From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 3/6] drm/nouveau: hook up cache sync functions
Date: Wed, 28 Aug 2013 18:58:37 +0200
Message-ID: <1377709117.1733.3.camel@tellur>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
	<1377648050-6649-4-git-send-email-dev@lynxeye.de>
	<20130828164357.GB27172@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130828164357.GB27172-6K5HmflnPlqSPmnEAIUT9EEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Mittwoch, den 28.08.2013, 12:43 -0400 schrieb Konrad Rzeszutek Wilk:
> On Wed, Aug 28, 2013 at 02:00:47AM +0200, Lucas Stach wrote:
> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c  | 4 ++++
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 5 +++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index af20fba..f4a2eb9 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -411,6 +411,10 @@ nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
> >  {
> >  	int ret;
> >  
> > +	if (nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)
> 
> You don't want to do it also for tt_wc ?
> 
No the point of using writecombined memory for BOs is to explicitly
avoid the need for this cache sync. An uncached MMIO read from the
device should already flush out all writecombining buffers and this read
is always happening when submitting a pushbuf.

> > +		ttm_dma_tt_cache_sync_for_device((struct ttm_dma_tt *)nvbo->bo.ttm,
> > +			&nouveau_bdev(nvbo->bo.ttm->bdev)->dev->pdev->dev);
> > +
> >  	ret = ttm_bo_validate(&nvbo->bo, &nvbo->placement,
> >  			      interruptible, no_wait_gpu);
> >  	if (ret)
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 830cb7b..f632b92 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -901,6 +901,11 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
> >  	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
> >  	spin_unlock(&nvbo->bo.bdev->fence_lock);
> >  	drm_gem_object_unreference_unlocked(gem);
> > +
> > +	if (!ret && nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)
> 
> Ditto?
cpu_prep is used to make the kernel aware of a following userspace read.
Writecombined mappings are essentially uncached from the read
perspective.

>  
> > +		ttm_dma_tt_cache_sync_for_cpu((struct ttm_dma_tt *)nvbo->bo.ttm,
> > +					      &dev->pdev->dev);
> > +
> >  	return ret;
> >  }
> >  
> > -- 
> > 1.8.3.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
