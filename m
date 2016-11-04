From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Atomic modesetting + DisplayPort MST
Date: Fri, 4 Nov 2016 19:41:21 +1000
Message-ID: <41c72634-4886-0028-93e5-317e3b437092@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1475361529=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
--===============1475361529==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NtNOBax7GDEs2xJd7vIhF9s3vCcTwqRmS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NtNOBax7GDEs2xJd7vIhF9s3vCcTwqRmS
Content-Type: multipart/mixed; boundary="6k5ap7pdabfmUEXu2L767eLEiw8e4lWoT"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <41c72634-4886-0028-93e5-317e3b437092-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Atomic modesetting + DisplayPort MST

--6k5ap7pdabfmUEXu2L767eLEiw8e4lWoT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey all,

I've just pushed out the initial Nouveau support for $subject \o/

As the atomic modesetting transition is basically a rewrite of the KMS
portion of the driver, I would be very grateful for any additional
testing that people could provide (even as simple as just booting and
making sure you get a display is valuable).

There's a Linux tree at
https://github.com/skeggsb/linux/tree/linux-4.10, and the code also
exists in my usual development tree[1] on the master branch (which is
currently based on Dave's drm-next tree for Linux 4.10).

There's another branch (devel-kms) in the same repository, which is the
same code on top of what's currently Linux 4.9.  If you have problems
with the 4.10 code, I'd definitely be interested in seeing if they exist
on the 4.9 branch too.

Thanks in advance!
Ben.

[1] https://github.com/skeggsb/nouveau


--6k5ap7pdabfmUEXu2L767eLEiw8e4lWoT--

--NtNOBax7GDEs2xJd7vIhF9s3vCcTwqRmS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYHFfDAAoJEHYLnGJQkpH7HlMQAKvfKlEK90TO/fI/7BjDXYLL
Rj0va21zqYCffS0IIID9RRg/h45xd2o9zCv4yckyqNsqc6Wnb5UV4dSBU5YPSm8S
pywbWzwrthByqH0N8RFFEPpDZxER9fhWf5Qe2rR/fKrOfJez4kj5FC86uQtLdfBq
GtXcY3AH7fIk7P3sVx3XHQAKqy5kGPCiHH5tsuCcB2ND55H7nGL4ozhoanDzrF9O
BA9qKdY2VsNVYAhu5BWAxY0D2rHr/ms0kzEvD3Uk3TgbrgSVnXL9XWgdQUl2KG/P
9I+4g7SuF3l02m5W/+nHn880iiLmOMZ7JHuRmBFTtR3lxVm5OdCuojm39IHDIKn8
u4hNdSJL+nKLYViaToDgJaas46Ybn17TskLn0f3jqCtIn/kg1aSblo3vHFcOr2fz
L0q+Szzw7o2XkxZkh2DbN2HuhOo7P1Is1EZcQniMD+acsqMIJI2vohbAc6GWSqWi
DTfk2j5tg6U6y7oqfg5xpBPN/qCnKnoygalD9pUqifmtD96arWxFaQUpgNq1J7CG
gTDwpwLWk2VCaLVpdDTlRytomc/3gZdvbKUtTeA/jHmNL0LYjW0TvScWNzsqFi3D
vhjDwiMj1ku1ScTnGM0JsKYSueFXTn7hU/bpl8/U0m2P7w7/GmYeLVYwcFj/ElkI
zbtLlwewqU04+c2mAXag
=iL9w
-----END PGP SIGNATURE-----

--NtNOBax7GDEs2xJd7vIhF9s3vCcTwqRmS--

--===============1475361529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1475361529==--
