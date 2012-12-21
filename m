From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix ramht wraparound
Date: Fri, 21 Dec 2012 09:02:17 +0100
Message-ID: <20121221080217.GA3108@joi.lan>
References: <1356043034-25739-5-git-send-email-marcin.slusarz@gmail.com>
	<20121221001548.GA3839@turiel.bne.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121221001548.GA3839-6RkuLLNOGXsZ315U/fw+0NvLeJWuRmrY@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Dec 21, 2012 at 10:15:48AM +1000, Ben Skeggs wrote:
> On Thu, Dec 20, 2012 at 11:37:12PM +0100, Marcin Slusarz wrote:
> > When hash collision occurs and it's near ramht object boundary, we could
> > read and possibly overwrite some memory after ramht object.
> > 
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  drivers/gpu/drm/nouveau/core/core/ramht.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/core/core/ramht.c b/drivers/gpu/drm/nouveau/core/core/ramht.c
> > index 86a6404..6da314c 100644
> > --- a/drivers/gpu/drm/nouveau/core/core/ramht.c
> > +++ b/drivers/gpu/drm/nouveau/core/core/ramht.c
> > @@ -59,7 +59,7 @@ nouveau_ramht_insert(struct nouveau_ramht *ramht, int chid,
> >  		}
> >  
> >  		co += 8;
> > -		if (co >= nv_gpuobj(ramht)->size)
> > +		if (co + 8 > nv_gpuobj(ramht)->size)
> I might just be really tired, but, how exactly is the original wrong?
> The original could even just be (co == size) and still work correctly as
> far as I can tell.

Ah, crap, I didn't see that both hash value and ramht->size are divisible by 8.
So original code is correct (although it relies on the above) and my version
does not really fix anything.

Marcin
