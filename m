From: Keith Whitwell <keith.whitwell-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Mesa3d-dev] [PATCH] nv30/nv40 Gallium drivers
	unification
Date: Sat, 13 Mar 2010 17:35:42 +0000
Message-ID: <c524168e1003130935t603b36a7u55fbe4ae96e57358@mail.gmail.com>
References: <ff13bc9a1003130929v68107b8fge54fc1a7d7e78f91@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1003130929v68107b8fge54fc1a7d7e78f91-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

Sounds good to me - fewer driver directories to fix up after changes...

Keith

On Sat, Mar 13, 2010 at 5:29 PM, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> wrote:
> Currently the nv30 and nv40 Gallium drivers are very similar, and
> contain about 5000 lines of essentially duplicate code.
>
> I prepared a patchset (which can be found at
> http://repo.or.cz/w/mesa/mesa-lb.git/shortlog/refs/heads/unification+fixes)
> which gradually unifies the drivers, one file per the commit.
>
> A new "nvfx" directory is created, and unified files are put there one by one.
> After all patches are applied, the nv30 and nv40 directories are
> removed and the only the new nvfx directory remains.
>
> The first patches unify the engine naming (s/curie/eng3d/g;
> s/rankine/eng3d), and switch nv40 to use the NV34TCL_ constants.
> Initial versions of this work changed renouveau.xml to create a new
> "NVFXTCL" object, but the current version doesn't need any
> renouveau.xml modification at all.
>
> The "unification+fixes" branch referenced above is the one that should
> be tested.
> The "unification" branch contains just the unification, with no
> behavior changes, while "unification+fixes" also fixes swtnl and quad
> rendering, allowing to better test the unification. Some cleanups on
> top of the unfication are also included.
>
> That same repository also contains other branches with significant
> improvements on top of the unification, but I'm still not proposing
> them for inclusion as they need more testing and some fixes.
>
> While there are some branches in the Mesa repository that would
> conflict with this, such branches seem to be popping up continuously
> (and this is good!), so waiting until they are merged probably won't
> really work.
>
> The conflicts are minimal anyway and the driver fixes can be very
> easily reconstructed over the unified codebase.
>
> How about merging this?
> Any objections? Any comments?
>
> ------------------------------------------------------------------------------
> Download Intel&#174; Parallel Studio Eval
> Try the new software tools for yourself. Speed compiling, find bugs
> proactively, and fine-tune applications for parallel performance.
> See why Intel Parallel Studio got high marks during beta.
> http://p.sf.net/sfu/intel-sw-dev
> _______________________________________________
> Mesa3d-dev mailing list
> Mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> https://lists.sourceforge.net/lists/listinfo/mesa3d-dev
>
