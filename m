From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: add Maxwell to backlight
 initialization
Date: Mon, 15 Aug 2016 22:41:49 +0200
Message-ID: <20160815204149.siy5uojhsh3aiirb@Thessia>
References: <1463856103-4002-1-git-send-email-farisbenbrahem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0171907446=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1463856103-4002-1-git-send-email-farisbenbrahem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Faris Alsalama <farisbenbrahem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0171907446==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sglmnvror55solly"
Content-Disposition: inline


--sglmnvror55solly
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

@Ben: ping
I would guess that the same can be done for Pascal as well.

Cheers,
Pierre

On 02:41 PM - May 21 2016, Faris Alsalama wrote:
> Signed-off-by: Faris Alsalama <farisbenbrahem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 89eb460..dd1cc9b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -232,6 +232,7 @@ nouveau_backlight_init(struct drm_device *dev)
>  		case NV_DEVICE_INFO_V0_TESLA:
>  		case NV_DEVICE_INFO_V0_FERMI:
>  		case NV_DEVICE_INFO_V0_KEPLER:
> +		case NV_DEVICE_INFO_V0_MAXWELL:
>  			return nv50_backlight_init(connector);
>  		default:
>  			break;
> --=20
> 2.1.4
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--sglmnvror55solly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXsikBAAoJEI7uMhYTPh3wDjoQAK4CCvHhaWuXBgycyg/6zWOj
ro+jqnjG6cwtTfq1Bgu3BvXKIRTqWAtRabEzkCILLGttBYETSXSJRV9kAG/G0466
8wnMrERH59cm+wanqrrTsJ8CzVNCkxoa294UhVqAyS0zY/n7tAozZjjfjfNND+PR
hn7ln7Jt2VtSnmUO+WUiS+kC2AWQGwWyliy97B6n+eAZ23SdBsSv4ln7j12QvWrs
uBJkx/pWIuWv2dsY8vMVobz+lbbJG8nik/9WjyT19ODPXBejz7nl6vg6RDqFshyb
cwRqTf8nYKRtYd1m7Y7lI8hsmaO4ccK3Fd/aItnvh6sgnaNARTaV+WymhJlscIp5
/GsEpuS0KVTa8bnHzqGYAcKuuznRdr05yYiuq7WTH1yJF/6LQHeaVlxi6uX5/Eyc
KTL8/QvSnEoFyXh4/9qEjDZupMeKnVtDjbITkGzuwHWWyzdj5027cH12k7hfZ10g
8lNbWdMcWFK0a1uQxk5OeUPyOy1DpORcvmFeuGVyauNXVNwGQY04IzDv/3oxe7N7
bLHqe0+o/TFpRuc/kI89e4DYZWOSaXHOpHbSG0NwZecqnGF8Rve7lIV31g1wz73T
JNfRovfZcp7wWuf9ah0i8HTWePxcOKBBQxiXF2DgFh3Y21eM8RLTbzZnhp2jOVns
KjxsAgsPx8VOPY0CSOgA
=wNSJ
-----END PGP SIGNATURE-----

--sglmnvror55solly--

--===============0171907446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0171907446==--
