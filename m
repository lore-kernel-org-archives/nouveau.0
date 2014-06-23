From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH try 2 2/2] gallium/nouveau: move
 pushbuf and fences to context
Date: Mon, 23 Jun 2014 10:54:22 -0400
Message-ID: <CAKb7Uviwbbyz3as6TGxcve+knj3HUhY4s40H9J25Dnf+DpQUKA@mail.gmail.com>
References: <539FE12C.90900@canonical.com> <539FE170.9040306@canonical.com>
 <CAKb7Uvjq0iKMM2sG0F+Q=BR6dftJUJL8qGnuV_CAVexYhW1DUA@mail.gmail.com>
 <53A7D482.70108@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53A7D482.70108-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jun 23, 2014 at 3:17 AM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> op 21-06-14 14:12, Ilia Mirkin schreef:
>> On Tue, Jun 17, 2014 at 2:34 AM, Maarten Lankhorst
>> <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>>> nv30 seems to not support dma objects with offset, so simply extend the query_heap to cover the
>>> entire notifier, and use a offset in nv30_context_kick_notify.
>> It would be great if you could detail the list of transformations that
>> were done in the commit description, as well as what the "new way" is
>> (if any) for the various concepts.
> I moved the pushbuf and fences to each context separately. The PUSH_KICK on context switch ensures
> that the previous context is flushed.

I  meant in the commit log :)

>> This change doesn't have any of the locking -- is that coming in a
>> future change? Otherwise we're still vulnerable to multiple threads
>> trying to render at the same time. (Now with screen sharing, even if
>> they end up with separate screens, we'd still be in trouble.)
> I haven't done any locking changes, because I don't believe locking is the answer here.
> With each context having its own pushbuf we can ensure that things aren't flushed, so
> on flush it should assume all state is dirty. After this is done the PUSH_KICK of the old
> context on context switch can be removed, and suddenly the driver is thread-safe because
> only the pushbuf to kernel command submission could race. ;-)

OK. I'm concerned that PUSH_SPACE could let us down here. We'd have to
make sure enough space were available for the whole pushbuf, which if
an inline vertex transfer is involved, could be a tricky proposition.

>
>> I'm still a bit concerned with moving the fence stuff to the
>> context... there might be an assumption in gallium that fences are
>> context-independent, in which case you need to make sure to have just
>> a single fence shared by everything...
> I don't think that this is the case, because it's very rare that gallium uses multiple contexts simultaneously.
> (Except vdpau interop, which does flush explicitly.)

Agreed that it's rare. vdpau interop is the main case, the minor case
is 2 screens (which will now share one pipe_screen). This is the issue
the other user was having (with the fd closing thing).

>> Have you done a full piglit run on this (with the glx tests, for good
>> measure) on nv30/nv50/nvc0? If so, can you share the results files
>> somewhere?
> No not yet. But I did confirm that glxgears and glxinfo didn't regress on my nv43, nv96 and nvc0. :-)

Well, would be good to get those results, and make sure there are no
unexpected regressions. (*-struct-pad seems to flip between fail and
pass at random, I think based on which tests were run prior... some
bit of state we're missing somewhere. One or two others like that.)

  -ilia
