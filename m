From: Jan Kiszka <jan.kiszka-S0/GAf8tV78@public.gmane.org>
Subject: Low power operational mode of nv50
Date: Sat, 22 Jan 2011 12:13:26 +0100
Message-ID: <4D3ABBD6.1070509@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0324708086=="
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
--===============0324708086==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig474433803E0EE19E120FD502"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig474433803E0EE19E120FD502
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

what are the missing bits to get nv50-class hardware into lowest power
mode? Even when clocking down to perflvl 0, the GPU temperature of my
Quadro FX 880M is still quickly climbing until it reaches 60 =B0C and the=

fan goes on for a while (I tried up to 2.6.38-rc1 so far - any progress
in nouveau-next?). This is not only annoying but also sucking several
watts more than what is feasible - unfortunate for mobile operation.

The benchmark is still the blob which runs the card at level 0 around 54
=B0C, and that means fan-less. But as the blob is causing increasing
troubles across suspend/resume, not to speak of all its other
limitations. So I'd rather like to switch ASAP now.

What may cause this different power consumption? As the clocking is
apparently the same (the blob even claims to use a few more MHz), I was
wondering if the less sophisticated firmware of nouveau could be the
reason. Or is the host driver keeping the GPU too busy even in idle state=
?

Is there anything I could do to help analyzing or even resolving this iss=
ue?

Thanks,
Jan



--------------enig474433803E0EE19E120FD502
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk06u9YACgkQitSsb3rl5xRKWgCdHpuSDScKM7lbJjeqIkqDozac
DmwAn0UtEWT0knaKmpFVcZHGgcJU0g50
=+KTg
-----END PGP SIGNATURE-----

--------------enig474433803E0EE19E120FD502--

--===============0324708086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0324708086==--
