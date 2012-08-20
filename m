From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/10] drm/nouveau: fix off-by-one bugs
 related to command submission in IB mode
Date: Mon, 20 Aug 2012 23:41:51 +0200
Message-ID: <20120820214151.GA5687@joi.lan>
References: <20120819210200.GA26902@joi.lan>
	<20120820063323.GF2013@nisroch.redhat.com>
	<20120820170719.GB3143@joi.lan>
	<CACAvsv7FKZFoVi9akwfmnry8O+draX_ZfuBbFF_2zEOV9kkK6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv7FKZFoVi9akwfmnry8O+draX_ZfuBbFF_2zEOV9kkK6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Aug 21, 2012 at 07:13:23AM +1000, Ben Skeggs wrote:
>    Am Dienstag, 21. August 2012 schrieb Marcin Slusarz :
> 
>      On Mon, Aug 20, 2012 at 04:33:24PM +1000, Ben Skeggs wrote:
>      > On Sun, Aug 19, 2012 at 11:02:00PM +0200, Marcin Slusarz wrote:
>      > > Commit "drm/nouveau: port all engines to new engine module
>      format" changed
>      > > IB size calculation to be less wasteful, but didn't take into
>      account already
>      > > existing off-by-one bugs :).
>      > >
>      > > So:
>      > > - ib_max is the last entry, so we need to +1 when calculating
>      number of
>      > >   free entries
>      > > - nv50_dma_wait already does +1 (for FIRE_RING), so we don't
>      need another +1
>      > >   on nouveau_gem_ioctl_pushbuf side
>      > > - there are 512 allocated IB entries (and it needs to be round
>      number), so we
>      > >   can accept at most 511 entries from userspace (we need one for
>      FIRE_RING) -
>      > >   fortunately userspace already flushes at 511, so nr_push check
>      change won't
>      > >   have any impact
>      > Also skipped this patch for now as I have work in progress that
>      will improve this and
>      > related code.  I should have it in the tree soon.
>      Maybe I should have written this in the changelog, but this patch
>      fixes total
>      mayhem seen in warsow and nexuiz (at least). It's better to
>      integrate it sooner
>      than later.
> 
>    I presume bumping the IB size to 8KiB also helps? 

Yes, my first patch did exactly this and it worked.

However, Maarten can still reproduce this bug, so my patch is not completely
correct. I discovered that RING_SPACE calls nouveau_dma_wait with slots=1 and
nv50_dma_wait increases it again, so we need to move +1 from nv50_dma_wait
to nouveau_gem_ioctl_pushbuf. But once I do this everything explodes, because
we do 2 FIRE_RING's (one from fence_emit, and one from nv50_dma_wait), so...

>    I prefer this in the
>    meantime, and it's probably best to do anyway, I didn't take into
>    account what we allow userspace to do in one shot.  If this works too,
>    i'll push that change this morning.

... it's probably a good idea to do this and forget about the problem.

>    I did try and reproduce on a couple of cards with warsow and wasn't
>    able to.

Nexuiz is even better. It draws artifacts immediately after demo start.

>    Also, what happened to instmem being the culprit here?

It was bad bisection. Once I knew what is the problem, I verified
"drm/nouveau: port all engines to new engine module format" is the first
bad commit.

Marcin
