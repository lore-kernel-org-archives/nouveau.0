From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/pm: Prevent overflow in
 nouveau_perf_init()
Date: Sat, 18 Jun 2011 21:19:36 +0100
Message-ID: <1308428376.10419.5.camel@emo-laptop>
References: <1307795432-5417-1-git-send-email-emil.l.velikov@gmail.com>
	<1308195843.3446.0.camel@nisroch> <op.vw6w9jx37cbmmg@emo>
	<1308269664.7361.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1308269664.7361.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2011-06-17 at 10:14 +1000, Ben Skeggs wrote:
> On Thu, 2011-06-16 at 23:40 +0100, Emil Velikov wrote:
> > On Thu, 16 Jun 2011 04:43:59 +0100, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > 
> > > On Sat, 2011-06-11 at 13:30 +0100, Emil Velikov wrote:
> > >> While parsing the perf table, there is no check if
> > >> the num of entries read from the vbios is less than
> > >> the currently allocated number.
> > >>
> > >> In case of a buggy vbios this will cause overwriting
> > >> of kernel memory, causing aditional problems.
> > >>
> > >> Add a simple check in order to prevent the case
> > > I've pushed this.  I'm not entirely certain we shouldn't just bail out
> > > completely if this is the case, I suspect that if there's this many, the
> > > VBIOS image is probably very screwed.
> > >
> > > This'll do for now :)
> > >
> > > Ben.
> > 
> > The case I was thinking about had a completely screwed vbios (see
> > the attached dmesg) and bailing out would be a good idea.
> > The main reason could have been the method used to fetch
> > it as nvclock (uses PRAMIN) worked fine on the system
> Ouch!  I guess all is good in that case with nouveau.vbios=PRAMIN then?

I wish I had the answer to that, unfortunately the user was struggling
to try it.

> 
> I do wonder if we should accept the PRAMIN image always, if it's
> present, and ignore the checksum.  It does seem to be usually the best
> image there is.

Sounds like a good idea

Cheers,
Emil

> Ben.
> 
> > 
> > Cheers
> > Emil
> > 
> > 
> > >>
> > >> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >> ---
> > >>  drivers/gpu/drm/nouveau/nouveau_perf.c |    5 +++++
> > >>  1 files changed, 5 insertions(+), 0 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
> > >> index f2d98c9..b0e995f 100644
> > >> --- a/drivers/gpu/drm/nouveau/nouveau_perf.c
> > >> +++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
> > >> @@ -225,6 +225,11 @@ nouveau_perf_init(struct drm_device *dev)
> > >>  		entries   = perf[2];
> > >>  	}
> > >>
> > >> +	if (entries > NOUVEAU_PM_MAX_LEVEL) {
> > >> +		NV_DEBUG(dev, "perf table has too many entries - buggy vbios?\n");
> > >> +		entries = NOUVEAU_PM_MAX_LEVEL;
> > >> +	}
> > >> +
> > >>  	entry = perf + headerlen;
> > >>  	for (i = 0; i < entries; i++) {
> > >>  		struct nouveau_pm_level *perflvl = &pm->perflvl[pm->nr_perflvl];
> > >
> > >
> 
> 
