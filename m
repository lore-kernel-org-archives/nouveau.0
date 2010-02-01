From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/nouveau: add lockless dynamic
	semaphore allocator
Date: Mon, 01 Feb 2010 15:30:23 +0100
Message-ID: <874om1vxj4.fsf@riseup.net>
References: <1265017810-13354-1-git-send-email-luca@luca-barbieri.com>
	<1265017810-13354-2-git-send-email-luca@luca-barbieri.com>
	<87bpg9w1w8.fsf@riseup.net>
	<ff13bc9a1002010527n5812d30fj8555a940aeba179f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1150223359=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1002010527n5812d30fj8555a940aeba179f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Luca Barbieri's message of "Mon, 1 Feb 2010 14:27:53 +0100")
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1150223359==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:

>> How often do we expect cross-channel sync to kick in? Maybe 2-3 times
>> per frame? I suspect contentions will be rare enough to make spinlocks
>> as fast as atomics for all real-life cases, and they don't have such a
>> high maintainability cost. What do you guys think?
>
> For the case of a single (or a few) GL application the requirements
> are indeed modest.
>
> I'm not sure that spinlocks or an otherwise reduced solution would be
> much simpler.
> You basically would just avoid the retrying code.
>
> Also if you have a multithreaded/multiprocess GPGPU application on
> large SMP machine things may change, as you may have a lot of commands
> and semaphores in flight, as well as high contention for anything
> global.
>
Sounds like premature optimization to me. I'm just stating my personal
view here, but I have a feeling a patch with 60% of lines could do very
well the same for most realistic cases.

Maarten, Ben, what do you think about this?

> Of course, currently we hold both the BKL and struct_mutex around
> things, which makes it all moot, but hopefully we'll switch to
> per-channel mutexes soon (I'm looking into that).

BTW, the kernel has some linked list helpers you might want to use for
sem_bo_free_list, and probably the best place for the sem stuff to live
is "dev_priv->fence" instead of the root of drm_nouveau_private.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktm5X8ACgkQ196Zy2qEI5czHQCfR7MLAnelqdULlhm/V7XK5Ds8
eS4An1zoZlHjH7igMlVJ6QgEcE2gjC6f
=TrXy
-----END PGP SIGNATURE-----
--==-=-=--

--===============1150223359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1150223359==--
