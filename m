From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau/vieux: only advertise supported
	texture formats
Date: Mon, 30 Apr 2012 21:42:49 +0200
Message-ID: <87vckhvwee.fsf@riseup.net>
References: <1335806214-13903-1-git-send-email-dev@lynxeye.de>
	<87lildxfbh.fsf@riseup.net> <1335810158.9221.16.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1402181756=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335810158.9221.16.camel@tellur> (Lucas Stach's message of "Mon,
	30 Apr 2012 20:22:38 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1402181756==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:

> Am Montag, den 30.04.2012, 20:08 +0200 schrieb Francisco Jerez:
>> Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:
>>[...]
>> > +	/* only advertise supported texture formats */
>> > +	memset(&ctx->TextureFormatSupported, 0,
>> > +	       sizeof(ctx->TextureFormatSupported));
>> > +	ctx->TextureFormatSupported[MESA_FORMAT_XRGB8888] =3D true;
>> > +	ctx->TextureFormatSupported[MESA_FORMAT_ARGB8888] =3D true;
>> > +	ctx->TextureFormatSupported[MESA_FORMAT_RGB565] =3D true;
>> > +	ctx->TextureFormatSupported[MESA_FORMAT_Z16] =3D true;
>> > +	ctx->TextureFormatSupported[MESA_FORMAT_Z24_S8] =3D true;
>> > +
>> Hi Lucas,
>>=20
>> It's not obvious to me how this works.  AFAIK nouveau doesn't make use
>> of this array.  And even if it did, the texture formats you're listing
>> aren't the supported ones.
>
> Hello Francisco,
>
> The core mesa code decides what texture formats to advertise based on
> this array.

Are you sure?  TextureFormatSupported doesn't seem to have any effect
except in drivers that use mesa's default for the ChooseTextureFormat
hook.

> And obviously someone thought it would be a good idea to
> init this array to "everything supported" if the driver doesn't
> overrides this.
>
> I opted to only advertise renderable texture formats, for reasons
> explained in my mail a minute ago.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk+e6z0ACgkQg5k4nX1Sv1vrxAD/TB/R/+WXzGs2N+UJ5JhwqVeF
qi5pnlFvIvbrpZqtrwQA/3mEhVQPZihC3oRYTY+NXavVqLtjYzhS69SRHZVt7JL4
=pwyC
-----END PGP SIGNATURE-----
--==-=-=--

--===============1402181756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1402181756==--
