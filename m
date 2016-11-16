From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Atomic modesetting + DisplayPort MST
Date: Wed, 16 Nov 2016 11:11:07 +1000
Message-ID: <cad6a156-84d2-b037-0165-2f31a302dc96@gmail.com>
References: <41c72634-4886-0028-93e5-317e3b437092@gmail.com>
 <20161113201729.76ibuakzvhludjqs@Thessia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1180832854=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161113201729.76ibuakzvhludjqs@Thessia>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1180832854==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8ohXaSJTNiAOLtRutAhMNpRhPB7qNtvx8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8ohXaSJTNiAOLtRutAhMNpRhPB7qNtvx8
Content-Type: multipart/mixed; boundary="4trqsFvgKs4aaoAwdXIBNCup1LLKjbN0R"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <cad6a156-84d2-b037-0165-2f31a302dc96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] Atomic modesetting + DisplayPort MST
References: <41c72634-4886-0028-93e5-317e3b437092-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <20161113201729.76ibuakzvhludjqs@Thessia>
In-Reply-To: <20161113201729.76ibuakzvhludjqs@Thessia>

--4trqsFvgKs4aaoAwdXIBNCup1LLKjbN0R
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/14/2016 06:17 AM, Pierre Moreau wrote:
> Hello Ben,
>=20
> You can find below my results; there is a slight over-representation of=
 1st gen
> Tesla cards, but=E2=80=A6 that=E2=80=99s what I have. :-D No regression=
s observed, apart from:
>=20
> * screen rotation on G80, MCP79
> * resuming on G86
Hey Pierre,

Thanks for testing all this!  Notes below.

>=20
> I=E2=80=99ll retest those cards with your linux-4.10 branch but without=
 the atomic + DP
> serie.
>=20
> Pierre
>=20
>=20
> Tested: linux-4.10 (HEAD at b27add13f "drm/nouveau/fifo/gf100-: protect=
 channel preempt with subdev mutex)
> Against: 4.8.7
> Fullscreen game: Portal
> (FAIL is: it is not working, but neither did it before.)
>=20
>=20
> G80:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: REGRESSION (disp: ERROR 5 [INVALID_STATE]
ACK, I'll look into this one.

> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   FAIL (fail ttm_validate, vaildate: -12) (different=
 on 4.8.7, but still failing)
>=20
> G84:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           FAIL (DRM: base-0: timeout)
> * Hotplugging:       OK
> * Fullscreen game:   OK
>=20
> G86:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           REGRESSION (PGRAPH TLB flush idle timeout fail)
Hm, I wouldn't expect something like this to be related.  Is this
reproducible (works reliably before, fails reliably after)?

> * Hotplugging:       -
> * Fullscreen game:   FAIL (gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] -=
 Address 004bed0000) (does not work im 4.8.7 either, though there was no =
trap, just FAIL ttm_validate & cie)
>=20
> G92:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> G94:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> G96:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> G98:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       OK
> * Fullscreen game:   FAIL (fail ttm_validate, vaildate: -12)
>=20
> MCP79:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: REGRESSION (no freeze, no errors, cursor was corre=
ctly updated, but screen does not update though switching to TTY works ju=
st fine)
I don't have the hardware for this, but hopefully whatever I uncover on
G80 will help too :)

Thanks again,
Ben.

> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> GT200:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           FAIL (PGRAPH TLB idle timeout fail)
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> GF100:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> GF114:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       -
> * Fullscreen game:   OK
>=20
> GK208:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       OK
> * Fullscreen game:   OK
>=20
> GM206:
> * Basic modesetting: OK
> * VT switching:      OK
> * Changing rotation: OK
> * Suspend:           OK
> * Hotplugging:       OK
> * Fullscreen game:   OK
>=20
>=20
>=20
> On 07:41 pm - Nov 04 2016, Ben Skeggs wrote:
>> Hey all,
>>
>> I've just pushed out the initial Nouveau support for $subject \o/
>>
>> As the atomic modesetting transition is basically a rewrite of the KMS=

>> portion of the driver, I would be very grateful for any additional
>> testing that people could provide (even as simple as just booting and
>> making sure you get a display is valuable).
>>
>> There's a Linux tree at
>> https://github.com/skeggsb/linux/tree/linux-4.10, and the code also
>> exists in my usual development tree[1] on the master branch (which is
>> currently based on Dave's drm-next tree for Linux 4.10).
>>
>> There's another branch (devel-kms) in the same repository, which is th=
e
>> same code on top of what's currently Linux 4.9.  If you have problems
>> with the 4.10 code, I'd definitely be interested in seeing if they exi=
st
>> on the 4.9 branch too.
>>
>> Thanks in advance!
>> Ben.
>>
>> [1] https://github.com/skeggsb/nouveau
>>
>=20
>=20
>=20
>=20
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--4trqsFvgKs4aaoAwdXIBNCup1LLKjbN0R--

--8ohXaSJTNiAOLtRutAhMNpRhPB7qNtvx8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYK7IrAAoJEHYLnGJQkpH7ctUP+wUAUxGQeCOlMqzQcWqIsgBj
fF3cmEfHsIAfAsSwjxnCCeDHBi6pgsjQuyRyyV6tl23zXxsvhTnXeU+p89AKkXBe
oBewlJl1vLPkwHgUKh5DS5C1u62I13xjGb3j4zAIpEIU2cuoSv2o6ICNMmxUIJz1
V45UNptioPvAExZyywpjD83PkswPgG3kvyoTZIPjgWhnBD72xwGPoEGUeG0IWgMF
mjnyMTG2go8nVyJYSjtmkgJpfVhUMq5wvC5pK5650pEPZbc3S+QOtFISoZ5+D4vK
7wXVGOVsUULv7MBwjE05oEZV6LsPFT7whhXCFVCWRhPCzrtH9rlwhlUdCXRaKYzt
oV/pZWExaf+mXy1Fnua7yrEGcyo4HhOhcfpBSiPXJb2mwHIKVBYu74hJZBcuVyBP
i9VWLBnqdLJljbz9bqUjcOakZE/lK9pQlAtQl+yIl8wQ6e3PAt4AVQawP9TpzCDR
Jgt39J4l2IcFf9i+zRSpgeBXqsJwMoJQnoqxZnVulKfFBGP3ELeJGMzWO0tbKjjP
nSDZ4ze3e+Gc8yBn2pXoY2z7kOXdzEtejf+xMW63MEJAcR9fjtrTjOwHokM1Kef3
Et1bICW7e60XN68wAXtDhmTE5YAq7boU0+ESib5WQ3Ahv60gwBCn7Dn+hCBPA1Io
J8AcpIPoZfgF+gJ5g1Ee
=ND1e
-----END PGP SIGNATURE-----

--8ohXaSJTNiAOLtRutAhMNpRhPB7qNtvx8--

--===============1180832854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1180832854==--
