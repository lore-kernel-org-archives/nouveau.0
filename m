From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CCACHE and VFETCH FAULTs causing lockups
Date: Tue, 08 Mar 2011 08:22:45 +1000
Message-ID: <1299536569.29441.1.camel@nisroch>
References: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
	<1299016269.1822.3.camel@nisroch>
	<AANLkTimiy=U04vfiXRAqDj_eT+zxSN2_3NvmF4jRQWxc@mail.gmail.com>
	<65DF9FD4-DDE0-4BA3-950A-422A3F1EF9DA@gmail.com>
	<AANLkTi=7YDLL8N=15ktHE3oYB2LMkm2WQ6y20+-gfmT_@mail.gmail.com>
	<62F49887-5C29-4DFD-9166-3BB6AD0E23F1@gmail.com>
	<AANLkTi=jNcm+868ppNTGA+6ufqi7muctHxMnpzj9J-k8@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTi=jNcm+868ppNTGA+6ufqi7muctHxMnpzj9J-k8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2011-03-07 at 21:51 +0000, Maarten Maathuis wrote:
> On Sun, Mar 6, 2011 at 2:24 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >
> > Sent from my iPhone
> >
> > On 07/03/2011, at 0:03, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> On Sun, Mar 6, 2011 at 1:44 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>> Sorry for the top posting, it's late and typing from my phone in bed lol.
> >>>
> >>> Just wanted to see if you had an update? And, this is NV86 I guess?
> >>>
> >>> Ben.
> >>>
> >>> Sent from my iPhone
> >>>
> >>> On 02/03/2011, at 8:20, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>
> >>>> On Tue, Mar 1, 2011 at 9:51 PM, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >>>>> On Tue, 2011-03-01 at 21:08 +0000, Maarten Maathuis wrote:
> >>>>>
> >>>>>> Those come after 15-30 minutes of running warzone2100, i haven't
> >>>>>> played any games for a while, so no idea how long this has been going
> >>>>>> on.
> >>>>>> I also got a TRAP_CCACHE on channel 2 a little while ago, it takes
> >>>>>> much longer to trigger (a few hours). I'm using todays "nouveau
> >>>>>> kernel" git.
> >>>>> You're not the first person to have reported this fwiw, personally, I
> >>>>> haven't seen it yet..
> >>>>>
> >>>>>>
> >>>>>> I'm guessing something is being unmapped too early or without reason,
> >>>>>> or some cache is stale. But it isn't obvious what exactly it is.
> >>>>>>
> >>>>>> Because i don't remember having these lockups before I'm inclined to
> >>>>>> guess that this commit is involved
> >>>>>> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=6330d8f5ecc4a19fd2ad3c7fa128b2f4c2ce3360
> >>>>>>
> >>>>>> Any ideas?
> >>>>> Not really.  If this commit *is* the cause, the problem is still
> >>>>> somewhere else.  That commit just makes sure PTEs are marked invalid, so
> >>>>> if it's causing your faults, then previously the GPU would still have
> >>>>> been reading/writing invalid data.
> >>>>>
> >>>>> Plus, I expect you should probably have seen a VM fault..
> >>>>
> >>>> So these faults are just generic errors? Unrelated to page faults?
> >>>>
> >>>>>
> >>>>> Ben.
> >>>>>>
> >>>>>> Maarten.
> >>>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>>
> >>>> --
> >>>> Far away from the primal instinct, the song seems to fade away, the
> >>>> river get wider between your thoughts and the things we do and say.
> >>>> _______________________________________________
> >>>> Nouveau mailing list
> >>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
> >>>
> >>
> >> No this is NV96. The revert definitely helps, but no luck so far in
> >> finding a plausible cause for the problem.
> > Hey,
> >
> > Ok. Hmm. I thought you had NV86 for some reason! It's a long shot and I'm not entirely convinced it'll help at all, but can you switch graph.tlb_flush pointer to the nv86 version and see if anything changes?
> 
> I used to have a NV86, but it died more than a year ago in the typical
> way for that generation of card, due to thermal issues I guess (it was
> a passively cooled card). I haven't tried using the nv86 tlb flush,
> out of curiosity, is this something nvidia does (a lot) on nv86?
Yes, NVIDIA do it on pretty much every card I've looked at traces for,
we've never seen any need for other chipsets as of yet however.
Originally, it looked like NVIDIA did this on all pre-NVA3 cards, but, a
trace of my T510 with recent drivers show that they do it on NVA3+ now
too.

> 
> >
> > The *other* possible thing is that the ttm delayed delete queue is causing multiple tlb flushes to happen at the same time.  I'll add locking for that in the morning, that was a complete oversight.
> 
> I've had no lockups since you added the spinlocks, so maybe that was
> it. Time will tell.
*crosses fingers*

Ben.
> 
> >
> > Ben.
> >
> >>
> >> --
> >> Far away from the primal instinct, the song seems to fade away, the
> >> river get wider between your thoughts and the things we do and say.
> >
> 
> 
> 
