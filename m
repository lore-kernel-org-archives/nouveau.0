From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau: make sure initial kalloc for user bo
	ends up in the right place
Date: Mon, 01 Mar 2010 22:26:24 +0100
Message-ID: <87fx4jka2n.fsf@riseup.net>
References: <1267468776-6652-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650718930=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1267468776-6652-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Maarten
	Maathuis's message of "Mon, 1 Mar 2010 19:39:36 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1650718930==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> - Currently reloc'ing a user bo to gart will first cause an allocation in=
 vram,
> which is then cpu written to, then the bo gets moved to gart.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  nouveau/nouveau_reloc.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/nouveau/nouveau_reloc.c b/nouveau/nouveau_reloc.c
> index 301482b..332dfa0 100644
> --- a/nouveau/nouveau_reloc.c
> +++ b/nouveau/nouveau_reloc.c
> @@ -73,6 +73,12 @@ nouveau_reloc_emit(struct nouveau_channel *chan, struc=
t nouveau_bo *reloc_bo,
>  		return -EINVAL;
>  	}
>=20=20
> +	/* We're about to reloc a user buffer, better make sure we don't cause
> +	 * a double migration.
> +	 */
> +	if (!(nvbo->flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM)))
> +		nvbo->flags |=3D (flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM));
> +
>  	rpbbo =3D nouveau_bo_emit_buffer(chan, reloc_bo);
>  	if (!rpbbo)
>  		return -ENOMEM;

Looks good to me:
Acked-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuMMQEACgkQ196Zy2qEI5dg9QCgtT73PO5v7sbi4ljQTydXjgH+
WDQAoJf3LUxnL2AaKSPhVenkqEEmKxFh
=tCwe
-----END PGP SIGNATURE-----
--==-=-=--

--===============1650718930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1650718930==--
