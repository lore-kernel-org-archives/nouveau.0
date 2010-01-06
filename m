From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Wed, 06 Jan 2010 21:59:04 +0100
Message-ID: <87iqbfhrvr.fsf@riseup.net>
References: <1262755950.2346.5.camel@araqiel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1459417781=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262755950.2346.5.camel@araqiel> (Ben Skeggs's message of "Wed,
	06 Jan 2010 15:32:30 +1000")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1459417781==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> I did a very quick pass at removing all the non-KMS support from the
> DDX.  It's tested on G80 but nowhere else currently, I thought some
> discussion would be a good idea rather than just ripping it out :)
>
> The non-KMS paths are messy, and lets face it, rotting badly.  IMO the
> KMS code is stable enough now that we can continue without the UMS
> crutch, and indeed, the KMS code supports a lot more chipsets
> (particularly on GF8 and up) than the UMS code ever will.
>
> I've left the Xv overlay code intact, but ifdef'd out.  I want to bring
> support back with KMS enabled (thinking of older chipsets where the
> blitter sucks), so it made sense to leave the old code there for now.
>
> So, who has some Signed-off-by's :)

I'm very happy that we're finally getting rid of this :), besides a few
comments, you got my blessing:
Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>

>
> Ben.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

Some snips from the patch in question:

> [...]
> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> index e37e7c1..3d2df8d 100644
> --- a/src/drmmode_display.c
> +++ b/src/drmmode_display.c
> [...]
> +#define SOURCE_MASK_INTERLEAVE 32
> +#define TRANSPARENT_PIXEL   0
> +
> +/*
> + * Convert a source/mask bitmap cursor to an ARGB cursor, clipping or
> + * padding as necessary. source/mask are assumed to be alternated each
> + * SOURCE_MASK_INTERLEAVE bits.
> + */
> +static void
> +nv_cursor_convert_cursor(uint32_t *src, void *dst, int src_stride,
> +			 int dst_stride, int bpp, uint32_t fg, uint32_t bg)
> +{
> +	int width = min(src_stride, dst_stride);
> +	uint32_t b, m, pxval;
> +	int i, j, k;
> +
> +	for (i = 0; i < width; i++) {
> +		for (j = 0; j < width / SOURCE_MASK_INTERLEAVE; j++) {
> +			int src_off = i*src_stride/SOURCE_MASK_INTERLEAVE + j;
> +			int dst_off = i*dst_stride + j*SOURCE_MASK_INTERLEAVE;
> +
> +			b = src[2*src_off];
> +			m = src[2*src_off + 1];
> +
> +			for (k = 0; k < SOURCE_MASK_INTERLEAVE; k++) {
> +				pxval = TRANSPARENT_PIXEL;
> +#if X_BYTE_ORDER == X_BIG_ENDIAN
> +				if (m & 0x80000000)
> +					pxval = (b & 0x80000000) ? fg : bg;
> +				b <<= 1;
> +				m <<= 1;
> +#else
> +				if (m & 1)
> +					pxval = (b & 1) ? fg : bg;
> +				b >>= 1;
> +				m >>= 1;
> +#endif
> +				if (bpp == 32)
> +					((uint32_t *)dst)[dst_off + k] = pxval;
> +				else
> +					((uint16_t *)dst)[dst_off + k] = pxval;
> +			}
> +		}
> +	}
> +}
> +

I'm quite sure that, without UMS, this function doesn't make sense
anymore, you could leave this fun for the X server (we can use the
load_cursor_argb hook even on the cards we don't advertise ARGB
support). As a bonus that would probably solve Craig's rotated cursor
issue.

> [...]
> diff --git a/src/nv_setup.c b/src/nv_setup.c
> deleted file mode 100644
> index f0478ca..0000000
> --- a/src/nv_setup.c
> +++ /dev/null
> [...]
> -	pNv->alphaCursor = (pNv->NVArch >= 0x11);
> -
> -	pNv->twoHeads = (pNv->Architecture >= NV_ARCH_10) &&
> -			(implementation != CHIPSET_NV10) &&
> -			(implementation != CHIPSET_NV15) &&
> -			(implementation != CHIPSET_NFORCE) &&
> -			(implementation != CHIPSET_NV20);
> -
> -	pNv->gf4_disp_arch = pNv->twoHeads && implementation != CHIPSET_NV11;
> -
> -	/* nv30 and nv35 have two stage PLLs, but use only one register; they are dealt with separately */
> -	pNv->two_reg_pll = (implementation == CHIPSET_NV31) ||
> -			   (implementation == CHIPSET_NV36) ||
> -			   (pNv->Architecture >= NV_ARCH_40);
> -
> -	pNv->WaitVSyncPossible = (pNv->Architecture >= NV_ARCH_10) &&
> -				 (implementation != CHIPSET_NV10);
> -

The accel code still has some bogus checks for WaitVSyncPossible, and
bad things will happen if it's left uninitialized. Anyway, it would be
nice to kill all this crap from NVRec.

> -	pNv->BlendingPossible = ((pNv->Chipset & 0xffff) > CHIPSET_NV04);
> [...]

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAktE+ZgACgkQ196Zy2qEI5dFtQCgkLWi350yf4luLbKOarJg1EHk
KxoAoNLV4Xrmm1XqBNcnHD6ZyZxOariU
=s0Yz
-----END PGP SIGNATURE-----
--==-=-=--

--===============1459417781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1459417781==--
