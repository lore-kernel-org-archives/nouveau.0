From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nv10: disable perf hack on low memory
	cards
Date: Sun, 06 Nov 2011 21:54:01 +0100
Message-ID: <878vntvuom.fsf@riseup.net>
References: <1320607930-21794-3-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0213698930=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1320607930-21794-3-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Marcin Slusarz's message of "Sun, 6 Nov 2011 20:32:05 +0100")
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

--===============0213698930==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 16MB cards it's too easy to hit ENOMEM with 2D use when this
> perf hack is enabled.
>
AFAIK the "hack" still makes sense on such low memory cards.  I guess
the right way to fix this corner case would be to have fall-back
placement ranges in TTM the same way there's a list of allowed placement
types right now.

But, it's probably not worth the effort.  For now I've just pushed a
patch changing the BO size threshold that determines whether to set the
placement range or not.  That's likely to behave better than a hard
memory limit of this kind, both when you have a <32MB card with small
enough render buffers or a >32MB card with huge render buffers that
would otherwise hit the same bug.

> This should fix https://bugs.freedesktop.org/show_bug.cgi?id=3D42384
>
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 7226f41..a692648 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -148,6 +148,7 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t=
 type)
>=20=20
>  	if (dev_priv->card_type =3D=3D NV_10 &&
>  	    nvbo->tile_mode && (type & TTM_PL_FLAG_VRAM) &&
> +	    dev_priv->vram_size >=3D 32 * 1024 * 1024 &&
>  	    nvbo->bo.mem.num_pages < vram_pages / 2) {
>  		/*
>  		 * Make sure that the color and depth buffers are handled

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk628+oACgkQg5k4nX1Sv1t8OgD/cvjV+mChxMjWp3ysu7hA086Y
Cxxp3XhCIR7cII+1TGwA/0qLAXhcTBk2WuKRyYv6uB1wlqVMX0Z0OdmTkRC2DfMf
=CrM7
-----END PGP SIGNATURE-----
--==-=-=--

--===============0213698930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0213698930==--
