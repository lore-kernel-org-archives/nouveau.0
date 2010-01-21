From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 16:39:24 +0100
Message-ID: <6d4bc9fc1001210739r2bb8b4c4i18590376a1628d82@mail.gmail.com>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 21, 2010 at 3:44 PM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
> Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:
>
>>> Nvidia cards have a synchronization primitive that could be used to
>>> synchronize several FIFOs in hardware (AKA semaphores, see [1] for an
>>> example).
>>
>> Does this operate wholly on the GPU on all nVidia cards?
>>
>> It seems that at least on some GPUs this will trigger "software
>> methods" that are basically a way for the GPU to trigger an interrupt
>> and stop the FIFO until the CPU handles the interrupt and restarts it.
>>

Yes this triggers a few software methods, nvidia hardware is a bit
lacking in this area.

> Yes, it could be handled without software methods, Maarten (CC'ed) was
> looking into this, IIRC.

Doing it without software methods means you need to have a semaphore
that "exists" in the cpu domain and therefore cannot be used again
until the cpu is sure it's done. So that will probably require a
rotating queue of several semaphores and a fallback to cpu waiting. It
should not be that hard to prototype in kernel, although we currently
assume notifiers (little chunks of memory that amongst other things
are used by semaphore) to be in channel private memory, so while in
kernel it's probably doable, there will need to be api changes for the
userspace side of it. Since the respective chunk of memory needs to
have a dma object on more than one channel. This should probably be
dealt with in combination with calims desire to be able to have dma
objects for random buffer objects for use with gpu queries. It doesn't
seem impossible, but it won't exactly be trivial either. The sanest
model would probably involve an ioctl that takes two channels and does
whatever is needed to make it synchronised. But given the recent
discussion/noise about doubts regarding our mixed userspace/kernel
model, we should consider this carefully. That said, i doubt it would
be sanely possible with a full userspace model like the one nvidia
uses.

>
>> Also, is there a way on nVidia cards to get interrupts on fences, but
>> only where the fence sequence number is higher than a dynamically set
>> value? (so that one could sleep for fence X without getting an
>> interrupt for every single fence before that)
>>
>> If not, it could possibly be hacked around by reading from a DMA
>> object at the address of the fence sequence number and then resizing
>> the DMA object so that addresses from a certain point on would trigger
>> a protection fault interrupt.
>
> I don't think you can safely modify a DMA object without stalling the
> card completely, but i think you could use e.g. PGRAPH NOTIFY interrupts
> and disable them by flipping a bit in PGRAPH when you stop caring about
> them.
>
