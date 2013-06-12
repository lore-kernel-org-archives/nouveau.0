From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.8
Date: Wed, 12 Jun 2013 10:52:37 +0200
Message-ID: <1371027157-7812-1-git-send-email-maarten.lankhorst@canonical.com>
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

Ben Skeggs (5):
      nve0: explicitly ask kernel for copy2 object
      nvf0: recognise as supported chipset
      nvc0-nve0: split shader code from their headers
      nvc0-nve0: decompile shaders into their source, add basic build system
      nve0: envyas isn't overly clever.. avoid short-form instructions

Dave Airlie (2):
      nouveau: attempt to fix zaphod since dri1 code removal
      nouveau: clean up nv entity index declarations.

Emil Velikov (6):
      configure: require xorg-macros 1.8
      nouveau: stop using dri1 function DRICreatePCIBusID
      nouveau: Do not load dri {sub,}module
      dri1: purge the final references
      nouveau: mandate dri2 build
      configure: printout the configuration info

Ilia Mirkin (1):
      nouveau_xv: Avoid reading off the end of the source image on NV50+

Maarten Lankhorst (4):
      nouveau: enable support for normal optimus configuration
      fix a xfree from previous patch
      update makefiles for make distcheck
      bump to 1.0.8

Marek Vasut (1):
      nouveau: Allow 3D accelerators with output ports

git tag: xf86-video-nouveau-1.0.8

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.8.tar.bz2
MD5:  146b9afdfcb64d6b6ba0dbeaa167548e  xf86-video-nouveau-1.0.8.tar.bz2
SHA1: 881958a47e48a231bc037285371c5d4a8c8ce16a  xf86-video-nouveau-1.0.8.tar.bz2
SHA256: 9b904314b8e9c7a5800724a6a31038ed88fa3fcfd35da6f4015fc104c8283617  xf86-video-nouveau-1.0.8.tar.bz2

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.8.tar.gz
MD5:  f187614f4240417cc3153f141b4a34c3  xf86-video-nouveau-1.0.8.tar.gz
SHA1: e5bc42448d560f7a192ff905d4c2fb8a4f6c8225  xf86-video-nouveau-1.0.8.tar.gz
SHA256: 3f9c6f4b3b5ddee1742856d535826e3647ac8e327093804dbfea722136990362  xf86-video-nouveau-1.0.8.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJRuDaAAAoJEP5VjHKmcBPD6mAP/0VcESetALdHpgFZ40OmQkLJ
95EygBUM3XKm6LAytDi3ptvW14LMGmam2hg7UNGfh1WtWHNJmjFYPVGTRbEZN2YY
wPs694UKbtZGUMAobMa0i0dqICQFt6d38x7QR5U1Olp5Cs0aw9lGPNN2y0lE69/z
8BuKB+FMfeh93qLMwOw90XbTWYHZT2PkjM6QdZheR2C6x8uDgoxx6A9oty7Aaen8
lEWnJzUUqo5L6dpEhLrL3NUvwlk+2TIBW6qT0BYKlI4hssJ5nLQZ2aFb9zIsdlxL
MS0fct7rcidr/sm62/aZXhcu2FcOy0FQnUxMwUSEcUOkWIclYNdH+XoPI5lyXlc7
tdZDGVxDyfaKUTxeFPdAEf1ZC9qDUvG1a+WE7I78tWf21DxmIHgSEWy8kNOU8DZf
Yv7Ub2/EgDJ3I6tzxLkzQ815KmsysltueKVs12m8/Y9N7t9/0r8fyadmp8Wi2aF4
4U2vSKv0uSAODrrEeqmIc+jqTEV2pz52tWMBbShviNrbraLi0ev1Y0PCMm1FFAcz
MJhhI3EJjg7pIGmyTqGNbwrqQEsirXpGMQinasXwO4iw9VX78DDFQ8+Ed/dsIQRi
u5HO3gyUDJUmIKc67ilre9rK8Z47kGjYFkyQcY9X4nQfZcXaZ8GxYRyhZC4/svYt
kVh9zdaXl6O+LK7+Nrwg
=imBZ
-----END PGP SIGNATURE-----
