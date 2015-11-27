From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [mesa 7/9] nv50: fix g98+ vdec class allocation
Date: Fri, 27 Nov 2015 11:05:59 +1000
Message-ID: <5657AC77.2050009@gmail.com>
References: <1448522103-4925-1-git-send-email-skeggsb@gmail.com>
 <1448522103-4925-7-git-send-email-skeggsb@gmail.com>
 <CACvgo53x74cJHXXJ6kZMAdFC2QU3QKeTg=9mRL9VDKq6MvnDMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0844478530=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACvgo53x74cJHXXJ6kZMAdFC2QU3QKeTg=9mRL9VDKq6MvnDMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0844478530==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jbVDVtF44Mq3dOr99dINLcDmCoS95nfCI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jbVDVtF44Mq3dOr99dINLcDmCoS95nfCI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/27/2015 07:50 AM, Emil Velikov wrote:
> On 26 November 2015 at 07:15, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
>> +static const struct nouveau_mclass
>> +nv98_decoder_msvld[] =3D {
>> +   { 0x88b1, -1 },
>> +   { 0x86b1, -1 },
>> +   { 0x85b1, -1 },
>> +   {}
>> +};
>> +
>> +static const struct nouveau_mclass
>> +nv98_decoder_mspdec[] =3D {
>> +   { 0x88b2, -1 },
>> +   { 0x85b2, -1 },
>> +   {}
>> +};
>> +
>> +static const struct nouveau_mclass
>> +nv98_decoder_msppp[] =3D {
>> +   { 0x88b3, -1 },
>> +   { 0x85b3, -1 },
>> +   {}
>> +};
>> +
> Was going to suggest using the new headers, only to realise that there
> are no for video decoding. Is that intentional ?
There is, I was just being lazy.  Fixed in the next series :)

>=20
> -Emil
>=20


--jbVDVtF44Mq3dOr99dINLcDmCoS95nfCI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWV6x3AAoJEHYLnGJQkpH716cQAKuyZtkmT8QYr87dn+N/dRUl
56CHebnBhHGI+dC/kbXGnLhYX78HVvCFRUczKld1BgkqiFKvm7q8itg4sw4nt0dQ
trJIkP+BcBNMzSNTDTwdPthdYZCiB+7i9jYCNC19orjs0A8syGCBwGnt9UqVfb2C
HSUlvZtlqXxIqndnHcEHgDyjBL5293JzckWQdD18BPHLIAem6i70MdWeDyfM4GuF
9UNG8L8V+x5YNPmA2pfOpvDDxjhoc4GR6V+FxZxJfBk9bBhuqgwYKJcmcyzvLeog
DlY9uneeN5WHkIz+eRufIMXQmHvozctFEabJN9Sn/nK6887kAUZEqcTIEhtr+Zcw
StZTAr2IYJiwwpofYqsZdj9GhR4TENC3GkOrhjMrq5Kd9HCO3ptMPJGuPTRX/FTJ
XdinR1fDbFtNrzwiRHWd4OvlwiB+ullg/BN0PmTyO5otSQXN31e+hWR5ca16/WhQ
2GQJSL7FoKdXKKURoGJJU0qVg+QLJ0QkxxVyD/ERFqxZZu5E2or32OzhZw8vYc72
6ruI9ILqbkHWG6+SFChoMGpIE0wEOSxl5nBObxYYYSjYP1xA3x/CWFPHSyO9i5X8
Rn2hw/2aM0+eBp3iQvjOpl+r5lNjHWRHb9AvRbLA8M5onPWFlaCadec3YcWKkkkf
W+rckSc2jZG3eNv+KDsv
=tgMX
-----END PGP SIGNATURE-----

--jbVDVtF44Mq3dOr99dINLcDmCoS95nfCI--

--===============0844478530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0844478530==--
