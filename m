From: Karol Babioch <karol-+CCwuOEMgH6ELgA04lAiVw@public.gmane.org>
Subject: Regression: Blank screen with kernel 3.4
Date: Fri, 15 Jun 2012 19:30:07 +0200
Message-ID: <4FDB711F.4070800@babioch.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0384132510=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0384132510==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE9CCD75E8845FDA4B16309AB"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE9CCD75E8845FDA4B16309AB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

there seems to be a quite serious regression in kernel 3.4, at least for
me. As soon as the nouveau module gets loaded my screen goes blank.

There is already a bug reported on this issue in your bug tracker, see
[1]. Interestingly enough I've got nearly the same laptop as the
reporter of the issue. Personally I've got a Sony VAIO VPCS12C5E. The
reporter got a VPCS11C5E. We both have a dedicated graphics card (NVIDIA
GeForce 310M). The CPU does provide its own GPU, but it is disabled,
which can't be accessed or changed within the BIOS.

It worked fine for kernels 2.6.39 up until now (3.3). I'm not quite sure
whether 2.6.38 worked, or not, but it was somewhere around this time
that it got fixed.

=46rom reading various threads, I've got the feeling that a lot of the
black/blank screen issues should be fixed with 3.4. My best guess would
be that something was changed, which introduced this kind of regression.

As there are already some logfiles provided within the bug issued in
your tracker (see [1]), I won't attach anything here. But I'm happy to
provide anything you need, of course. Just let me know.

Would be nice, to narrow this one down, as I would like to use kernel
3.4 and later at some point in the future ;).

Best regards,
Karol Babioch

[1] https://bugs.freedesktop.org/show_bug.cgi?id=3D50175


--------------enigE9CCD75E8845FDA4B16309AB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJP23EfAAoJEHSaZc1HnzIVr4kQAI4jKywOMY+ORdP2LG0MsIAE
pmuPNrS/4u38DJWsLEeuzi9/5HJ08FWRM7jZYGXYKlz2pA+BWglQcxGxuLTTOp0N
0NTaka+l8uych8/RbyVax7Vu0zXEcrxz4WmR8CDXP8gm6ecy9soAi9Xmi+8O2VNB
GMB6gcVxwkm/j5fLgQRhaYzMP5i2oZUMysSzC3PmFhjCsEBzCi/M6/doCeaYIIeg
ZYLQOVDB2dOu6HCk6zaoyy8p2P6Pcy00wiGP5rSDU3qsm2bodQJvo/wjdqkMdC/p
G+Bll+01fGVVldCGjiZNJ/Jjw+UatM7iSLdWf92XHv3H2xaSb+GDPOrT4oqD84TB
1TPqL18JQINmuT3fvgah5i2MuuiWmKX7fUdofam4yQKnadQmeFCe+2VWyjkfxqYl
0tJ3rHZ/DP2qDOQ48vmiC6NpCKSqKsiubt2OhByWeGIhyphyfanPfdQmdxmjIr6A
QlYuqzWWpsvXJLjwLSycI3MTqlyEakWX/4CMsc7s6zFWxQ8PLnUfpxmkJtEwV5jP
f3xOaAebZEeRsIPMgMriqnjpEoDktE5b9oOaE4xAHtRnRRr2f0RTWOQQkmNLks59
MUyGOhyn1TAW66ybp3+CXXmv+vjHeWDzclX5cwhadLtyWCjoFTB6lGHZPqj0shVo
JON+wAbuyDo/UoCm7ynj
=kpvI
-----END PGP SIGNATURE-----

--------------enigE9CCD75E8845FDA4B16309AB--

--===============0384132510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0384132510==--
