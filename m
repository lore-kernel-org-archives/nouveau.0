From: Stratos Psomadakis <psomas@ece.ntua.gr>
Subject: nouveau_pm.c: Build error
Date: Mon, 11 Apr 2011 16:22:30 +0300
Message-ID: <4DA30096.1070404@ece.ntua.gr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig316FE0E93B62F7E76B40C37B"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig316FE0E93B62F7E76B40C37B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

In nouveau_pm.c, in the function nouveau_pm_acpi_event(), there's no
check for CONFIG_POWER_SUPPLY.

If CONFIG_POWER_SUPPLY is set to either n or m, the
power_supply_is_system_supplied() is 'missing' and there's a build error.=


One solution is to add an #ifdef CONFIG_POWER_SUPPLY along with the
#ifdef CONFIG_ACPI before the function.

--=20
Stratos Psomadakis
<psomas@ece.ntua.gr>



--------------enig316FE0E93B62F7E76B40C37B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2jAJkACgkQid1lVeNDMmBxawCeMImAAaWmMbe9x3/oVjKZzChY
ex4An3XXFBOjMXh0YFmcMMoVMv0KAeOT
=S07X
-----END PGP SIGNATURE-----

--------------enig316FE0E93B62F7E76B40C37B--
