From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/nouveau/secboot: remove VLA usage
Date: Wed, 14 Mar 2018 12:08:34 +0100
Message-ID: <20180314110834.GB8564@ulmo>
References: <20180313162411.GA1983@embeddedgus>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1695206965=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180313162411.GA1983@embeddedgus>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1695206965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2018 at 11:24:11AM -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wvla, remove VLA. In this particular
> case directly use macro NVKM_MSGQUEUE_CMDLINE_SIZE instead of local
> variable cmdline_size. Also, remove cmdline_size as it is not
> actually useful anymore.
>=20
> The use of stack Variable Length Arrays needs to be avoided, as they
> can be a vector for stack exhaustion, which can be both a runtime bug
> or a security flaw. Also, in general, as code evolves it is easy to
> lose track of how big a VLA can get. Thus, we can end up having runtime
> failures that are hard to debug.
>=20
> Also, fixed as part of the directive to remove all VLAs from
> the kernel: https://lkml.org/lkml/2018/3/7/621
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
> ---
> Changes in v2:
>  - Use sizeof(buf) instead of NVKM_MSGQUEUE_CMDLINE_SIZE. This change
>    is based on the feedback provided by David Laight. Thanks David.
>=20
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c | 7 +++-=
---
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqpAq8ACgkQ3SOs138+
s6EoOg//S3oaA0fk2LHi/O5aXNHiK+EAqIjnb+tbwu5zji9AHXLyqvkjme5ZfwSl
YnAAH4gffi+93bHSVdC5gMAT02Lpep1wN/5O76dKRK25LZluMYK2ybAgC9LDeZeI
3j406OS3Fe/qYk5c0nj5vrRNAJOBVrkZ52FMhakc36896ZYu+aHqUkhdv0nYgYiF
+RQwtNldnTOOJ12WU+ZqCR7u/v5OAc+rOxsyuYozJHJ8JFE23hraxV15XIsRsizr
VjWD8aIUNnchlpGiiiN61f7h50E7kYi0ChprUcSQtmTO+xp2bgFVLKRFevCLu5kL
SckzSGzewvUCkTC18yFuwZbtHW948c1FrO1aveK3PvLtqGe1RwMe9nTz/9aRNJZu
+fLcNVD+5kDC4h8zcbdBDXfDxtAUcPZpDgv+xutUuVjN1cay+B7+EijwX2j7CCxC
JlMSsOVcSA7A8tIxqMCMPfQ9QwbX3W42B48CvvlP3hL1kiEOz4InXlqkR5p/yFRg
C6e2jpHm2xJV7RPIQGTx9efexCxgosUhV1k2YQiBzRheKJtuR29HATEvrC1xQla4
Xl971Tq5Ugbrm4hJlczsbz4T1dKBsPp6J3hSzcuJuWYzRMuG3zgcW1l1n3L08g8e
oC/yn42kH5jhaFJW8h0lBc63Era61OxSKPxoZCKqKe8WVKYfN8A=
=YxhP
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

--===============1695206965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1695206965==--
