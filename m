From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: NVAC "No Signal"
Date: Wed, 9 Nov 2016 13:48:01 +0100
Message-ID: <20161109124801.kkbpoaynnt4jjcdm@Sovereign.localdomain>
References: <90c3d7fc-16c9-bc81-8812-a9a1e86415dc@gmail.com>
 <CAEXux-Zr9SaRgSoVGCJKGO59CNYqq1MEwTo1ib23dCD+rxebjw@mail.gmail.com>
 <1f02c18b-e472-e3bc-9302-646d20e59d46@gmail.com>
 <CAEXux-a=F+AAr--rf8Dk_Cekcfk7yFF49mK4tW6MH4Xv=-2puA@mail.gmail.com>
 <07fa54e9-1a6f-de75-52ee-cc8aee96a541@gmail.com>
 <20161019175806.uqksdyiyr3dpkzu3@pmoreau.org>
 <20161020080828.GA3285@wunner.de> <20161020231507.GA3857@wunner.de>
 <20161021085626.uoo33n6dvbkygwrg@pmoreau.org>
 <43b17bb3-7b12-b1be-c608-702ebdfd8522@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2103872960=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <43b17bb3-7b12-b1be-c608-702ebdfd8522-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============2103872960==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7jtq5izokc33j5hh"
Content-Disposition: inline


--7jtq5izokc33j5hh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I retested with both 4.8.4, Ben=E2=80=99s linux-4.9 and linux-4.10 branches=
 (so only
the linux-4.10 branch had the atomic+MST patches).
For all branches, if I bootplug the external screen, I get nothing on the
external screen, and the laptop screen is frozen with some mix of images (b=
ut
the laptop itself is not locked up), nothing in dmesg. If I hotplug the scr=
een,
the laptop screen is not frozen, but starting with linux-4.10, I get an EVO
timeout when turning off the external monitor. Adding your patch did not ch=
ange
anything for me.
Looks like I=E2=80=99ll need to spend some more time testing and bisecting =
those
issues=E2=80=A6

Pierre

On 06:12 am - Nov 08 2016, poma wrote:
> On 21.10.2016 10:56, Pierre Moreau wrote:
> > On 01:15 am - Oct 21 2016, Lukas Wunner wrote:
> >> On Thu, Oct 20, 2016 at 10:08:28AM +0200, Lukas Wunner wrote:
> >>> On Wed, Oct 19, 2016 at 07:58:06PM +0200, Pierre Moreau wrote:
> >>>> For example, my laptop (which also has an NVAC) has been triggering =
the
> >>>> no-signal message on external monitors way before Ben???s patch land=
ed,
> >>>> but only for some adapters. I haven???t tried Ben???s patch yet, nor
> >>>> yours, but I will certainly do it, and see what effect each of them =
has.
> >>>
> >>> The external DP port on your MBP5,3 is switchable between GPUs and
> >>> the apple-gmux driver switches it in unison with the panel.  Thus
> >>> the NVAC cannot drive external displays when gmux is switched to
> >>> the MCP79.  (You probably were aware of this, just wanted to mention
> >>       ^^^^^
> >> I meant G96, sorry I mixed it up.
> >>
> >> Lukas
> >=20
> > Yes, that bit had stayed in my memory, that switching between the two G=
PUs
> > would not only switch them for the laptop screen, but for the external =
ones as
> > well. IIRC, I am getting the no signal in both cases, but I need to ret=
est.
> >=20
> > Pierre
>=20
> Any news related on your side?
>=20
>=20
>=20

--7jtq5izokc33j5hh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYIxr6AAoJEI7uMhYTPh3wSBAQAI3x5UP5K+sRwWhrK1j8SNqL
SI/KpH9r8OmqlYw2emyqgllf4F2MJGCLN1uCPNadBGTU6Ywt6NtKqeYyITyrov/D
mpCnidDcFUdoiwDupzJrU+w5cbg5tAgM03QeVbAgYDSJ9we6asWqE3jDeiCd50hq
4CSeNIhld0zvFiDi8cqQ0c1c/WWVCOxQTNrJQc45suCbdVzFvXCd2SqAGileVOyb
DfBdBZiTpqNDWZmSbe7n8505sCX4CCJY5Nvc2bmwBnlcYXl92Wywl36vowcNf9dI
rmzZG2MYIao3nI146IhyZd5tXwPJo+Vo8x0b8J/dH9E08YpRjQhhGboiIXO7IDIz
YMLENOIEmbgYdr93imcSp7Rbpp4SdQxUYAVfmcsbouFEzOVjpW8+vhRN8G9qQe90
5iGxtcP4DzRykBTEVrRQNgt22QMYYpqt6Mqc6XJLSwzqD3eWpGx7EFpiD0ubwSm8
FFnJ7/gQXwfjTMRBAjlXyeo8ABz26bNblAcR9YlpIxCNrv9f0T07QvM+FUBTqEZQ
hDaINbTRVM6zYez392nAu61EoIIUfwe17yb+p3Jn2hulGsqP3OdKAPMEspwsmDrZ
LUkj6HYss1iC+Vc5oJBdOQgwh8CqtmpfwivUWao2ywQ6DC5x8aAbtxokWObv8uNE
fSjsFZV58/6AqqTlLnG4
=oQXy
-----END PGP SIGNATURE-----

--7jtq5izokc33j5hh--

--===============2103872960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2103872960==--
