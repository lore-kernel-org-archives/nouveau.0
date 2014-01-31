From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Help needed for bug 58556
Date: Fri, 31 Jan 2014 15:16:40 -0500
Message-ID: <CAKb7Uvijy5X8=fpt1qy4w_-sVUT9NCc_ft9yOvPPdkCOd6oXSQ@mail.gmail.com>
References: <954328835.395384526.1391172165854.JavaMail.root@spooler8-g27.priv.proxad.net>
	<1930859494.395453948.1391173785548.JavaMail.root@spooler8-g27.priv.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1930859494.395453948.1391173785548.JavaMail.root-x5ewXQG5twBsFmKuirFwRhh1pbbyJDp15NbjCUgZEJk@public.gmane.org>
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

On Fri, Jan 31, 2014 at 8:09 AM,  <pierre.morrow-GANU6spQydw@public.gmane.org> wrote:
> Hello List,
>
> I am trying to solve bug 58556 [1], but I will need some help as I don't
> understand all that is going on.

Unfortunately this is a *massive* bug... and confused by the "other"
very similar but apparently not identical bug in the system.

>
> The system is composed of an NV96 (9600 GT) and an NVAC (9400 M) card;
> acceleration is disabled, otherwise the system hangs at boot after
> initialising the NV96 card.
> The problem consist of a complete garbage screen in console mode, and a
> one-third gabage screen in GUI.

What happens if you only enable acceleration on the NVAC card? (e.g.
by hacking up nouveau to ignore the other one entirely). Wasn't there
some thing where the NV96 card was effectively disabled but still
appearing in PCI space? Or I might be thinking of a different mac
situation...

>
> It appeared in commit 20abd1634a6e2eedb84ca977adea56b8aa06cc3e, as it was
> initialising some structures only when acceleration was on, even if it was
> later used in both cases. These structures changed in commit
> ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69, solving the initial issue but the
> problem still remains.

As you probably saw, this is a MASSIVE commit. What exactly was the
problem with 20abd1634a?

>
> After a few tests, it seems nouveau_channel_new is key to get a correct
> screen, though it is only called when acceleration is on; I didn't find
> which structures initialised by nouveau_channel_new are needed to get a
> clean screen, nor did I find any clues in debug messages.

Can you go into some detail on what these tests were that yielded a
successful outcome? IIRC nouveau_channel_new is called to create a
new... channel, which is used by drm clients. If you don't have
acceleration, that whole api is disabled, so it shouldn't come up. I
guess accel_init also initializes drm->channel which is the kernel
channel for doing stuff. [Although TBH I'm not entirely sure how
things work without acceleration enabled...  but I think there's a
non-fifo way to show images on the screen.]

  -ilia
