From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Kernel patch: validate nouveau_channel_get id argument
Date: Sat, 25 Dec 2010 14:46:29 +0100
Message-ID: <87r5d6yngq.fsf@riseup.net>
References: <AANLkTikRCm19--tRgjAJqcLgb1f_hWcWJpRvgAqGKfQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1948692589=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTikRCm19--tRgjAJqcLgb1f_hWcWJpRvgAqGKfQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michel Hermier's message of "Fri, 24 Dec 2010 18:12:40 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1948692589==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi,
> While hacking libdrm I triggered a kernel oups due to a non checked
> argument from user land.
> In nouveau_ioctl_notifier_alloc, nouveau_channel_get is invoked, but
> it doesn't validate the na->channel input argument. The attached patch
> validates the channel index, and change it's type to uint32_t since it
> is an index after all.
>
Thank you, some minor comments inline.

> Cheers,
>     Michel
>
> From dc00e5ccce3f10e51ae143d6dda6aa8febab271d Mon Sep 17 00:00:00 2001
> From: Michel Hermier <hermier-SjT/4EORnmY+uJoB2kUjGw@public.gmane.org>
> Date: Fri, 24 Dec 2010 14:49:13 +0100
> Subject: [PATCH] Fix channel nouveau_channel_get index type and check it'=
s value.

We usually prefix our kernel commit messages with "drm/nouveau: " or
something similar, to tell them apart from the huge kernel commit
flow. Also you made a small typo in "it's".

>=20
"Signed-off-by" line missing. You should have a look at
"Documentation/SubmittingPatches" and "Documentation/CodingStyle", if
you haven't already.

> ---
>  drivers/gpu/drm/nouveau/nouveau_channel.c |    5 ++++-
>  drivers/gpu/drm/nouveau/nouveau_drv.h     |    2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/=
nouveau/nouveau_channel.c
> index e37977d..bc07a61 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
> @@ -247,12 +247,15 @@ nouveau_channel_get_unlocked(struct nouveau_channel=
 *ref)
>  }
>=20=20
>  struct nouveau_channel *
> -nouveau_channel_get(struct drm_device *dev, struct drm_file *file_priv, =
int id)
> +nouveau_channel_get(struct drm_device *dev, struct drm_file *file_priv, =
uint32_t id)
This goes above the 80 column limit. Anyway I'd leave this line alone,
we're already using ints as channel indices in most places.

>  {
>  	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>  	struct nouveau_channel *chan;
>  	unsigned long flags;
>=20=20
> +	if (unlikely(id >=3D NOUVEAU_MAX_CHANNEL_NR))
> +		return ERR_PTR(-EINVAL);
> +
>  	spin_lock_irqsave(&dev_priv->channels.lock, flags);
>  	chan =3D nouveau_channel_get_unlocked(dev_priv->channels.ptr[id]);
>  	spin_unlock_irqrestore(&dev_priv->channels.lock, flags);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index e815756..ec3eed2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -870,7 +870,7 @@ extern int  nouveau_channel_alloc(struct drm_device *=
dev,
>  extern struct nouveau_channel *
>  nouveau_channel_get_unlocked(struct nouveau_channel *);
>  extern struct nouveau_channel *
> -nouveau_channel_get(struct drm_device *, struct drm_file *, int id);
> +nouveau_channel_get(struct drm_device *, struct drm_file *, uint32_t id);
>  extern void nouveau_channel_put_unlocked(struct nouveau_channel **);
>  extern void nouveau_channel_put(struct nouveau_channel **);
>  extern void nouveau_channel_ref(struct nouveau_channel *chan,
> --=20
> 1.7.3.4

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0V9bUACgkQg5k4nX1Sv1trwQEAjGnTGXWQsfhGaoPIdmwvtJYk
1jR0oK4Kpd/mLbuFb5AA/1r3qUEctEV2DLqW9K3F9nc81scxJrdbBxXGB8TUUHib
=gYYQ
-----END PGP SIGNATURE-----
--==-=-=--

--===============1948692589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1948692589==--
