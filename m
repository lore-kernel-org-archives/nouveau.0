From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: making 0.0.16 into 1.0.0
Date: Fri, 5 Mar 2010 09:43:36 +0100
Message-ID: <6d4bc9fc1003050043m211287aam4cb34bb20ee998dd@mail.gmail.com>
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

On Fri, Mar 5, 2010 at 2:23 AM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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
> So my current answers to my list of cons is:
>
> Adding new faster interfaces for 3D drivers shouldn't be a major problem, if its
> just a matter of making the current APIs saner.
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
> As for the I don't like versioning argument, well that really doesn't
> need addressing,
> you have to do version stuff to ship it, if the project as a whole
> decides they don't
> see a need to ever ship the code, then so be it.
>
> Dave.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

I think at least the notifier/dma handle stuff should be looked at. I
think there is opportunity for generalizing here and i believe at
least one of the mesa drivers wants/needs it. Page based memory
backend for nv50 could be done without breaking api (i think).

IMO, we should declare 1.0 once our mesa drivers are running well and
with decent performance. Then we can go forward.

Maarten.
