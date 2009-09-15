From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [Nouveau-cvs] xf86-video-nv: Branch 'master'
Date: Tue, 15 Sep 2009 20:28:15 +0300
Message-ID: <20090915202815.6bd13d8c@daedalus.pq.iki.fi>
References: <20090914030659.B24CD10051@kemper.freedesktop.org>
	<20090914202651.2223b5ff@daedalus.pq.iki.fi>
	<1252976178.8199.1.camel@keine.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1252976178.8199.1.camel-oFTkVezJ1HzzwxVw7NwMvg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Ben Skeggs <darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 15 Sep 2009 10:56:18 +1000
Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, 2009-09-14 at 20:26 +0300, Pekka Paalanen wrote:
> > On Sun, 13 Sep 2009 20:06:59 -0700 (PDT)
> > darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org (Ben Skeggs) wrote:
> > 
> > >  src/drmmode_display.c |    6 ++++++
> > >  src/nv_driver.c       |    2 ++
> > >  2 files changed, 8 insertions(+)
> > > 
> > > New commits:
> > > commit 6c045fc44783454180d7b3d00b5f25436bd5544e
> > > Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > Date:   Mon Sep 14 13:04:12 2009 +1000
> > > 
> > >     kms: wait for fbcon to be copied before continuing
> > > 
> > > diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> > > index 3010396..e152e7f 100644
> > > --- a/src/drmmode_display.c
> > > +++ b/src/drmmode_display.c
> > > @@ -215,6 +215,12 @@ drmmode_fbcon_copy(ScrnInfoPtr pScrn)
> > >  	exa->DoneCopy(pdpix);
> > >  	FIRE_RING (pNv->chan);
> > >  
> > > +	/* wait for completion before continuing, avoids seeing a momentary
> > > +	 * flash of "corruption" on occasion
> > > +	 */
> > > +	nouveau_bo_map(pNv->scanout, NOUVEAU_BO_RDWR);
> > > +	nouveau_bo_unmap(pNv->scanout);
> > > +
> > >  	pScreen->DestroyPixmap(pdpix);
> > >  	pScreen->DestroyPixmap(pspix);
> > >  }
> > > diff --git a/src/nv_driver.c b/src/nv_driver.c
> > > index 9317b5e..645895d 100644
> > > --- a/src/nv_driver.c
> > > +++ b/src/nv_driver.c
> > > @@ -741,6 +741,8 @@ NVPreInitDRM(ScrnInfoPtr pScrn)
> > >  	 */
> > >  #ifdef XF86DRM_MODE
> > >  	pNv->kms_enable = !drmCheckModesettingSupported(bus_id);
> > > +	if (pNv->kms_enable)
> > > +	    pScrn->canDoBGNoneRoot = 1;
> > >  #endif
> > >  	xf86DrvMsg(pScrn->scrnIndex, X_PROBED,
> > >  		   "[drm] kernel modesetting %s\n", pNv->kms_enable ?
> > 
> > What does this latter hunk do?
> > It just seems completely irrelevant wrt. the commit message.
> It's something that's needed for fedora's X server to get the completely
> smooth transition from plymouth (graphical boot thingo) to gdm.  It
> tells X that the driver supports the transition and stops X from
> zeroing/filling in the root window on startup.
> 
> For whatever reason the patch hasn't made it to the upstream X server as
> of yet.

Don't we need any version #ifdef's around that?

SparFux reported:
nv_driver.c:745: error: 'struct _ScrnInfoRec' has no member
named 'canDoBGNoneRoot'
but I don't know what xorg-server version he has.

My xorg-server from git two days ago has the same failure, but
that is expected, I understand.

I hear it also breaks build against 1.6.3.901, and people
think that last hunk should be reverted regardless.
So I will revert it for now.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
