From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau/dri2: don't try to page flip pixmaps
Date: Sun, 6 May 2012 21:04:32 +0200
Message-ID: <20120506190432.GD4311@joi.lan>
References: <20120503125016.GA8466@joi.lan> <87397hv20o.fsf@riseup.net>
	<20120503164648.GA1761@joi.lan> <87wr4sucbb.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87wr4sucbb.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michel =?utf-8?Q?D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, May 04, 2012 at 12:31:04AM +0200, Francisco Jerez wrote:
> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > On Thu, May 03, 2012 at 03:15:51PM +0200, Francisco Jerez wrote:
> >> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> >> 
> >> > Port of commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-ati.
> >> >
> >> > Fixes https://bugs.freedesktop.org/show_bug.cgi?id=49351
> >> >
> >> > (Additionally, don't try to pageflip if user disabled it in xorg.conf.
> >> > Currently this change is a no-op, because can_exchange returns true only when
> >> > page flipping is enabled, but commit 169512fbe91f0671a90dfee5e280357f0a4ef701 -
> >> > which changed can_exchange behavior - is due to be reverted)
> >> > ---
> >> >  src/nouveau_dri2.c |    3 ++-
> >> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >> >
> >> > diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> >> > index 588735f..3d8d22f 100644
> >> > --- a/src/nouveau_dri2.c
> >> > +++ b/src/nouveau_dri2.c
> >> > @@ -328,7 +328,8 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
> >> >  		type = DRI2_EXCHANGE_COMPLETE;
> >> >  		DamageRegionAppend(draw, &reg);
> >> >  
> >> > -		if (DRI2CanFlip(draw)) {
> >> > +		if (DRI2CanFlip(draw) && pNv->has_pageflip &&
> >> > +				draw->type == DRAWABLE_WINDOW) {
> >> 
> >> Hey,
> >> 
> >> How about 'if (nouveau_exa_pixmap_is_onscreen(dst_pix)) {...'?  We
> >> should really never get to that point unless we know for sure that we
> >> can either flip or exchange, so the 'has_pageflip' check is redundant.
> >
> > I see your point, but it's all non obvious. How about this patch instead?
> > :)
> >
> I guess the confusion stems from the meaning of "exchange": Do you
> exchange as well as you flip or does one exclude the other?  This code
> only (used to) make sense if you read it the first way, i.e. as if
> "flip" were the subset of "exchange" you use with on-screen windows. :P

Heh, that makes sense now.

> That said, I'm OK with changing the name of "can_exchange" to
> "can_exchange_or_flip" if that makes its meaning clearer.  TBH the rest
> of the changes in this patch don't really look to me like they're making
> anything easier to understand.  That's quite a personal matter though.

I wanted to take the decision about pageflipping or not in one place instead
of two.

However, I do not feel strongly about which way it's going to be fixed. Both
are technically correct. Feel free to commit your version.

Marcin
