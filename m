From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: POST the card before GPIO
	initialization
Date: Fri, 14 Sep 2012 13:45:18 +0200
Message-ID: <20120914114518.GA3619@joi.lan>
References: <20120913222133.GA8982@joi.lan>
	<20120914064459.GE4289@nisroch.bne.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120914064459.GE4289-7ZJhIA9XobDzA+JJ9lL7d4GKTjYczspe@public.gmane.org>
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

On Fri, Sep 14, 2012 at 04:44:59PM +1000, Ben Skeggs wrote:
> On Fri, Sep 14, 2012 at 12:21:33AM +0200, Marcin Slusarz wrote:
> > Otherwise my card (nv92) never resumes from suspend to ram, hanging on
> > nv_mask in nv50_gpio_drive. Before rework, initialization was done only
> > from POST, so this patch restores previous behaviour.
> This patch would break the cold-boot behaviour (DEVINIT needs GPIO etc
> to have been created so it can call out to them).
> 
> I've modified nouveau git so that it restores the behaviour of the first
> version of the rework and has DEVINIT be the first in the init ordering,
> but delays its init until all its dependencies have been created.
> 
> Can you confirm your issue is resolved now?

Yes.

Two thoughts:

Your commit message states that the next commit triggers the bad behaviour,
but it's not completely true - I had resume lockups even before this commit
hit the tree. Though I don't know what was the problem.

It's a bit sad when ones spends a lot of time on debugging something and
the patch is redone the next day by the maintainer. If you would give me
the feedback on the patch, I would improve it and resend.

Marcin
