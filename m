From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/10] drm/nouveau: fix off-by-one bugs
 related to command submission in IB mode
Date: Mon, 20 Aug 2012 19:07:19 +0200
Message-ID: <20120820170719.GB3143@joi.lan>
References: <20120819210200.GA26902@joi.lan>
	<20120820063323.GF2013@nisroch.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120820063323.GF2013-7ZJhIA9XobAf7BdofF/totBPR1lH4CV8@public.gmane.org>
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

On Mon, Aug 20, 2012 at 04:33:24PM +1000, Ben Skeggs wrote:
> On Sun, Aug 19, 2012 at 11:02:00PM +0200, Marcin Slusarz wrote:
> > Commit "drm/nouveau: port all engines to new engine module format" changed
> > IB size calculation to be less wasteful, but didn't take into account already
> > existing off-by-one bugs :).
> > 
> > So:
> > - ib_max is the last entry, so we need to +1 when calculating number of
> >   free entries
> > - nv50_dma_wait already does +1 (for FIRE_RING), so we don't need another +1
> >   on nouveau_gem_ioctl_pushbuf side
> > - there are 512 allocated IB entries (and it needs to be round number), so we
> >   can accept at most 511 entries from userspace (we need one for FIRE_RING) -
> >   fortunately userspace already flushes at 511, so nr_push check change won't
> >   have any impact
> Also skipped this patch for now as I have work in progress that will improve this and
> related code.  I should have it in the tree soon.

Maybe I should have written this in the changelog, but this patch fixes total
mayhem seen in warsow and nexuiz (at least). It's better to integrate it sooner
than later.

Marcin
