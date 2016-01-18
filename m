From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/5] nouveau: unified firmware loading
	functions
Date: Mon, 18 Jan 2016 16:26:27 +1000
Message-ID: <569C8593.3040907@redhat.com>
References: <1453097233-11838-1-git-send-email-acourbot@nvidia.com>
 <CAKb7UvjAk-HBmJuyrLewK49qo_27trCtXW+oFW7TQ74rjNHsPQ@mail.gmail.com>
 <CAAVeFu+n5H5WQgwhkPZXUP53SrGAG=e7EWmtUdTo1bNhFCgZhg@mail.gmail.com>
 <CAKb7Uvh4kyYo509BJ=nuS6_Z2TAm09v=DN4qyf=r_6-7h3m68w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0569473630=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvh4kyYo509BJ=nuS6_Z2TAm09v=DN4qyf=r_6-7h3m68w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0569473630==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6sv7O1wixwihaT9F0XHMQJ8TDp0cqeOSW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6sv7O1wixwihaT9F0XHMQJ8TDp0cqeOSW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/18/2016 04:20 PM, Ilia Mirkin wrote:
> On Mon, Jan 18, 2016 at 1:15 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>> On Mon, Jan 18, 2016 at 3:11 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wr=
ote:
>>> All the video decoding firmware was *pretty* standard... I suspect
>>> ~everyone used my extraction script and it's sitting in
>>> /lib/firmware/nouveau for everyone who uses VDPAU. There are packages=

>>> in several distributions which grab the nvidia blob, my script, and
>>> run the extraction on the end user's computer to avoid licensing
>>> complications. Please support the existing locations.
>>
>> Ok, so there *are* some end-users (not developers) relying on these
>> external firmwares?
>>
>> In that case probably the best thing to do is to not use these new
>> functions for video - at least for chips that do not require signed
>> firmware. All I'd like to do is reduce the number of occurences of the=

>> "build path - load firmware" logic.
>=20
> Yep. And FWIW there were users of pgraph firmware loading with the old
> paths too :( For some users, the blob pgraph fw is stable while
> nouveau one isn't. But hopefully not that many, I think VDPAU has a
> lot more. VDPAU is currently supported through Kepler.
I don't think it's worth supporting the soon-to-be-old gr ucode paths
going forward.  Our implementation of using the binary driver gr
firmware is pretty broken anyway (outside of Tegra), and works by
accident mostly.  I suspect most (if not all) of the issues with our
ucode have been ironed out now too, no?

There's probably a legitimate case for keeping support for the video
paths, especially since we don't know if/when/what-form nvidia will
distrubute them in.

Ben.

>=20
>   -ilia
>=20


--6sv7O1wixwihaT9F0XHMQJ8TDp0cqeOSW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWnIWbAAoJEHYLnGJQkpH76E8QAJM5XxwqEMJUvsFaxzPRL0Oe
7PMWPXJuRoRSv5LHlD3WELz7P1SwcBLg2pY0gc8PIcXfp4YUDweJsPjnwS8UH4Sx
q4tthMe2QkjqI9BPzRWo/7uXow4X8i4Oxx3pfFS3zcI41i7wvD+m49SOccYX/Iv4
bXr6/ziIAAEeEvC82dcQr1DdzsrwubNMsPGoTdrLSsXjXXiFx4L7rZ08ngvuDuku
qHdc9ohLgfu2m+pMVjIRLlH3z33IdWZVz1f1QSW5mR4/9F5hWEKOfA8PDr+DzwZS
ZGZFPv0aS9oQMBFYqlEKX4beAGvA/kpZXMoD8qJR9/eKT7B6jrpIE14Owqyq8x2y
x/a0jXViJ2fLgvH7C8g0exkDPMmRi3VCGLWojz4m/Wvusi1Wtb86IXgN02T3dfoo
5Y4+9aHvLGLLXpxNz7E+Nw8XU+8uCeIjteaQ6lyMTqPBA6WI9Aw5F4E00tuPQ/37
tO9fJV/Tkye/3CMFZC0jdV+A+fq3OtevOfyHagMC6PHAf94jlbMG+9pbdx1slNTe
on7WLVWbNWZdZ8LsSCzLjpXUg38R9fLJyhkDZIlZRsdGwoKpvCKVlCZB9hCulR8p
ePD+gIK2++Olu1SrlG+iJ7RS6JsImtwf9mZj+vfAwD+/zjTvKQvyq0tiZTX2RiBu
n8k6O2hzaLFsoA6vi6+G
=R43R
-----END PGP SIGNATURE-----

--6sv7O1wixwihaT9F0XHMQJ8TDp0cqeOSW--

--===============0569473630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0569473630==--
