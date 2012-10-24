From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.3
Date: Wed, 24 Oct 2012 11:45:54 +0200
Message-ID: <5087B8D2.4020000@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: xorg-announce-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam Jackson (1):
      Remove mibstore.h

Ben Skeggs (1):
      shadowfb: fix segfault due to reading outside of shadow buffer

Dave Airlie (1):
      nouveau/dri2: fix pixmap/window offset calcs.

Maarten Lankhorst (6):
      nvc0/exa: make solid fill actually work
      remove unused members from nv_type.h
      exa: fix up download_from/upload_to screen
      exa: fix comparison in download_from_screen
      exa: remove exaMarkSync from download/upload screen
      bump version to 1.0.3

Mario Kleiner (1):
      dri2: Fix potential race and crash for swap at next vblank.

Sebastian Keller (1):
      exa: use CLAMP_TO_EDGE for RepeatPad

git tag: xf86-video-nouveau-1.0.3

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.3.tar.bz2
MD5:  b434a341cb7e0b45ef2cb0107b1fbe2d  xf86-video-nouveau-1.0.3.tar.bz2
SHA1: b53d985badb19573e659f80eb49d2334012900ea  xf86-video-nouveau-1.0.3.tar.bz2
SHA256: a2ae34046324e1ec620f5a8dee3c8fe5a295acbb5d51825604c8ad28fb75a559  xf86-video-nouveau-1.0.3.tar.bz2

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.3.tar.gz
MD5:  f37bfe1e841bb1bf1b2272647ecd3c49  xf86-video-nouveau-1.0.3.tar.gz
SHA1: 9dfde58b02cc1c9be15bf885e7eee59b4f515232  xf86-video-nouveau-1.0.3.tar.gz
SHA256: 42ccb01b6ae6bc30f81e30e3039af159454d2fa1d718e0ccd8029064261d3f35  xf86-video-nouveau-1.0.3.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJQh7OsAAoJEP5VjHKmcBPDCIYP/36Z+FVEyW1xl+N3AR/Ewpl/
YUvzTXsZyGkmFzAp7ylrOsZDvEsmo8G2i0oPTuQADszhvG3eCi2rrqaXGXk5GZSp
Ir171LKDPT+bvuo4RUiQ0AUBNRw/0QM0FWnHp8m2WEWzSOdR4hCgGUxgbFtzfgCM
VDnrcTxhlfscbww14jBGe+OPBBg46Dt7gbRZfy/Vup7Fuz7J98qE9azl/lDDOsJu
ZrKkS+BQ79HrLYuu9AgXnOuZy1N56AljvtBhedahf+OgSY6ttJpS/LVU+tc8aa9o
11xnf9AZBEG2dF8bVrK028bzm1xjR04N8pvblx2iFKq9HTXTD3wl//Tss/J0z768
tB3pFZqtT6MOSIwk6wZG9RK4FIcjGI2COnU5HTc2aZpWrI71N0hHGsot4I8R8QzZ
H5IaigY0RojfeAu72vn4+hHlzmz9zHBmMenZc4dNcA3EyxV9Np93QHgzZK1cP1p7
FDoYVnMGOCUylgRvbVmsOO3LD9unKgqv5GAEp7vO1uISiijzUxjS49KwdM2FDVjE
X9NdVnekoUVt0OWCwt1b4f5FkBatjqeAa93rJyUcAWQQb5p1+iERs6JwpEiohA1C
CYq1PKouKbwbb+4ojl2lXJLKvHhgebnKKnHi5fpYtT1yLRoEcOqx8wro7f8R5imi
OYzSYRJKnEcPAfKdcdji
=GSr4
-----END PGP SIGNATURE-----
