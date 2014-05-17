From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] clk: allow config option to enable reclocking
Date: Fri, 16 May 2014 23:39:22 -0400
Message-ID: <CAKb7Uvjk0B-4F+OdydstWp6C52GoGu289V0RkrfBLeURmpD+Bg@mail.gmail.com>
References: <1400258565-28941-1-git-send-email-imirkin@alum.mit.edu>
 <CACAvsv5an3rkOtk=rPixGcunadZgRDQsXrEnozO65v8uTwaw3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv5an3rkOtk=rPixGcunadZgRDQsXrEnozO65v8uTwaw3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, May 16, 2014 at 11:17 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 17 May 2014 02:43, "Ilia Mirkin" <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>>
>> Adds a NvReclock boolean option to allow the user to enable (or disable)
>> reclocking. All chipsets default to off, except NVAA/NVAC, which are
>> reportedly complete.
> Hey Ilia,
>
> I think I've expressed my thoughts on this previously via IRC, but let me
> stick them here too so there's a record of the current state...
>
> For nvaa/nvac, yes, let's enable it by default. It should, apparently, be
> good enough that it has a decent chance of working.  It's not like we're
> attempting anything automatic yet, so, this won't break anything for people
> who aren't trying..
>
> I'm on the fence about Kepler. It actually might work to some extent in a
> decent number of cases already, there's potentially some severe issues even
> with engine clocks on some  boards that I'm aware of, so it's not just a
> memory reclocking worry here.
>
> That said, it has a good chance of working for some people. So. Thoughts?
> I'm also talking making "NvMemExec" default on here too.  Again, causing a
> fuck-up will still require direct user action.
>
> For the rest (Hm, except maybe nv40, a lot will probably be ok..) There's
> *very* little chance memory reclocking will work, even on the systems where
> it used to. The code is far less complete, as it was broken in general, and
> I haven't yet had the time to *properly* reverse engineer the sequence
> needed to stably reclock memory.  Kepler is the only implementation where
> that's even been started.  Tl;dr - unless you're working on the code for
> Tesla/Fermi, there's zero point even trying it. So, the block should stay.

Meh. It works on my G98, for one of the perf levels. I'm sure there
are lots of tesla's where it totally wouldn't work, but as long as it
works on some of them, why not let people try?

>
> Personally, as you know, I'm more comfortable leaving it developer-only
> still (except nvaa/nvac) until it at least works on all our own boards
> without any major known missing bits..  But yeah, for the ones mentioned
> above, I guess it's a possibility if people *really* want...

I'm of the opposite opinion... if it works on _some_ of our boards, we
should let people play with it. Why lock it away? Unless there's a
real danger of it bricking the card. I've never heard of our code
doing that, and given the way that you were RE'ing this stuff, I doubt
that there's anything we can do (within reason) to brick the card.

>
> I can only envision that if we allow this even just in the places it's known
> to be partially broken, certain sensationalist, er, people, will feel the
> need to test and complain about how broken it all really is... And then
> retest on a regular basis, despite there having been *zero* work done
> because no-one has the time, and then complain about the exact same thing
> AGAIN! (WHOA.. I'm done ranting now :p)

I would prefer to avoid our decisions being directed by a small number
of loud complaining users, and instead to try to do things that will
serve the real users. Those complaints are only as loud as you think
they are -- you can also think of them as an automated tester that
puts its results into prose. Prior to 3.13, we allowed people to try
reclocking on nv40 and nv50, and I didn't see some huge quantity of
complaints about how it didn't work perfectly. Perhaps you saw those
at first, but I think the expectation by now is that it won't work.
Especially if it's behind a config option.

I have no idea what NvMemExec _really_ is doing, so I left it alone. I
assume that the majority of what my patch enables is actually engine
reclocking, not memory reclocking. So to get both, people would have
to flip both flags? Or is there more to it?

  -ilia
