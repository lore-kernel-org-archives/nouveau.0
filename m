From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [mesa v2 1/9] nouveau: bump required libdrm version
 to 2.4.66
Date: Mon, 7 Dec 2015 13:49:55 +1000
Message-ID: <566501E3.5070104@gmail.com>
References: <1448586301-8351-1-git-send-email-skeggsb@gmail.com>
 <CAKb7UvjHtC4r+K4UMtha1vw5qM1Fpv9EYRXxjbKw6VmNGKMe=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0652872274=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjHtC4r+K4UMtha1vw5qM1Fpv9EYRXxjbKw6VmNGKMe=g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0652872274==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="puQxKe5nAQodvF2Euf94kOpMw1rUrXBR1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--puQxKe5nAQodvF2Euf94kOpMw1rUrXBR1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/07/2015 01:32 PM, Ilia Mirkin wrote:
> On Thu, Nov 26, 2015 at 8:04 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  configure.ac | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure.ac b/configure.ac
>> index 4016871..c02ee61 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -73,7 +73,7 @@ LIBDRM_RADEON_REQUIRED=3D2.4.56
>>  LIBDRM_AMDGPU_REQUIRED=3D2.4.63
>>  LIBDRM_INTEL_REQUIRED=3D2.4.61
>>  LIBDRM_NVVIEUX_REQUIRED=3D2.4.33
>=20
> Do you also need to bump this one? Not sure (yet) why you're bumping
> the other one, but pointing this one out
Oops, thanks!

>=20
>> -LIBDRM_NOUVEAU_REQUIRED=3D2.4.62
>> +LIBDRM_NOUVEAU_REQUIRED=3D2.4.66
>>  LIBDRM_FREEDRENO_REQUIRED=3D2.4.65
>>  DRI2PROTO_REQUIRED=3D2.6
>>  DRI3PROTO_REQUIRED=3D1.0
>> --
>> 2.6.3
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau


--puQxKe5nAQodvF2Euf94kOpMw1rUrXBR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWZQHjAAoJEHYLnGJQkpH7xX8QAKaiBu95mi/7fRfFcVQ5PsM6
jpZmS4hSZOgBz/J2XGfOOZNX/R3P/fOWiC8mMFI2SNq2FM9fuq8UdtWqV2/q3kom
mTqEZbw8oYNom7mLrTJ6+FsmgLhp8ettZikW/jhReJ+uU7oQHGjUmjMKKk5TPXHY
lwzj9kZAgHN5Wz35f4BnZIfFkBuMa2yKVyifBKQocs6B70mx/g9COZ5wDUlF7inZ
/MCemrgLflxeBnfTCBB9HyfAlL4XRF/s9Zsq4VJkKGtdmzkF+IjUPOB3txeTeV5v
z2KkmjrMht41AA3pUyS844zqaGXyewc1CfrueR9mw0bJQo4S+Y97f+X1JD94ZyEA
biCtBzbVtoXAcrW8rqOsAG84OB9TNriHde4RPKRMUoXlwfFApdGXkT3YepSBA/4q
q5POIHJUM3/2A2N8lQmc9OkcgDc27Uu7bGMby25oF6GzI47QBeuRRgp+3QLU0T6k
/dlFchZT8g9siFzGyH69EURJYIP9j8DlT4ag51JH7NYNBzjXw8NJHpzxSL2DICxE
HBpxdBMGIGV2HB2kyWnlSAns55kK0gI2RFJbO+slho32JA+M87gN5RaFP2aYX+AP
uZeVPwniX9AsH/GmQRw1LxlPdKvih4mlwc0SDXKp1N6M6Y2LeKZCpn5IWjgBg1sZ
oxkmTlPpHf0HZFes6G5p
=papZ
-----END PGP SIGNATURE-----

--puQxKe5nAQodvF2Euf94kOpMw1rUrXBR1--

--===============0652872274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0652872274==--
