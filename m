From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 15:07:55 +0100
Message-ID: <87vdeveekk.fsf@riseup.net>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
	<4B56E8EE.8090706@shipmail.org> <4B56F308.5090603@shipmail.org>
	<4B56F401.8070700@vmware.com>
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
	<4B576FF5.9040907@shipmail.org>
	<ff13bc9a1001201949l4691f202v2a2874b9cef86f37@mail.gmail.com>
	<4B584E48.8020806@shipmail.org>
	<ff13bc9a1001210540t7dc2b7a7p38359ca82b8b3eb4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272396773=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001210540t7dc2b7a7p38359ca82b8b3eb4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Luca Barbieri's message of "Thu, 21 Jan 2010 14:40:42 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1272396773==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:

>> At a first glance:
>>
>> 1) We probably *will* need a delayed destroyed workqueue to avoid wasting
>> memory that otherwise should be freed to the system. At the very least, the
>> delayed delete process should optionally be run by a system shrinker.
> You are right. For VRAM we don't care since we are the only user,
> while for system backed memory some delayed destruction will be
> needed.
> The logical extension of the scheme would be for the Linux page
> allocator/swapper to check for TTM buffers to destroy when it would
> otherwise shrink caches, try to swap and/or wait on swap to happen.
> Not sure whether there are existing hooks for this or where exactly to
> hook this code.
>
>> 2) Fences in TTM are currently not necessarily strictly ordered, and
>> sequence numbers are hidden from the bo code. This means, for a given FIFO,
>> fence sequence 3 may expire before fence sequence 2, depending on the usage
>> of the buffer.
>
> My definition of "channel" (I sometimes used FIFO incorrectly as a
> synonym of that) is exactly a set of fences that are strictly ordered.
> If the card has multiple HW engines, each is considered a different
> channel (so that a channel becomes a (fifo, engine) pair).
>
> We may need however to add the concept of a "sync domain" that would
> be a set of channels that support on-GPU synchronization against each
> other.
> This would model hardware where channels with the same FIFO can be
> synchronized together but those with different FIFOs don't, and also
> multi-core GPUs where synchronization might be available only inside
> each core and not across cores.
>
> To sum it up, a GPU consists of a set of sync domains, each consisting
> of a set of channels, each consisting of a sequence of fences, with
> the following rules:
> 1. Fences within the same channel expire in order
> 2. If channels A and B belong to the same sync domain, it's possible
> to emit a fence on A that is guaranteed to expire after an arbitrary
> fence of B
>
> Whether channels have the same FIFO or not is essentially a driver
> implementation detail, and what TTM cares about is if they are in the
> same sync domain.
>
> [I just made up "sync domain" here: is there a standard term?]
>
> This assumes that the "synchronizability" graph is a disjoint union of
> complete graphs. Is there any example where it is not so?
> Also, does this actually model correctly Poulsbo, or am I wrong?
>
> Note that we could use CPU mediation more than we currently do.
> For instance now Nouveau, to do inter-channel synchronization, simply
> waits on the fence with the CPU immediately synchronously, while it
> could instead queue the commands in software, and with an
> interrupt/delayed mechanism submit them to hardware once the fence to
> be waited for is expired.

Nvidia cards have a synchronization primitive that could be used to
synchronize several FIFOs in hardware (AKA semaphores, see [1] for an
example).

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

[1] http://lists.freedesktop.org/archives/nouveau/2009-December/004514.html

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktYX7sACgkQ196Zy2qEI5cK4wCgm16lZP2A8khEbc7nJXQDGdjR
Wu0AoMjLi5WkjL7XK51hGsoxyym6Pm2F
=fEQ8
-----END PGP SIGNATURE-----
--==-=-=--

--===============1272396773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1272396773==--
