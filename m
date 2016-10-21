From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: NVAC "No Signal"
Date: Fri, 21 Oct 2016 10:56:26 +0200
Message-ID: <20161021085626.uoo33n6dvbkygwrg@pmoreau.org>
References: <1de93d48-bc1c-bab4-11c4-395bfdfba7bb@gmail.com>
 <CAEXux-ZHdmop1c8F3FGRzAa_otwVjHUsT7OCVg6ObP_dg-Pcdw@mail.gmail.com>
 <90c3d7fc-16c9-bc81-8812-a9a1e86415dc@gmail.com>
 <CAEXux-Zr9SaRgSoVGCJKGO59CNYqq1MEwTo1ib23dCD+rxebjw@mail.gmail.com>
 <1f02c18b-e472-e3bc-9302-646d20e59d46@gmail.com>
 <CAEXux-a=F+AAr--rf8Dk_Cekcfk7yFF49mK4tW6MH4Xv=-2puA@mail.gmail.com>
 <07fa54e9-1a6f-de75-52ee-cc8aee96a541@gmail.com>
 <20161019175806.uqksdyiyr3dpkzu3@pmoreau.org>
 <20161020080828.GA3285@wunner.de> <20161020231507.GA3857@wunner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0333304791=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161020231507.GA3857-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0333304791==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rzws2bbifmhsrnzc"
Content-Disposition: inline


--rzws2bbifmhsrnzc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01:15 am - Oct 21 2016, Lukas Wunner wrote:
> On Thu, Oct 20, 2016 at 10:08:28AM +0200, Lukas Wunner wrote:
> > On Wed, Oct 19, 2016 at 07:58:06PM +0200, Pierre Moreau wrote:
> > > For example, my laptop (which also has an NVAC) has been triggering t=
he
> > > no-signal message on external monitors way before Ben???s patch lande=
d,
> > > but only for some adapters. I haven???t tried Ben???s patch yet, nor
> > > yours, but I will certainly do it, and see what effect each of them h=
as.
> >=20
> > The external DP port on your MBP5,3 is switchable between GPUs and
> > the apple-gmux driver switches it in unison with the panel.  Thus
> > the NVAC cannot drive external displays when gmux is switched to
> > the MCP79.  (You probably were aware of this, just wanted to mention
>       ^^^^^
> I meant G96, sorry I mixed it up.
>=20
> Lukas

Yes, that bit had stayed in my memory, that switching between the two GPUs
would not only switch them for the laptop screen, but for the external ones=
 as
well. IIRC, I am getting the no signal in both cases, but I need to retest.

Pierre

>=20
> > it in case you weren't.)  (In theory we could change vga_switcheroo
> > and apple-gmux to support switching the panel and the external port
> > separately rather than in unison if there is demand.  It's only
> > supported on MBPs introduced from 2008 to 2010 though, the 2011+
> > models can only drive external ports with the discrete GPU.)

--rzws2bbifmhsrnzc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYCdg1AAoJEK9AXpC17PcjrLUP/1jnm3zWFo+Q9sxsmOJKt7bB
QFwoo3Hf4iv+r8DvTXEETcq78MOpn/GlX8r9GwTzutMSBSD2OMYtB4uUPfFkFIbo
cws4FMtABMIUvRyw532ot8rkVtmE+HceWcP5NybipvjRyKC4HUD6fGmqosYIeyoP
vTyiHT8QvsEKd1jlmrhGgz9ZVHYIEcPo5hjt3DWWmF63nX/a8McDIP5Rw2TwYv5S
yQbwo1v59xBSWfkyZWqNaOunwWsxLn2pGkixL8X8D+VdGGRhO+/b7iTKIxEyhax+
LF86DoliH+cZOeyhXd4nQJJSAW5ArMYvgOXl3OMmMXlwLyyjJvXNzo+NH4XQ+FaV
Um1RfygwzUrIUgr88y11ExBosr2KJ5R3Niz/jJu98rQGtZ1k9+M940nbelmu5kVj
kMHZpAQqUxrGnN2YRfzi6eG1atsKKAYcC5WvHzj0llR+904eaJM5XgoqAj2y05Qr
TbvHzOORf5QwT6jKryumeZ5IILeSaWPll5MdIB1AnKQlvRYeljZwV6t71OzS4a2q
A997bbK8+j6+v4CWqpTN4sow4v50BGPyYnKJlM/3jKw69pkzNLd2/O8I3eI3sES5
3PUkcP6havgUvWsxMNcQQa12J3Fk/ZkCmToElFFpZzOk6HSSXbJ+KHEodxi+M1j8
QRrsfAgAxVgoMknPa2RC
=A+RU
-----END PGP SIGNATURE-----

--rzws2bbifmhsrnzc--

--===============0333304791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0333304791==--
