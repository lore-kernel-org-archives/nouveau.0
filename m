From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: making 0.0.16 into 1.0.0
Date: Thu, 4 Mar 2010 17:36:32 -0800
Message-ID: <6a89f9d51003041736j4d4d4315g9bff8bfabc04bb77@mail.gmail.com>
References: <21d7e9971003041723x7d99996bo586181db5a4234dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <21d7e9971003041723x7d99996bo586181db5a4234dc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Mar 4, 2010 at 17:23, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> So with all this ongoing Linus crap I'm going to be brave and ask for
> reasons why
> 0.0.16 kernel API can't become 1.0.0.
>
> Pros:
> All old userspace compatibility is gone.
> No more UMS cruft to support.
> Something can be shipped on distros at last, people get to use the driver.
> 3D drivers exist and use the interface, there is an investment in these already.
>
> Reasons against: (I'm making these up, feel free ack/nack/flesh
> out/add more etc).
> We haven't finished 3D drivers yet so the interface may still need changes?
> TTM sucks?
> Userspace command-submission for ever?
> I don't like versioning anything ever?
>

Yeah, we definitely need more performance tuning on the 3D driver and
video playback side. Otherwise we could end up shipping something that
has no chance of sanely evolving into a fast enough driver. The issue
is right now we are only barely scratching the surface of the
performance issues.

> So my current answers to my list of cons is:
>
> Adding new faster interfaces for 3D drivers shouldn't be a major problem, if its
> just a matter of making the current APIs saner.

You quickly handware this, but the problem is there is no way to be
sure about it. If it was that simple we could have made a "stable"
release many moons ago. Maybe the problem stems from some TTM bit,
maybe it's a user space interface which is too heavy. There is no way
to know right now.

>
> If you are going to write a UCS/non-TTM driver you are going to have to do
> major changes all over the stack, in theory a kernel CONFIG option to enable
> version 2 of the interface and drop version 1 would be an option at that time.
> Or even a boot option to select between which one you want. I would
> forsee a UCS/non-TTM driver needing to rewrite quite a lot of userspace,
> in fact probably all of it. I haven't seen anyone actually start or
> commit to working
> on such a beast, and I'd reckon its probably a 1-2 year job, GEM took over a
> year and it was arguably simpler. I'm not seeing the point of sitting
> in a holding
> pattern for that length of time just in case its better. The future is
> always going
> to be better.
>

Yes for a full GEM replacement that is probably true, but I think we
should aim for something TTM based with decent performance. And we're
really not remotely there yet. Having each driver carry the same
suballocator? Come on...

Stephane
