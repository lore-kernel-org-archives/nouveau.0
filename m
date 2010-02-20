From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: low memory
Date: Sun, 21 Feb 2010 00:28:56 +0100
Message-ID: <b67489df1002201528w4bfe50bes1d564ec805cd29da@mail.gmail.com>
References: <b67489df1002091125v33bb28ddo7835864d69c9cc92@mail.gmail.com>
	<b67489df1002091149w13438d55l6be3356d79066b41@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1002091149w13438d55l6be3356d79066b41-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 9, 2010 at 8:49 PM, Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> 12:08 < curro_> shining: hmm, it seems, darktama didn't quite finish
> the additional reloc checking he started to code
> 12:11 < curro_> shining: that would have solved your problem, poke him
> when he's back from vacations :)
> 12:16 < shining> curro_: hmm I really dont get it, it looks like
> domain can have both set, and flags can also have both set
> 12:16 < shining> I want to look at the reloc checking, what made you
> say he didnt finish ?
> 12:23 < curro_> shining: when you pin a BO, it can't end up in several
> locations at the same time :P
> 12:23 < curro_> he implemented the necessary stuff to track available
> aperture space from userspace
> 12:23 < curro_> but he didn't make the reloc functions check if the
> buffers would actually fit
>
> /me pokes darktama :)
>
> Let me remind you my wonderful test case : loading a 3500x2500 pixmap
> in firefox with 64mb vram.
>
> After talking a bit more with curro, I started to write a patch. I
> don't know how bad and wrong it is, there are still so many things I
> don't understand.
> It seems it works somehow, meaning OUT_RELOC -> emit_reloc will fail
> before FIRE_RING -> pushbuf_flush.
> But enomem failures during pushbuf_flush still happen. And worse, what
> happens after an OUT_RELOC failure is awful :
> 1) on nv25, the system freezes for 5 seconds, and after the lower part
> (a rectangle) of the picture seems to have a wrong offset or
> something.
> 2) on nv84 (hacked to force 64mb vram) : X crash because of a bug in
> nouveau_wfb.c . After fixing that, the pixmap is correctly displayed
> *after* the system freezes between 1min30 and 2min
>
> (There are several options for fixing the imprecision bug of fast
> divide in nouveau_wfb.c but I would like to be able to run this code
> in a normal situation, without crazy system freezing and extreme
> slowness, so that I can hopefully do proper benchmarking between the
> different options :) )
>
> I ran oprofile on nv25 in these two configurations :
> 1) previous workaround of making nouveau_exa_create_pixmap always fail
> : performance still acceptable (early fallback)
> 2) runtime OUT_RELOC failure and fallback : turtle speed (late fallback)
>
> The commit that implemented workaround 1 for 32mb vram says :
> =A0 =A0exa: force the use of sysmem pixmaps on low-mem cards
> =A0 =A0Very similar effect to forcing MigrationHeuristic "greedy" on clas=
sic
> =A0 =A0EXA. =A0Far better than the migration ping-pong that'd occur other=
wise
>
> I suppose that arch/x86/mm/pageattr.c showing up in the profile, and
> pixman_blt_mmx taking ages are consequences of that migration
> ping-pong ?
> But I still don't understand what is going on, what migrations are
> made and how to limit them.
>

Just to clarify : the problems on nv84 (slowness and nouveau_wfb
crashing X) only happen after limiting vram to 64mb. It was just a
sidetest to see if I could reproduce the nv25 situation. There are
probably not real problems.

My goal is just to get nv25 render pixmaps properly at acceptable
speed instead of freezing 5 seconds to display a black box.
64mb seems to be the worst amount one can have. Below that, we don't
even try and disable accel. And with more memory, it might be less
usual to run out of it.

To sum up the discussion with curro and stillunknown, the different
alternatives seem to be :
1) Fallback on reloc failures, to avoid pushbuf / ttm validation
failure, as my libdrm patch attempted.
But this seems to cause extreme slowness, which could be explained by
the system reading the pixmap in vram.
2) Earlier fallback in nouveau_exa_create_pixmap
2.1) just bump limit from 32 to 64. This causes everything to be done
in software but is actually the only way I found which is never
extremely slow.
2.2) only fallback for pixmaps which are big compared to the amount of
vram. This solution fixed the pixmap rendering, but for example
dragging a window on top of the pixmap would kill the system. However
I could workaround this using xcompmgr.

I am tempted to just go with 2.1 and stop bothering everyone with
this. It's the most trivial fix and will cause less surprises to
whoever use that machine :)
