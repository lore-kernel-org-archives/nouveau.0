From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] dri/nouveau: Clean up magic numbers in
	get_rt_format
Date: Fri, 19 Nov 2010 19:06:56 +0100
Message-ID: <878w0ptcfz.fsf@riseup.net>
References: <1289946153-3024-1-git-send-email-noviktor@seznam.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1642306347=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1289946153-3024-1-git-send-email-noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ("Viktor
	=?utf-8?Q?Novotn=C3=BD=22's?= message of "Tue,
	16 Nov 2010 23:22:33 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1642306347==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> writes:

> From: Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
>
> Signed-off-by: Viktor Novotn=C3=BD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
> ---
> Hi,
>
> since the switch to rnn headers was pushed(thank you, curro), here is a p=
atch
> that I inteded to submit first, but somehow ended making the switch.
> It is just a small clean up.
>
> Regards
> 	Viktor
>
>  src/mesa/drivers/dri/nouveau/nv04_state_fb.c |    6 +++---
>  src/mesa/drivers/dri/nouveau/nv10_state_fb.c |   10 +++++-----
>  src/mesa/drivers/dri/nouveau/nv20_state_fb.c |   10 +++++-----
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nv04_state_fb.c b/src/mesa/driv=
ers/dri/nouveau/nv04_state_fb.c
> index 730f91f..854571d 100644
> --- a/src/mesa/drivers/dri/nouveau/nv04_state_fb.c
> +++ b/src/mesa/drivers/dri/nouveau/nv04_state_fb.c
> @@ -36,11 +36,11 @@ get_rt_format(gl_format format)
>  {
>  	switch (format) {
>  	case MESA_FORMAT_XRGB8888:
> -		return 0x05;
> +		return NV04_CONTEXT_SURFACES_3D_FORMAT_COLOR_X8R8G8B8_X8R8G8B8;
>  	case MESA_FORMAT_ARGB8888:
> -		return 0x08;
> +		return NV04_CONTEXT_SURFACES_3D_FORMAT_COLOR_A8R8G8B8;
>  	case MESA_FORMAT_RGB565:
> -		return 0x03;
> +		return NV04_CONTEXT_SURFACES_3D_FORMAT_COLOR_R5G6B5;
>  	default:
>  		assert(0);
>  	}
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c b/src/mesa/driv=
ers/dri/nouveau/nv10_state_fb.c
> index 056054e..0505547 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
> @@ -37,15 +37,15 @@ get_rt_format(gl_format format)
>  {
>  	switch (format) {
>  	case MESA_FORMAT_XRGB8888:
> -		return 0x05;
> +		return NV10_3D_RT_FORMAT_COLOR_X8R8G8B8;
>  	case MESA_FORMAT_ARGB8888:
> -		return 0x08;
> +		return NV10_3D_RT_FORMAT_COLOR_A8R8G8B8;
>  	case MESA_FORMAT_RGB565:
> -		return 0x03;
> +		return NV10_3D_RT_FORMAT_COLOR_R5G6B5;
>  	case MESA_FORMAT_Z16:
> -		return 0x10;
> +		return NV10_3D_RT_FORMAT_DEPTH_Z16;
>  	case MESA_FORMAT_Z24_S8:
> -		return 0x0;
> +		return NV10_3D_RT_FORMAT_DEPTH_Z24S8;
>  	default:
>  		assert(0);
>  	}
> diff --git a/src/mesa/drivers/dri/nouveau/nv20_state_fb.c b/src/mesa/driv=
ers/dri/nouveau/nv20_state_fb.c
> index 8cabb55..cbde74e 100644
> --- a/src/mesa/drivers/dri/nouveau/nv20_state_fb.c
> +++ b/src/mesa/drivers/dri/nouveau/nv20_state_fb.c
> @@ -37,15 +37,15 @@ get_rt_format(gl_format format)
>  {
>  	switch (format) {
>  	case MESA_FORMAT_XRGB8888:
> -		return 0x05;
> +		return NV20_3D_RT_FORMAT_COLOR_X8R8G8B8;
>  	case MESA_FORMAT_ARGB8888:
> -		return 0x08;
> +		return NV20_3D_RT_FORMAT_COLOR_A8R8G8B8;
>  	case MESA_FORMAT_RGB565:
> -		return 0x03;
> +		return NV20_3D_RT_FORMAT_COLOR_R5G6B5;
>  	case MESA_FORMAT_Z16:
> -		return 0x10;
> +		return NV20_3D_RT_FORMAT_DEPTH_Z16;
>  	case MESA_FORMAT_Z24_S8:
> -		return 0x20;
> +		return NV20_3D_RT_FORMAT_DEPTH_Z24S8;
>  	default:
>  		assert(0);
>  	}

Thanks, pushed.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzmvMAACgkQg5k4nX1Sv1s11AD9GHOh+8C14utpUsQmUKi07rH8
koqfYNVOaD6f2QywtSkA/RjDkI6i30J+a1UreaKSwf2j3qCFFIRzQrH7Fe+UkmsV
=z16g
-----END PGP SIGNATURE-----
--==-=-=--

--===============1642306347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1642306347==--
