From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [kernel PATCH] drm/nouveau: add NOUVEAU_GEM_RELOC_HILO
Date: Wed, 12 Jan 2011 22:08:55 +0100
Message-ID: <87d3o1j0d4.fsf@riseup.net>
References: <1294865031-22457-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0994081794=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1294865031-22457-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Marcin Slusarz's message of "Wed, 12 Jan 2011 21:43:49 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0994081794==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> add new relocation flag which allows to halving number of relocation
> entries on >=3D nv50 cards
>
I suspect that this change is unnecessary. If you're actually seeing a
performance improvement (I guess you are?), it's very likely to be
masking the actual root of the problem -- last time I checked the nv50
gallium pipe driver was rather careless about reloc re-submission (it
re-submits the whole reloc chain once for every draw call instead of
once for every pushbuf flush), and nouveau_reloc_emit() and friends are
very unoptimized.

I'm betting that using HILO or not will make pretty much no difference
once those two places are fixed :).

> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c |   22 +++++++++++++++-------
>  include/drm/nouveau_drm.h             |    1 +
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 9a1fdcf..2e21412 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -507,6 +507,7 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *de=
v,
>  		struct drm_nouveau_gem_pushbuf_bo *b;
>  		struct nouveau_bo *nvbo;
>  		uint32_t data;
> +		uint32_t data2;
>=20=20
>  		if (unlikely(r->bo_index > req->nr_buffers)) {
>  			NV_ERROR(dev, "reloc bo index invalid\n");
> @@ -544,17 +545,22 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *=
dev,
>=20=20
>  		if (r->flags & NOUVEAU_GEM_RELOC_LOW)
>  			data =3D b->presumed.offset + r->data;
> -		else
> -		if (r->flags & NOUVEAU_GEM_RELOC_HIGH)
> +		else if (r->flags & NOUVEAU_GEM_RELOC_HIGH)
>  			data =3D (b->presumed.offset + r->data) >> 32;
> -		else
> +		else if (r->flags & NOUVEAU_GEM_RELOC_HILO) {
> +			data =3D (b->presumed.offset + r->data) >> 32;
> +			data2 =3D b->presumed.offset + r->data;
> +		} else
>  			data =3D r->data;
>=20=20
>  		if (r->flags & NOUVEAU_GEM_RELOC_OR) {
> -			if (b->presumed.domain =3D=3D NOUVEAU_GEM_DOMAIN_GART)
> -				data |=3D r->tor;
> -			else
> -				data |=3D r->vor;
> +			if (b->presumed.domain =3D=3D NOUVEAU_GEM_DOMAIN_GART) {
> +				data  |=3D r->tor;
> +				data2 |=3D r->tor;
> +			} else {
> +				data  |=3D r->vor;
> +				data2 |=3D r->vor;
> +			}
>  		}
>=20=20
>  		spin_lock(&nvbo->bo.lock);
> @@ -566,6 +572,8 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *de=
v,
>  		}
>=20=20
>  		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
> +		if (r->flags & NOUVEAU_GEM_RELOC_HILO)
> +			nouveau_bo_wr32(nvbo, (r->reloc_bo_offset >> 2) + 1, data2);
>  	}
>=20=20
>  	kfree(reloc);
> diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
> index bc5590b..126ea8a 100644
> --- a/include/drm/nouveau_drm.h
> +++ b/include/drm/nouveau_drm.h
> @@ -137,6 +137,7 @@ struct drm_nouveau_gem_pushbuf_bo {
>  #define NOUVEAU_GEM_RELOC_LOW  (1 << 0)
>  #define NOUVEAU_GEM_RELOC_HIGH (1 << 1)
>  #define NOUVEAU_GEM_RELOC_OR   (1 << 2)
> +#define NOUVEAU_GEM_RELOC_HILO (1 << 3)
>  #define NOUVEAU_GEM_MAX_RELOCS 1024
>  struct drm_nouveau_gem_pushbuf_reloc {
>  	uint32_t reloc_bo_index;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0uGGgACgkQg5k4nX1Sv1vgwAD/X4LKyXV7DOwXljC7Kcbqndl9
9q8iPXDbsIwk4SCBeZgA/RNBEL6fBZqylBhnMXCQXIth/S1fkFgtc1CPODz5Lp4V
=t2Pn
-----END PGP SIGNATURE-----
--==-=-=--

--===============0994081794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0994081794==--
