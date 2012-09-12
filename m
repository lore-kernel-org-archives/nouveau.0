From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.2
Date: Wed, 12 Sep 2012 14:03:25 +0200
Message-ID: <50507A0D.1000500@canonical.com>
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
To: xorg-announce-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: xorg-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam Jackson (2):
      Implement ->driverFunc
      Remove vbe and int10 includes

Ben Skeggs (2):
      nv40/exa: fix shaders on big-endian machines
      nvc0/nve0: support sync-to-vblank if kernel is new enough

Dave Airlie (5):
      nouveau: add platform bus support
      nouveau/exa: add support for shared pixmaps.
      nouveau: add pixmap tracking/updating support.
      nouveau/dri2: add support for DRI2 offload
      nouveau: enable provider/capabilities

Maarten Lankhorst (1):
      bump version to 1.0.2

http://nouveau.freedesktop.org/release/xf86-video-nouveau-1.0.2.tar.bz2
git tag: xf86-video-nouveau-1.0.2
MD5:  31e310c9e9c9a043307462277a6aad61
SHA1: 8f89db34187e3476c22de85fa5156a4296241b52
SHA256: 765731c2a91d434d4360517a128d18af70b158f727e49813f1a42e26cccbc45d
  xf86-video-nouveau-1.0.2.tar.bz2

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJQUHnnAAoJEEZcLh1V4OjG1OAIAKhlRsga8N6N3jp0PltyiygN
ffFTb1CmT8CIxwosxkPgW2mDJum27GZaw1PlQVJ4bsiuNHJY7suySBONUzw2d7dL
O0vQVbyAfdV2KSIx3woxnpIakS1JCiwKAstKy495bEvBuL+oRZMcBz36G+fmDVmE
LclluTomAisJowRFlMXDMNMjOUuxPMy7im0cIGcvDQYuVfI3nARx56w7bo0mkr6G
U66wffDD36riDiPTMUDdZjcedyLVBAI8f2IPDc/p36on9ESjw5ue8P/WGdfASiyp
hr8E7IJKmmP4rwM/nVmmMWtAt16zn4O7zuQBmRwuEWIV2wPVdzkwkB62TCPSIDE=
=6xZG
-----END PGP SIGNATURE-----
