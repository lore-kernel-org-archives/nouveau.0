From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Thu, 21 Jan 2010 15:44:02 +0100
Message-ID: <87pr53ecwd.fsf@riseup.net>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
	<4B56F401.8070700@vmware.com>
	<ff13bc9a1001201122y110fb003k704bc6d05d2aea07@mail.gmail.com>
	<4B5764BA.7080801@vmware.com>
	<ff13bc9a1001201245g6ee25219q851b7989968f4c7b@mail.gmail.com>
	<4B576FF5.9040907@shipmail.org>
	<ff13bc9a1001201949l4691f202v2a2874b9cef86f37@mail.gmail.com>
	<4B584E48.8020806@shipmail.org>
	<ff13bc9a1001210540t7dc2b7a7p38359ca82b8b3eb4@mail.gmail.com>
	<87vdeveekk.fsf@riseup.net>
	<ff13bc9a1001210617qe37ab7at949d545216693608@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1136231777=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1001210617qe37ab7at949d545216693608-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Luca Barbieri's message of "Thu, 21 Jan 2010 15:17:11 +0100")
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
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1136231777==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:

>> Nvidia cards have a synchronization primitive that could be used to
>> synchronize several FIFOs in hardware (AKA semaphores, see [1] for an
>> example).
>
> Does this operate wholly on the GPU on all nVidia cards?
>
> It seems that at least on some GPUs this will trigger "software
> methods" that are basically a way for the GPU to trigger an interrupt
> and stop the FIFO until the CPU handles the interrupt and restarts it.
>
Yes, it could be handled without software methods, Maarten (CC'ed) was
looking into this, IIRC.

> Also, is there a way on nVidia cards to get interrupts on fences, but
> only where the fence sequence number is higher than a dynamically set
> value? (so that one could sleep for fence X without getting an
> interrupt for every single fence before that)
>
> If not, it could possibly be hacked around by reading from a DMA
> object at the address of the fence sequence number and then resizing
> the DMA object so that addresses from a certain point on would trigger
> a protection fault interrupt.

I don't think you can safely modify a DMA object without stalling the
card completely, but i think you could use e.g. PGRAPH NOTIFY interrupts
and disable them by flipping a bit in PGRAPH when you stop caring about
them.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktYaDIACgkQ196Zy2qEI5fP2gCcDm3VgbijRqzIS3UrBup02LOx
1VgAnAjJ+ES/rWyRPMRsuL3ycjYfZFl7
=TMox
-----END PGP SIGNATURE-----
--==-=-=--

--===============1136231777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1136231777==--
