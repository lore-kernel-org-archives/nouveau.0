From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/2] nouveau/bl: Assign different names to
 interfaces
Date: Sat, 16 Apr 2016 19:05:17 +0200
Message-ID: <20160416170517.GA807@pmoreau.org>
References: <1460732242-4161-1-git-send-email-pierre.morrow@free.fr>
 <CAKb7Uvg3OxWuooJ=otSb1N_yRr1VcVgvH4K0DDy1zzDs9js4CA@mail.gmail.com>
 <20160415152212.GA1697@Thessia.alltele.se>
 <CAKb7UviwNACmbjk-TpMzUKhvFO8ES+7fqn6UBvzJA_S-WYb96Q@mail.gmail.com>
 <CAJnVJep-31cBSnJkDO4cNUPpVHvaSs=bx1pCpO01=DoTp+st=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0970071767=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAJnVJep-31cBSnJkDO4cNUPpVHvaSs=bx1pCpO01=DoTp+st=g@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nick Tenney <nick.tenney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0970071767==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02:40 PM - Apr 15 2016, Nick Tenney wrote:
> On Fri, Apr 15, 2016 at 11:25 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrot=
e:
>=20
> > On Fri, Apr 15, 2016 at 11:22 AM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> > wrote:
> > > On 11:06 AM - Apr 15 2016, Ilia Mirkin wrote:
> > >> On Fri, Apr 15, 2016 at 10:57 AM, Pierre Moreau <pierre.morrow@free.=
fr>
> > wrote:
> > >> > Currently, every backlight interface created by Nouveau uses the s=
ame
> > name,
> > >> > nv_backlight. This leads to a sysfs warning as it tries to create =
an
> > already
> > >> > existing folder. This patch adds a incremented number to the name,
> > but keeps
> > >> > the initial name as nv_backlight, to avoid possibly breaking
> > userspace; the
> > >> > second interface will be named nv_backlight1, and so on.
> > >> >
> > >> > Fixes: fdo#86539
> >
>  I believe Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D86539=
 is
> the preferred format. I think this is picked up by the mesa release scrip=
ts
> or some such.

Ack=E2=80=99ed. I=E2=80=99ll fix that in the v2.

Thanks!
Pierre

>=20
> > >> > Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> > >> > ---
> > >> >  drm/nouveau/nouveau_backlight.c | 35
> > +++++++++++++++++++++++++++++++++--
> > >> >  1 file changed, 33 insertions(+), 2 deletions(-)
> > >> >
> > >> > diff --git a/drm/nouveau/nouveau_backlight.c
> > b/drm/nouveau/nouveau_backlight.c
> > >> > index 89eb460..914e2cb 100644
> > >> > --- a/drm/nouveau/nouveau_backlight.c
> > >> > +++ b/drm/nouveau/nouveau_backlight.c
> > >> > @@ -36,6 +36,10 @@
> > >> >  #include "nouveau_reg.h"
> > >> >  #include "nouveau_encoder.h"
> > >> >
> > >> > +static atomic_t bl_interfaces_nb =3D { 0 };
> > >>
> > >> static data is initialized to 0, this should be unnecessary.
> > >
> > > I didn=E2=80=99t know that. But on the other hand, I like having it e=
xplicit,
> > and it
> > > should not add any overhead.
> >
> > It increases the size of the object file. I believe it's kernel policy
> > to avoid static initializations to 0. (Note that this doesn't hold in
> > regular user applications, just the kernel.)
> >
> >   -ilia
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >

> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAABCgAGBQJXEnDFAAoJEI7uMhYTPh3wIPsP+NocIUIic7aJCy4dY2GPzvZ7
NsXHq99epTKfdmTJM/F8hQ9z8L2F3g8td4Re24P02y7B8NO6SKBzx+DBkYtwVKRn
rFycJLXdd9WM3ohWdeJh9SMrx8jow0t2+th6EPcmulxjkVAYv8Lrd9ZatstJum7f
tqhsgSHw8145guQfWK0fsX4jSXsRB12ZMgjCdlTH5RRZSi1ZYiNzBXYTZL7NbjAi
PFqE81HsSLKnbzNBCsDQB85Nb8+tt4g+mOE6WO/AB+YtDHw+EM9MWyslld4EcEQc
wzXQa3XjlHxCtAA91xggn9bC22Y5BcRv944TJ3P3Jlhmj3/KU5sgv5FZWlU4RPvJ
ABv8X49byHnE/4dcX2xnGFgcMmrX14+J4cwtYWa3lU6i41EKpFFT9bFgwD9koog5
eLnzuA79YCBBRp42MVKQ0jcI9JpNzwvTcMSOKdIv38gS5SLr+OPBM9IccIbtkaKf
sVFZdbmr62wZv3MJI8Qbzsc/7RDgXBl+FCXEZ0fD+/76RKFSrKHEPC+wk+jRVT59
c9eaxMMzIzovAr79pFHsqaeVgzyyQVfdzwI9AC+nAF3nGW0/6N80AmAMJ1gDz0+I
GeyqOStZ21tqAUijJN2EE4GeY8vlpd38fUZuJTAIyO0LpF0rlcHyA9BkXiEygfhI
9+FiI96lPVUkKgibXGs=
=MXHi
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

--===============0970071767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0970071767==--
