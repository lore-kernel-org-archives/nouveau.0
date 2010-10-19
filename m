From: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: NV50 backlight brightness
Date: Tue, 19 Oct 2010 11:10:30 +0200
Message-ID: <20101019091030.GA28588@aeneby.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929821462=="
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


--===============1929821462==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The NV50 codepath in nouveau_backlight.c invariably sets max_brightness to 1025, regardless of the chipset in question. The maximum brightness is not 1025 for all NV50 chipsets (for example, by setting the brightness via ACPI controls and peeking the brightness register, I find that the maximum brightness level for my a8 card is 0x4001df67 although I am unsure of the significance of the MSB).

This means when anything manipulates the backlight using nouveau controls (in my case, usually g-p-m), I get very low backlight brightnesses. 2 questions:

1) Is this a known problem, and has it been looked at before? My affected laptop is a ThinkPad and I know that some Macbooks are also affected, so I would be surprised if it isn't fairly common.

2) In the absence of a reliable way to determine a card's max_brightness by peeking registers or similar, is some kind of mapping table in the code an acceptable solution for assigning max_brightness values to certain chipsets?

This has been discussed at some length on the RedHat bugzilla here:
https://bugzilla.redhat.com/show_bug.cgi?id=625171

Cheers,
Aaron

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJMvWCFAAoJECw8YUUfeQL9uqgH/RTsjej3etSP8E3E41Dsr+S0
c8OxM253skUeAheolxSbCIU6UYw7HUtp3JCaOjHpUI4SPl6ieFE+JwELpmcphwdA
CY2NLVtkkIAvfZBjh3/m8WUSxTVEn8rZo8KsftDRwrwUj6JmTE32YtsU7/54B1CJ
YIT4NwPAUNndu25jmdJXgmmZKC+fsnhn/O8ybzujZperdjXK7g0pzwORirROOegW
+QroqTvPSI/9i3GO8C1ugdMvQZLXMWzFKOY3WHBxmlBmw+4a07SvMSv3AsJetxo8
1ALqEvgg9jFz3n8O4kC+arHEG3BlWIguPd57rVADrAS0fRYxGvsGNZZjzJrUDQg=
=RRd5
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============1929821462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1929821462==--
