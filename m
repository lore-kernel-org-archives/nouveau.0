From: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: nouveau exposes backlight controls in presence of ACPI
Date: Fri, 29 Oct 2010 17:49:34 +0200
Message-ID: <20101029154934.GA2076@aeneby.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1025676761=="
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


--===============1025676761==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It seems to be de facto standard to only expose kernel-level backlight controls in the absence of ACPI, however nouveau does this regardless of whether ACPI equivalents are available or not. This will confuse userspace in some situations. Does this need patching or is there some reason for this behaviour?

/Aaron

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJMyu0OAAoJECw8YUUfeQL97rsIALJ7YmMdnE7vXiJz6WjS6G5T
i3EmRrZrDvpPqLxyQOyLDVdwg5AgFlOyVDAPtPvK6wU0LcXHVRverl9mBcG0kpnG
VbvreX3C3thmyTJSHchxn7EUQULB/PiI9coQRQ6mDynWrXlWcYo9NurtUStKxM7V
xm/9U/0YjTjppjOEeS+hgkkZ1Vg4xZVIFqzH7fmL+UJvOVIjDwF3d+1ZwgxWzCYr
G31AJmExqhHwwA6zBuRZ654dc8Ho540+epNs0e9d4IrMjDT+xBM9vvlO6VyLWDmp
ONv8oODaqVxTFPJaYhcuKddzBH7x7uhcZlLmzdljxwkq5n/ND2abY2JEKXU0Cfg=
=hJfM
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============1025676761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1025676761==--
