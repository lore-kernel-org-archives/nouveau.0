From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [mesa PATCH] nouveau: handle early initialization
	errors
Date: Thu, 26 Aug 2010 00:36:29 +0200
Message-ID: <871v9mb9qq.fsf@riseup.net>
References: <20100823204058.GA8160@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1918345630=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100823204058.GA8160-OI9uyE9O0yo@public.gmane.org> (Marcin Slusarz's message of
	"Mon, 23 Aug 2010 22:40:58 +0200")
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

--===============1918345630==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> handle very early errors in pipe_screen creation (failure of
> nouveau_screen_init in nv50_screen_create)
> ---
>  src/gallium/drivers/nouveau/nouveau_screen.c       |    3 ++-
>  .../winsys/nouveau/drm/nouveau_drm_winsys.c        |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/d=
rivers/nouveau/nouveau_screen.c
> index 513e5e0..ebb21a6 100644
> --- a/src/gallium/drivers/nouveau/nouveau_screen.c
> +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
> @@ -258,6 +258,7 @@ nouveau_screen_fini(struct nouveau_screen *screen)
>  {
>  	struct pipe_winsys *ws =3D screen->base.winsys;
>  	nouveau_channel_free(&screen->channel);
> -	ws->destroy(ws);
> +	if (ws)
> +		ws->destroy(ws);
>  }
>=20=20
> diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c b/src/ga=
llium/winsys/nouveau/drm/nouveau_drm_winsys.c
> index 660dbd0..d4bf124 100644
> --- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
> +++ b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
> @@ -19,7 +19,8 @@ nouveau_drm_destroy_winsys(struct pipe_winsys *s)
>  {
>  	struct nouveau_winsys *nv_winsys =3D nouveau_winsys(s);
>  	struct nouveau_screen *nv_screen=3D nouveau_screen(nv_winsys->pscreen);
> -	nouveau_device_close(&nv_screen->device);
> +	if (nv_screen)
> +		nouveau_device_close(&nv_screen->device);
>  	FREE(nv_winsys);
>  }

Thanks, pushed.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkx1mu4ACgkQg5k4nX1Sv1vOdwEAgOpXp92wj6n/j192csLgERMi
oFM9hGHzc4ZZ244dm48A/01qbbKS9X8Xb80vv9YN2WmL/SSsI1MFhR4fnzFboVUW
=+FMI
-----END PGP SIGNATURE-----
--==-=-=--

--===============1918345630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1918345630==--
