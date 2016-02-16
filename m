From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 23/23] nvc0: implement support for maxwell
 texture headers
Date: Tue, 16 Feb 2016 15:42:14 +1000
Message-ID: <56C2B6B6.5090808@gmail.com>
References: <1455514736-8909-1-git-send-email-skeggsb@gmail.com>
 <1455514736-8909-23-git-send-email-skeggsb@gmail.com>
 <CAKb7UvgjAjgyvMUS31fS8Jq+vqsO_XyeVreuFsaioU1etoQ_pw@mail.gmail.com>
 <56C245BF.50908@gmail.com>
 <CAKb7UvgRddt2RbF9AJOauTtC22hkhmjR2zKApYBa8Q00Z8Z9MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0336605977=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgRddt2RbF9AJOauTtC22hkhmjR2zKApYBa8Q00Z8Z9MA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0336605977==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="INf2c9CUN3QddFbtAxIT7s9dD7XkutwF5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--INf2c9CUN3QddFbtAxIT7s9dD7XkutwF5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/16/2016 08:08 AM, Ilia Mirkin wrote:
> On Mon, Feb 15, 2016 at 4:40 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 02/16/2016 03:47 AM, Ilia Mirkin wrote:
>>> Can you push this to a repo somewhere? I want to see what the final
>>> version looks like after all your changes, but it's hard to see that
>>> with these patches.
>> https://github.com/skeggsb/Mesa/commits/master
>=20
> Thanks. I looked over this series and it seems fine. I don't hate the
> outcome in nv50_formats.c although it would have been kinda nice to
> keep it together. However outside of new compressed formats, I doubt
> it'll be getting too many updates.
>=20
> Perhaps tic.maxwell should really be tic.version? Presumably later
> GPUs will also use this new TIC format? [There's also a v0 that we
> don't really use but the only tic version supported by G80, which does
> the colorkey thing and doesn't support first/last level.]
>=20
> I would really appreciate it if you could do a piglit run comparison
> against both a nv50 and nvc0 GPU (and not maxwell - those can have
> extra-special issues). If there are no format-related regressions
> (there are a handful of flaky tests), I'm fine with this getting
> pushed.
Hey Ilia,

I've pushed an updated branch containing a small typo fix to the GM107
texture header commit, as well as an extra commit recognising GM20x
chipsets.

The piglit comparisons you requested are at:

G96:
https://drive.google.com/file/d/0B66cGbmsDhPvTUV6TTNuZHJaVGc/view?usp=3Ds=
haring
GF100:
https://drive.google.com/file/d/0B66cGbmsDhPvT0hhMGU2UTRDVG8/view?usp=3Ds=
haring

Thanks,
Ben.


>=20
>   -ilia
>=20


--INf2c9CUN3QddFbtAxIT7s9dD7XkutwF5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWwra2AAoJEHYLnGJQkpH7OvUQAMBLs4pzpUU4LLtw8cln2lMc
pfbwXdXt8RafADhrYKHeIaTy+EbtY94QQj+grSVgGsow5Rs1ixMgPqPFZhJyJwtx
oS/0uGp/hsZ8T0muFdmml3n8GkPa8oxPL1tHDZ2M28ylw0IBizeQu3AQYpDwypNU
CuJuEXcsnn/8Nug8GyVDn/wsxsalVPg4+gERJHhxVuwU6KGOtK7AWKffxJQY5kG5
6kMTVWGMlPC8Me7ScRSyNEqtTCMnJ6s/ZtosymTHg8FOVkaHF6xVS6KvhimVt6gI
ikdRHllD7OzosNXpXHaBbX8iuTCDzYiDOlFcp8hMbbRRbQ17NOS0dQKxwzAHd4z1
xpQtS5+eyMjzf/euv0ZErcR+qi+7wWpE6N1pigGAHryWs8Au1eyCtAjBorSKMkEH
ZITfeIuGs5rotRifUvSCEwTY8xMiYh7mSFIdzc0XxihOEY1g0MyuaWdj8BUgY3AM
e+dFgZwqOvvOteWhq5EwrdM+/v/A/t2eRdKAO1LKG2mvQd5ZpamguYZbgqm76Cmk
qdXj4zojlFraTSlgZ4WQmqpaYySpDc8Z6dJO/XYjR1s/bJB5xsx0wzV4miERWKnE
Db2HF5XNy9lvDvcs1oheryxQgNYK4vj1MXHccph9c9ukOMTkAAWSro1nnRWbMPMZ
69y7Io37YpPU4V6WGcRm
=3fhS
-----END PGP SIGNATURE-----

--INf2c9CUN3QddFbtAxIT7s9dD7XkutwF5--

--===============0336605977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0336605977==--
