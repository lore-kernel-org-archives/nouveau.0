From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Help needed for bug 58556
Date: Fri, 31 Jan 2014 17:58:58 -0500
Message-ID: <CAKb7UviKuN35KDW73kqOGWzd9GYTzrfodA+TPHa460vUy0iANA@mail.gmail.com>
References: <CAKb7Uvijy5X8=fpt1qy4w_-sVUT9NCc_ft9yOvPPdkCOd6oXSQ@mail.gmail.com>
	<964876991.396653347.1391207965303.JavaMail.root@spooler8-g27.priv.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <964876991.396653347.1391207965303.JavaMail.root-x5ewXQG5twBsFmKuirFwRhh1pbbyJDp15NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: pierre.morrow-GANU6spQydw@public.gmane.org
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 31, 2014 at 5:39 PM,  <pierre.morrow-GANU6spQydw@public.gmane.org> wrote:
> De: "Ilia Mirkin" <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > Unfortunately this is a *massive* bug... and confused by the "other"
> > very similar but apparently not identical bug in the system.
> >
> > What happens if you only enable acceleration on the NVAC card? (e.g.
> > by hacking up nouveau to ignore the other one entirely). Wasn't there
> > some thing where the NV96 card was effectively disabled but still
> > appearing in PCI space? Or I might be thinking of a different mac
> > situation...
>
> Well, if I disable acceleration for the NV96 card, it doesn't hang after
> initialising it, but I get spammed (I think it's PAGE_NOT_PRESENT errors,
> like [1], but my screen goes garbage at that point, so I can't read
> anything) later on, and I don't get to login.

I meant disable it much harder -- like tell nouveau to just ignore it
as though modeset=0 was passed in for it. Also I seem to recall you
can do an outb (even from grub) that will just turn off the nv96 card
entirely.

> BTW, what could I do to get boot logs even if the system did not make it
> trough (apart from recording with my phone...)?

pstore if you have efi, netconsole, blockconsole. And phone isn't so
bad either :)

>
>
>
> > As you probably saw, this is a MASSIVE commit. What exactly was the
> > problem with 20abd1634a?
>
> The vblank structure was a little bit modified, and psw->vblank would be
> initialised only when acceleration is on (it was always initialised before),
> though it would be used inside functions called even when acceleration is
> off. You can see it in comments 18 [2] and 20 [3].
>
>
> > Can you go into some detail on what these tests were that yielded a
> > successful outcome? IIRC nouveau_channel_new is called to create a
> > new... channel, which is used by drm clients. If you don't have
> > acceleration, that whole api is disabled, so it shouldn't come up. I
> > guess accel_init also initializes drm->channel which is the kernel
> > channel for doing stuff. [Although TBH I'm not entirely sure how
> > things work without acceleration enabled...  but I think there's a
> > non-fifo way to show images on the screen.]
>
> My tests were pretty bruteforcing ones:
> *   comment all nouveau_accel_init content, and uncomment block by block
> until it works;
> *   then comment all nouveau_channel_new content, and uncomment function by
> function until it works;
> *   and finally, I did the same inside nouveau_channel_init (for this
> function, only the vram creation, gart creation and dma variables
> initialisation were enough to get a clean screen).
>
> To sum up what pieces of nouveau_accel_init were needed to get a clean
> screen:
> *   return if card is an NV96 one;
> *   init fence;
> *   run nouveau_channel_new:
>     *   nouveau_channel_ind
>     *   nouveau_channel_init, precisely these parts:
>         *   vram creation;
>         *   gart creation;
>         *   dma variables initialisation.

Yeah, so all these things should only be necessary if you have
acceleration enabled. I wonder if the card comes up in a funny "I'm
still executing stuff" state and nouveau fails to "shut it down" when
noaccel is passed in.

  -ilia
