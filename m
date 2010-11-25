From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] nvfx: reset nvfx->hw_zeta
Date: Thu, 25 Nov 2010 17:10:34 +0100
Message-ID: <87hbf5jsed.fsf@riseup.net>
References: <1290631836-21180-1-git-send-email-chantry.xavier@gmail.com>
	<1290631836-21180-2-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798837771=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1290631836-21180-2-git-send-email-chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Xavier Chantry's message of "Wed, 24 Nov 2010 21:50:36 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0798837771==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> If nvfx_framebuffer prepare and validate were called successively with
> fb->zsbuf not NULL and then NULL, nvfx->hw_zeta would contain garbage and
> this would cause failures in nvfx_framebuffer_relocate/OUT_RELOC(hw_zeta).
>
> This was triggered by piglit/texwrap 2D GL_DEPTH_COMPONENT24 and caused
> first a 'write to user buffer!!' error in libdrm and then worse things.
>
> Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks, both patches pushed.

> ---
>  src/gallium/drivers/nvfx/nvfx_state_fb.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/src/gallium/drivers/nvfx/nvfx_state_fb.c b/src/gallium/drive=
rs/nvfx/nvfx_state_fb.c
> index 73885de..90eb110 100644
> --- a/src/gallium/drivers/nvfx/nvfx_state_fb.c
> +++ b/src/gallium/drivers/nvfx/nvfx_state_fb.c
> @@ -113,7 +113,9 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, =
unsigned prepare_result)
>  		nvfx->state.render_temps |=3D nvfx_surface_get_render_target(fb->cbufs=
[i], prepare_result, &nvfx->hw_rt[i]) << i;
>=20=20
>  	for(; i < 4; ++i)
> -		nvfx->hw_rt[i].bo =3D 0;
> +		nvfx->hw_rt[i].bo =3D NULL;
> +
> +	nvfx->hw_zeta.bo =3D NULL;
>=20=20
>  	if (fb->zsbuf) {
>  		nvfx->state.render_temps |=3D nvfx_surface_get_render_target(fb->zsbuf=
, prepare_result, &nvfx->hw_zeta) << 7;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzuinsACgkQg5k4nX1Sv1tMUAD/dcWolfIrg/Ggkq0MIeCvhxLU
CChZoHNBPFiWT3VmFNcA/R9kpcfJiZ4ZM9sxnNn3JdkIrotEKiHX4RuQSR5/QsGS
=OjyF
-----END PGP SIGNATURE-----
--==-=-=--

--===============0798837771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0798837771==--
