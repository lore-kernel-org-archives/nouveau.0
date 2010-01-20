From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Wed, 20 Jan 2010 21:58:20 +0100
Message-ID: <ff13bc9a1001201258i37ee7354gb305aa98afae3716@mail.gmail.com>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
	<4B54B949.9010906@vmware.com>
	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>
	<4B56E8EE.8090706@shipmail.org> <4B56F308.5090603@shipmail.org>
	<4B56F401.8070700@vmware.com>
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001201245g6ee25219q851b7989968f4c7b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When designing this, we should also keep in mind that some drivers
(e.g. nouveau) have multiple FIFO channels, and thus we would like a
buffer to be referenced for reading by multiple channels at once (and
be destroyed only when all fences are expired, obviously).
Also, hardware may support on-GPU inter-channel synchronization, and
then multiple references may be for writing too.

If we use an external dynamically allocated channel/buffer list node,
we can support this (if the kernel allocators aren't fast enough,
which they should be, we can just keep released ones linked to the bo
to speed allocations).

Note that in nouveau there is a small hardware limit to channels (up
to 128 on nv50), but future hardware may possibly support unlimited
channels.
