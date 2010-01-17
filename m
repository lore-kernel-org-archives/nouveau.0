From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Acknowledge DMA_VTX_PROTECTION
	PGRAPH interrupts
Date: Sun, 17 Jan 2010 19:16:14 +0100
Message-ID: <874omk1tsh.fsf@riseup.net>
References: <1263652071-17874-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1683411499=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1263652071-17874-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> (Luca
	Barbieri's message of "Sat, 16 Jan 2010 15:27:51 +0100")
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
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1683411499==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:

> Currently Nouveau is unable to dismiss DMA_VTX_PROTECTION errors,
> which results in an infinite loop in the interrupt handler.
>
> These errors are caused both by bugs in the Gallium driver and by
> user-specified index buffers with out of bounds indices.
>
> By mmio-tracing the nVidia drivers, I found out how this is done.
> On DMA_VTX_PROTECTION, The nVidia driver reads the register 0x402000,
> always getting the value 4, and then writes 4 back to 0x402000.
>
> This patch adds that logic by reading 0x402000 and writing the same
> value back.
> It's unclear what should happen if the value read is not 4, and
> the current approach might not be the correct one.
>
> To test this, modify mesa/progs/trivial/vbo-drawrange.c, defining
> ELTOBJ to 1 and replacing indices with huge out of bounds integers.
>
> Without this patch, the GPU and/or kernel should lock up.
> With this patch, it should misrender as expected but not lock up.
>
> The errors are still logged since they are useful for development.
>
> This has been tested on NV49 and may not work on other cards.
>
> To find out how things work on other cards, run the aforementioned
> test using the blob with mmiotrace and grep for a read of the PGRAPH
> source register.
>
> Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_irq.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouv=
eau/nouveau_irq.c
> index 919a619..14de5a1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_irq.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
> @@ -483,9 +483,16 @@ nouveau_pgraph_intr_error(struct drm_device *dev, ui=
nt32_t nsource)
>  	if (nsource & NV03_PGRAPH_NSOURCE_ILLEGAL_MTHD) {
>  		if (nouveau_pgraph_intr_swmthd(dev, &trap))
>  			unhandled =3D 1;
> -	} else {
> +	} else if(nsource & NV03_PGRAPH_NSOURCE_DMA_VTX_PROTECTION) {
> +		uint32_t v =3D nv_rd32(dev, 0x402000);
> +		nv_wr32(dev, 0x402000, v);
> +
> +		/* dump the error anyway for now: it's useful for
> +		   Gallium development */
>  		unhandled =3D 1;
>  	}
> +	else
> +		unhandled =3D 1;
>=20=20
>  	if (unhandled && nouveau_ratelimit())
>  		nouveau_graph_dump_trap_info(dev, "PGRAPH_ERROR", &trap);

Both pushed. Thanks!

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktTU+4ACgkQ196Zy2qEI5e+UgCZAQYUqZLUHiDps1vGXEORBaCM
fyIAnifGSj5vZkkX4UHpNpOIKdhI/da2
=MA1s
-----END PGP SIGNATURE-----
--==-=-=--

--===============1683411499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1683411499==--
