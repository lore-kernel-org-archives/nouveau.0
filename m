From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.7
Date: Wed, 27 Mar 2013 09:54:43 +0100
Message-ID: <5152B3D3.1020300@canonical.com>
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

Christoph Bumiller (1):
      dri2: fix missing frame throttle on copy_region buffer swaps

Dave Airlie (7):
      nouveau: add reverse prime support
      nouveau: create shared pixmaps in GART
      nouveau: fix regression in PRIME since 58284cf32778d54cde139423450bc33360784503
      nouveau: align shared buffers to 256
      nouveau: make prime regression fix more robust.
      nouveau: fix build on older X servers
      nouveau: fix build against old servers (part 2)

Maarten Lankhorst (2):
      Clean up some errors on closing.
      bump to 1.0.7

Marcin Slusarz (2):
      nouveau: put cursor BO in GART
      nv30/exa: fix shaders on big-endian machines

git tag: xf86-video-nouveau-1.0.7

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.7.tar.bz2
MD5:  383e398283e7bae30d6ce1617ccbd3a4  xf86-video-nouveau-1.0.7.tar.bz2
SHA1: 26b19cc96048a43a94613bc5ea82b5829ec9ca95  xf86-video-nouveau-1.0.7.tar.bz2
SHA256: d187c658e1823ca829c941f3f601f8e7220d427e079c3e52b94ecff45bc2e131  xf86-video-nouveau-1.0.7.tar.bz2

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.7.tar.gz
MD5:  916348b36ef337341fa24aab52cfc579  xf86-video-nouveau-1.0.7.tar.gz
SHA1: c2d994368ea9a01a2a51078030e87469f207a683  xf86-video-nouveau-1.0.7.tar.gz
SHA256: 588c3000b5ea2c3f91fd560bfc4c24faaf9ed7c4b56582a35e6101f00b17b2b5  xf86-video-nouveau-1.0.7.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJRUrOnAAoJEP5VjHKmcBPDepkQALx8IrYE8hDsEeZXhdJTzmy2
V4nOgIGhNT9YJOqhy7ocezZfSzeRNA3PX6qhEXmqJe/XDTMvEQqhn1OXmn7N/Xrz
Qafybjnn4L/kOZ9ZSxQNrLHtbaH6fiU20FYlI8VbDcT2iG3C3yJkyvlbkWbEItxj
j8I7zpwMUuJ1fPv6O8he8FTSPDICql8yGKjlDXECcOnkhODAXKFBcuFNBN16ZZgW
DedJJ3okelKngrkiDlpZKBwgvlm77xoztD+jyIspX/gsbyGFdwuwGxIhzzOW2cH7
FP+p3/Of+5QW/oAcNqUF8I6WKG3t9TGVh6/sbN9A7QEf5fsNgaPPbpGGvK0IwPyl
JMOtEhWkSwqaB0Kkw351sDEYhWXRuSLX1pixRho6CH7sNCIXcqkTeHnzxjCmzc9M
S0R4hUUQC7mmb7qWB3ypAG43Y+5L/efXQLjj8O8PFGUbmxCMCtEuZjeEY3JP7lAK
QsukukyV2exObX2Q5gk2zmTwjrPXEtNFshbtNKsgfQb1DRZMW5m1/I0YPywy3bJQ
u0pLVZawc2HN6XNx+SJ6j6XbMi40f++T8XOOrKWPVuqUgtz4GgelKHlOl4TQRL1W
nCB4qqllCCYQSH22+qdKTVBiLY30SzRRlnyPsz6kjA2bzPG+8Li1kU+QGQML7qXm
6h6lJeYwf90K+Dh8L5CV
=vikd
-----END PGP SIGNATURE-----
^ Look the block of numbers are here, it's completely secure! :D
