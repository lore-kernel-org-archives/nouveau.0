From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [libdrm PATCH 1/3] nouveau: remove unused OUT_RELOC2
	and OUT_RELOCr
Date: Wed, 12 Jan 2011 19:26:07 +0100
Message-ID: <87mxn6htc0.fsf@riseup.net>
References: <1294594263-1862-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0500599985=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1294594263-1862-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Marcin Slusarz's message of "Sun, 9 Jan 2011 18:30:58 +0100")
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0500599985==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> ---
>  nouveau/nouveau_pushbuf.h |   17 -----------------
>  1 files changed, 0 insertions(+), 17 deletions(-)
>
> diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
> index 2a98789..70d0f28 100644
> --- a/nouveau/nouveau_pushbuf.h
> +++ b/nouveau/nouveau_pushbuf.h
> @@ -109,15 +109,6 @@ OUT_RELOC(struct nouveau_channel *chan, struct nouve=
au_bo *bo,
>  					  data, 0, flags, vor, tor);
>  }
>=20=20
> -static __inline__ int
> -OUT_RELOC2(struct nouveau_channel *chan, struct nouveau_bo *bo,
> -	   unsigned data, unsigned data2, unsigned flags,
> -	   unsigned vor, unsigned tor)
> -{
> -	return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
> -					  data, data2, flags, vor, tor);
> -}
> -
>  /* Raw data + flags depending on FB/TT buffer */
>  static __inline__ int
>  OUT_RELOCd(struct nouveau_channel *chan, struct nouveau_bo *bo,
> @@ -143,14 +134,6 @@ OUT_RELOCl(struct nouveau_channel *chan, struct nouv=
eau_bo *bo,
>  	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_LOW, 0, 0);
>  }
>=20=20
> -/* Low 32-bits of offset + GPU linear access range info */
> -static __inline__ int
> -OUT_RELOCr(struct nouveau_channel *chan, struct nouveau_bo *bo,
> -	   unsigned delta, unsigned size, unsigned flags)
> -{
> -	return OUT_RELOC2(chan, bo, delta, size, flags | NOUVEAU_BO_LOW, 0, 0);
> -}
> -
>  /* High 32-bits of offset */
>  static __inline__ int
>  OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,

This patch series looks like a good clean-up. Ben, do you have any
additional changes in mind for the libdrm API? (If you do they could go
in together to avoid annoying users more often than necessary)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0t8kAACgkQg5k4nX1Sv1ugngD/SN26umbkGCgWn8Ux/bdVJZvt
YDANZl3co6MWNC2+FJoA/0SlKut07UC3chloiPMyn0f1z+T1Q/f+e9OWutJrKGYs
=E7m2
-----END PGP SIGNATURE-----
--==-=-=--

--===============0500599985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0500599985==--
