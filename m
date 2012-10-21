From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix nouveau_mm/nouveau_mm_node
 leak
Date: Mon, 22 Oct 2012 08:43:03 +1000
Message-ID: <20121021224303.GA4575@turiel.bne.redhat.com>
References: <20121011215309.GA3511@joi.lan>
	<20121019060514.GA11173@turiel.bne.redhat.com>
	<20121021221935.GA2925@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121021221935.GA2925-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Oct 22, 2012 at 12:19:35AM +0200, Marcin Slusarz wrote:
> On Fri, Oct 19, 2012 at 04:05:14PM +1000, Ben Skeggs wrote:
> > On Thu, Oct 11, 2012 at 11:53:09PM +0200, Marcin Slusarz wrote:
> > > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/nouveau/core/core/gpuobj.c         | 6 +++++-
> > >  drivers/gpu/drm/nouveau/core/include/core/gpuobj.h | 3 +++
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/core/core/gpuobj.c b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> > > index c2a7608..48121d2 100644
> > > --- a/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> > > +++ b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> > > @@ -39,8 +39,11 @@ nouveau_gpuobj_destroy(struct nouveau_gpuobj *gpuobj)
> > >  			nv_wo32(gpuobj, i, 0x00000000);
> > >  	}
> > >  
> > > +	if (gpuobj->node)
> > > +		nouveau_mm_free(gpuobj->node_heap, &gpuobj->node);
> > > +
> > if (gpuobj->node) {
> > 	nouveau_mm_free(&nv_gpuobj(gpuobj->parent)->heap,
> > 			&gpuobj->node);
> > }
> > 
> > Or something to that effect, instead of having to store the heap
> > pointer again.
Thanks, merged both patches :)

> 
> Oh, right.
> (Somehow I assumed pargpu to be different object than parent when
> I first read it.)
> 
> > >  	if (gpuobj->heap.block_size)
> > > -		nouveau_mm_fini(&gpuobj->heap);
> > > +		WARN_ON(nouveau_mm_fini(&gpuobj->heap));
> > Alright, I get this.  However, perhaps we should go the full hog here
> > and make nouveau_mm_fini() directly do the WARN_ON() in this situation?
> > 
> > There was, once upon a time, reasons for it not doing this, I don't
> > believe they're valid anymore though.
> 
> OK.
> 
> Marcin
