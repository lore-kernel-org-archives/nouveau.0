From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: drm git branches revisited
Date: Sat, 5 Dec 2009 19:35:25 +0200
Message-ID: <20091205193525.5f6db23a@daedalus.pq.iki.fi>
References: <21d7e9970912012010t62a2a98dy1c7545e160c0c2fd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <21d7e9970912012010t62a2a98dy1c7545e160c0c2fd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2 Dec 2009 14:10:11 +1000
Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> So I'm going to change the layout of my git branches again,
> because my current plan isn't working for me.
> 
> At the moment drm-next is considered the branch to base new work
> off and to also for downstream trees to
> pull from, this is changing.
> 
> I will now maintain
> 
> drm-core-next : a branch with all the core DRM/KMS changes in it,
> please base all downstream sub-driver
> trees from this branch in the future. This branch will not
> rebase, it may pull in a downstream driver tree in
> the pre-merge window time, and/or when some patch from that tree
> is required for a patch to the mainline.
> This will be the basis of any trees I send to Linus.

Previously, I've been doing:
git diff drm/drm-next...nouveau/master

If I understand correctly, to gather all the Nouveau development
I should now use:
git diff --stat drm/drm-core-next...nouveau/master
git log ^drm/drm-core-next nouveau/master

where nouveau is the nouveau/linux-2.6 repo.

Right?
Why do I see changes to radeon, i915 and drm core, too?

The last time drm-next was merged into nouveau/master was Nov 4th
and I am quite sure there are no radeon patches committed to
nouveau/master, it has all come from drm-next or linus' merges.

My intent was to create a tentative Nouveau patch and run it
through checkpatch.pl to see if there are new things to fix.
I've been doing that occasionally and running it takes roughly
an hour.

> drm-radeon-next: a tree like Eric's drm-intel-next where radeon
> specific changes will be queued up.
> 
> drm-next: This tree will be rebased quite regularly (2-3 days)
> with a git pull of the latest, drm-core-next, drm-radeon-next
> and drm-intel-next, so that the code in drm-next is tested
> better. You should use this tree for testing latest drm stuff
> with an eye to the next Linus kernel.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
