From: Pierre Moreau <pierre.morrow@free.fr>
Subject: Re: [Nouveau] [PATCH mesa 3/3] nouveau: Add support for
 clover / OpenCL kernel input parameters
Date: Thu, 10 Mar 2016 17:13:46 +0100
Message-ID: <20160310161346.GB1073@pmoreau.org>
References: <1457622887-19328-1-git-send-email-hdegoede@redhat.com>
 <1457622887-19328-4-git-send-email-hdegoede@redhat.com>
 <CAKb7UvhNCiRQ6XXfVNzS3WkE+Bf4x4w-Bv2JfYm5-owUrEKoLw@mail.gmail.com>
 <56E19271.7070704@gmail.com> <20160310160301.GA1073@pmoreau.org>
 <CAKb7UvgqGS4KWTEiR21AiagBLx+zP2R00eZSWAv0004MpW+tfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0047604997=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvgqGS4KWTEiR21AiagBLx+zP2R00eZSWAv0004MpW+tfA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org


--===============0047604997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:05 AM - Mar 10 2016, Ilia Mirkin wrote:
> On Thu, Mar 10, 2016 at 11:03 AM, Pierre Moreau <pierre.morrow@free.fr> w=
rote:
> > You might want to increment the address by at least
> > `info->prop.cp.inputOffset`, and if inputs still end up in shared on Te=
sla,
>=20
> There's a cp.sharedOffset just for that :) However it doesn't appear
> to get set anywhere...

Oh really?! I completely missed that one=E2=80=A6 Well, I have some changes=
 to make on
my own code then! :-D Thanks for pointing that out!

Pierre


> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW4Z0vAAoJEI7uMhYTPh3w97UP/2gzTdlkHRLYHK1xJT1lF/at
tOmB/OQ3ZPIHTP0bze0TFTjOU2+Vrg+aJnZw1xopJyCAGXTgF31YPjSeKrj+utRg
Nd0rs2gao7L///bgRvEtb3uHQVTqPcze65jP3hleIxI2tOi7r0qHJS/8HAsq7bUA
Twpw5u09CxaONCbNZFRaUKxusQwQWG+0K9L4ofiNpl/fYjSErUKGf5+ygI/+non7
7ybVFZ2SkigYUrFLykU2mbS8ktZ1IUdAtItIuCuBSuXwPx404aqHru5roaHIrGgD
lR1avosW61DgnSGgxcncchXH35GOY/8TtBIh2HXzauWkdcF/OtyLKbAPQCVk0L/p
XELmO8UoZjVewFHuDeI1ozP4pWwsyXKOxYCZLMsMEefNYezYdEFlWb65r8fxSiLx
/uTFkOuQ5Y/vVh+HE8MyhTUquY89KBSDQcRYAAEPCnAJtCXIJZDL+2XdUUAwtTWA
B2Q5OZRqe0oA1LVRxbzfHY6gLWLNAk4Sy+XCjx1ffpUjmgVtr2s+16SH+ohBq60W
KazC7VJP4mYJY2m7ZUqXv//7C/h0TZsQlpuRtOR7X1PFc2HhXMpn51mFOtYxgUXg
MdCw5p8CQUvFCw3CzdPe71PE36eqi2DBJrCKA+krm/chVB1BIMRSlVJzK9v8/oAB
XNdrXlW8DfFqwLH+kNUx
=TI8j
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--

--===============0047604997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==

--===============0047604997==--
