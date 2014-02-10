From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/fifo: allocate usermem as needed
Date: Mon, 10 Feb 2014 13:14:33 +0100
Message-ID: <20140210121431.GD20143@ulmo.nvidia.com>
References: <1392011821-2406-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1869531728=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392011821-2406-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1869531728==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2014 at 02:57:01PM +0900, Alexandre Courbot wrote:
> Memory was always allocated for 4096 channels. Change this to allocate
> what we actually need according to the number of channels we use.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Looks good to me:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+MKnAAoJEN0jrNd/PrOh7fEP/1Z7mQnIaUIK9Z40DcxFTgAk
J/+CGg3z4gLbDiBG9Cqw0cXKv9GRGMAy34AJiec2RubQZk3So87n8uTKcUT/nWSR
vpRBovyd70Byzs+bEkOOkUtGWXXgkbI0CPsxL1inL6sCGfEU+e76QkA/bbe3T4pP
N29LV+uFJQU4FG2rcOkFhqKe4hQe/edc4/b9RC7U9WP2paVI/Ex5Fu6MuGoKssri
1//6SyC72Afv5Pkk2weV2jB+ikUJEkodZovvIE39+aFEWA7LDTlmVOaYrZWuKLIH
t7hLVGNaWsRAIC6ntAyqoAgyd0ONFV0hams071CM7Ey/xtilG3N7gKoBSVKBx0+A
YCPRbr4IgPtdeoxbaYNTzYHkoa4L4QI64FsNxCbY5fSseZznBwellbgJmRVW6CYU
fzjGo3Mh+AIg1hfizYgm6r6wTOGZetpfsaupfei8PN7mNyfOxBZ6JOw2B1o7g4bS
Q9yw0wjq9cJ8tyou/SaSRxM1dJzSoumfeDb3sBcBuiV0C2v29eBz45td7sEDnvJu
kTb+z3EM98t0nmfzsH02Lnt/D/Dyr0JgSGEHr7SdL2sJRy4+DsaCs3JCo4ZiT+nn
D1vVNXpjxeJs2N/DcJt5DCE7W3dUKbkvRKgrqAEadsWjkR/QPSgRzStSwEi9+NB7
FNtV732ZNcOtv4dARF2m
=vm+j
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--

--===============1869531728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1869531728==--
