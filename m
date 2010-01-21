From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 16:36:00 +0100
Message-ID: <ff13bc9a1001210736k71740417r7b129c70374fece3@mail.gmail.com>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
	<4B576FF5.9040907@shipmail.org>
	<ff13bc9a1001201949l4691f202v2a2874b9cef86f37@mail.gmail.com>
	<4B584E48.8020806@shipmail.org>
	<ff13bc9a1001210540t7dc2b7a7p38359ca82b8b3eb4@mail.gmail.com>
	<87vdeveekk.fsf@riseup.net>
	<ff13bc9a1001210617qe37ab7at949d545216693608@mail.gmail.com>
	<87pr53ecwd.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87pr53ecwd.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

>> If not, it could possibly be hacked around by reading from a DMA
>> object at the address of the fence sequence number and then resizing
>> the DMA object so that addresses from a certain point on would trigger
>> a protection fault interrupt.
>
> I don't think you can safely modify a DMA object without stalling the
> card completely, but i think you could use e.g. PGRAPH NOTIFY interrupts
> and disable them by flipping a bit in PGRAPH when you stop caring about
> them.

The problem is that one needs to disable them *before* the one he cares about.

Suppose the card is at fence 0 and we are interested in fence 1000 expiring.

If we just enable interrupts, then we are going to be interrupted
uselessly 1000 times.
Instead, we would like to tell the card "send me interrupts for
fences, but only for fence number 1000 (or higher)".

This way one could for instance render a whole scene, and then
desiring to read it into the CPU, just ask for an interrupt once
rendering is done (i.e. wait for the framebuffer fence) and get a
single interrupt, while we cleanly sleep undisturbed in the meantime.

Basically, it would just need some way of *conditionally* causing interrupts.
If there is none, then maybe we could insert a call to a "fence
mini-pushbuffer" filled with NOPs that could be overwritten with an
interrupt request on demand?
Or alternatively, construct such a pushbuffer with the 2D or 3D
engines, starting from our "1000" input and the fence value generated
by the 3D engine? (this is likely to be slow though).
Or some hack like the DMA object resizing? (would it crash the GPU? or
just not work due to it caching the previous size?)
