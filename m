From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50: initialize ramht_refs list for
 faked 0 channel
Date: Thu, 2 Sep 2010 16:00:59 +0200
Message-ID: <20100902140059.GA2769@joi.lan>
References: <20100822185408.GA2883@joi.lan> <20100831212223.GA12076@joi.lan>
	<1283291578.23822.2.camel@nisroch> <20100902104544.GA2716@joi.lan>
	<1283430715.31735.2.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1283430715.31735.2.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Sep 02, 2010 at 10:31:55PM +1000, Ben Skeggs wrote:
> On Thu, 2010-09-02 at 12:45 +0200, Marcin Slusarz wrote:
> > On Wed, Sep 01, 2010 at 07:52:58AM +1000, Ben Skeggs wrote:
> > > On Tue, 2010-08-31 at 23:22 +0200, Marcin Slusarz wrote:
> > > > On Sun, Aug 22, 2010 at 08:54:08PM +0200, Marcin Slusarz wrote:
> > > > > We need it for PFIFO_INTR_CACHE_ERROR interrupt handling,
> > > > > because nouveau_fifo_swmthd looks for matching gpuobj in
> > > > > ramht_refs list.
> > > > > It fixes kernel panic in nouveau_gpuobj_ref_find.
> > > > > 
> > > > > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > ---
> > > > >  drivers/gpu/drm/nouveau/nv50_instmem.c |    2 ++
> > > > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nouveau/nv50_instmem.c
> > > > > index b57cc4a..6e57426 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nv50_instmem.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
> > > > > @@ -139,6 +139,8 @@ nv50_instmem_init(struct drm_device *dev)
> > > > >  	chan->file_priv = (struct drm_file *)-2;
> > > > >  	dev_priv->fifos[0] = dev_priv->fifos[127] = chan;
> > > > >  
> > > > > +	INIT_LIST_HEAD(&chan->ramht_refs);
> > > > > +
> > > > >  	/* Channel's PRAMIN object + heap */
> > > > >  	ret = nouveau_gpuobj_new_fake(dev, 0, c_offset, c_size, 0,
> > > > >  							NULL, &chan->ramin);
> > > > > -- 
> > > > 
> > > > ping
> > > Pong!  Thank you for the patch.
> > > 
> > > I meant to reply to this earlier but it slipped my mind.  I have a
> > > number of pending cleanups to all this stuff that should make this patch
> > > unnecessary.
> > 
> > Oh, come on. It's a simple one-line bugfix for easily triggerable kernel panic.
> > Patch like this should not wait a week for any response - it should be applied
> > ASAP and go to Linus possibly with -stable tag.
> Oh please, it's hardly easily triggerable.  I've *never* seen it
> personally, and triggering errors on those channels isn't something that
> generally happens. 

Are you sure you have *never* seen it? Do you have netconsole enabled all the time?
I'm asking because once you hit this bug, machine is dead and you won't find anything
in the logs.

I'm attaching the testcase. Yes, it's that simple.

--
#include <stdio.h>

#include <libdrm/nouveau_drmif.h>
#include <nouveau/nouveau_channel.h>

int main()
{
	struct nouveau_device *dev = NULL;
	struct nouveau_channel *chan = NULL;

	if (nouveau_device_open(&dev, "")) {
		perror("nouveau_device_open");
		return 1;
	}

	if (nouveau_channel_alloc(dev, 0, 0, &chan)) {
		perror("nouveau_channel_alloc");
		return 2;
	}

	return 0;
}
