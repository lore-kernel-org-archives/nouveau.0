From: =?utf-8?q?K=C4=81rlis_Repsons?= <k@11.lv>
Subject: 2 cards in, but work only separately
Date: Sat, 31 Jul 2010 22:08:23 +0000
Message-ID: <201007312208.33260.k@11.lv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1214541161=="
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

--===============1214541161==
Content-Type: multipart/signed;
  boundary="nextPart1791357.E41NTGnArr";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1791357.E41NTGnArr
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi list,
my thanks to developers of nouveau first: I wonder how you put it together =
this=20
far, where there's quite enough to appreciate!

This question I have: strangely I can get each of 2 cards to work separatel=
y=20
for a dualseat PC by toggling on/off fbcon=3Dmap: kernel option (compiled w=
ith=20
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY) -- by doing so I can have each c=
ard=20
initialized and start it's Xorg, all welll, but can't have both cards=20
initialized (and thus used) -- why?

In very short, this is what my dmesg says:
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
nouveau 0000:04:00.0: enabling device (0000 -> 0002)
nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:04:00.0: PCI INT A disabled
nouveau: probe of 0000:04:00.0 failed with error -12

0000:01 is address of one card, 0000:04 of the other. What happens is that =
one=20
of cards will fail to be initialized (in one case 01, other time 04). So is=
=20
that supposed to be that way currently or I missed to pass some parameters =
or=20
bug, or..? What more should I post here if anyone interested in this?

--nextPart1791357.E41NTGnArr
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxUnuEACgkQHuSu329e3GHduQCg536Y1UuULU0nATmtBFD1AtU7
oJ4AoKq1oDzUfNHnFpz915jFtZ2q02Ky
=yZ4e
-----END PGP SIGNATURE-----

--nextPart1791357.E41NTGnArr--

--===============1214541161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1214541161==--
