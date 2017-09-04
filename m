From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: Power Management under Nouveau
Date: Mon, 4 Sep 2017 14:52:43 +0200
Message-ID: <20170904125243.pkrq3kdrktubz2zk@pmoreau.org>
References: <24cb0e46-3fa0-b6f9-1bdc-6b88fd4c2ced@matos-sorge.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2035391939=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <24cb0e46-3fa0-b6f9-1bdc-6b88fd4c2ced-dvLnIFN4ijfbeXlDLKSl0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Paulo Matos <paulo-dvLnIFN4ijfbeXlDLKSl0A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2035391939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozxngm7opejnf4zc"
Content-Disposition: inline


--ozxngm7opejnf4zc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Paulo,

Power management is made of different things:

* reclocking the memory and the engines: this is supported on some Tesla ca=
rds
  (>G92), all Kepler ones and on the first generation of Maxwell (GM10x). In
  that regard, the Arch Linux wiki is right, as Pascal cards do not support
  reclocking.

* power- and clock-gating: there=E2=80=99s some ongoing work for it, but no=
ne of the
  cards have upstream support for it.

* automatically suspending the card when it is not used (only for Optimus
  setups): this should work for most laptops (except for MacBooks). This is
  what the Fedora wiki is referring to.

There is also adjusting the voltage, changing the fan speed, and probably a=
 few
others.

> there's no DONE stamp on the Power management row. Is this up-to-date?

I think so, as power- and clock gating are not supported yet, power managem=
ent
support is not done yet. But the [power management feature matrix][1] seems=
 to
be a bit out-of-date.

Cheers,
Pierre

[1]: https://nouveau.freedesktop.org/wiki/PowerManagement/

--ozxngm7opejnf4zc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlmtTJgACgkQU3l4X80+
KSSZxw/9EhPJZG8LLC1yOXk8irySl5mz+Tx6rj0FCEjaBNB9HkumJ5ojLu9vDelb
mSsQGt5+59PSwksc+1JhBFXQgJ/BHzLY8MeaVzL87PY/GHk8r5e3O3Wi6EaTbJdB
IHRCzGvSh9OrSfTIA5aZ2+W0K2l0GghVS+TTTeBWRlDuy8J7iG+RxMbljL5qCQnC
sf8dtMWmbjePEYaDZS3BQ7rfipUmRbCtjiE+l401uR8XpcZqCbxdBaflJb6IrPjh
LZ5MI4PQQ46x20l374YrvEzz7UGGYtYC0jr9pl+UBDClsMWCpNjYvAleliQExs1b
I77xwxEhgN4HNK0O3intDOxsfjQwiHxZAL8qAJzYq0tI3SnVbbF1b+1Dw1wjICNB
pLp/tcrpiZ7IWCO0I135dAQ2FJk6ghM4oNPp9Znd926ygoyjZC7otVYpAXhmdO1E
YkoxxQW6frlA8nDYwQ6oVKYm+4BwihxYAmNmjNgwu3Kt+P1ypCf1pgC1ypdAvUJr
GJZzhdCABiQ4nIb33zzPLdxWrmmIHeK8klRmTEpYJlHNuM5I6gMx2d6YbSzW4XCC
UcJEM3Qr0ausvhxllcav5pRD4Vb5Q5Ks7Hy6kQ51n7yKKjVjInEwl7jkdC/QHt96
tlcMBUy3MPwin6m084+WYrUvCQ1fLdkBMD+cKaR+zFfRThq9nB0=
=uQv+
-----END PGP SIGNATURE-----

--ozxngm7opejnf4zc--

--===============2035391939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2035391939==--
