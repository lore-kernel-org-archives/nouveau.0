From: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.9
Date: Tue, 30 Jul 2013 15:36:57 +1000
Message-ID: <1375162617-32602-1-git-send-email-airlied@redhat.com>
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

This release adds NVF0 support along with XV speedups,
and reverse optimus fixes for use with new X server.

Ben Skeggs (1):
      nvf0: implement EXA and XVideo acceleration

Dave Airlie (4):
      drmmode: add support for multi-screen reverse optimus
      fix make distcheck.
      nouveau: fix crash when xinerama is enabled.
      bump to 1.0.9 for release

Ilia Mirkin (3):
      xv: fix last pixel for big-endian machines in YV12 -> NV12 conversion
      xv: speed up YV12 -> NV12 conversion using SSE2 if available
      nouveau: use uppercase for chipset name

Maarten Lankhorst (1):
      fixup the dri2 check

Sven Joachim (1):
      Link against libdrm

git tag: xf86-video-nouveau-1.0.9

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.9.tar.bz2
MD5:  8b2c0df5de3929597ade8c5ddb489a44  xf86-video-nouveau-1.0.9.tar.bz2
SHA1: 93b5bc69010ab51561622f834daf8eadc5d56a6e  xf86-video-nouveau-1.0.9.tar.bz2
SHA256: b247c800e532fad1c80a5666d8ca0d4e5712064b6d7a3b030b32206a8de04482  xf86-video-nouveau-1.0.9.tar.bz2

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.9.tar.gz
MD5:  223b2d899b2fd8dca11c8829d042594e  xf86-video-nouveau-1.0.9.tar.gz
SHA1: 398de35736c8a91b853ba95040b247a1ebdee279  xf86-video-nouveau-1.0.9.tar.gz
SHA256: 3322ad729d706a4a4f37f1b59063e4efc561b997286d1823b0a3a55dc57f9af4  xf86-video-nouveau-1.0.9.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJR91DiAAoJEAx081l5xIa+bmUQAIgwSNawKyN7+4x9c17l54Dl
LJUENyWzH9elfXG82frp3S00ApXFyEiN7CPKcrkg8Yew6aACK+SNGxTCNnURN4i9
xpuFyLeVZRoVOHzF8D5PJ/4pBEzUU3/U8Vrbwtzjs8xYTF/00lWQtji6TpHZ38D5
sRF534xI8EypoPcyk27Divcg9xyBI8MOFSONYm+p8Fv2IfVxWtg0qeg8rRLmAWeb
5zJu3pvWIsC5LQz/1DkEaqJAXAe8brBpjVmDizKYYOiZLsAVmvsOh7MRw4j2upv8
iH+D0qiZgkgzwPHvrfBJTEr16ve01cN6DBNhspEJJCA878KhIiPS96WabluH1Rgo
Yw3omd8bMfVN7qtt3RQiXskXOX8FmsdeJGUyRqTSP6dZHzFNkKyzBV0p8OTJkgxL
IY7bOLJNUS0bjiDavtyQHxtPFMDWOwf5xbEzxj058DeFDyyv0gg/zZxL9S9J9aD/
v4P219x4JOBIlhyceOZTF1ruoI2HABV6G1deoG8WzaElDh9M3NtOH/Qqibx1nPFX
fvJBFkCWPHWfiTCOMSXzlAsz4KKRbkJdY+pDKdQdPIcK9EazY0RwZ1AjOy/2uoe5
AWCKtjPLYNdX/jsSVmzqRdgPm86BbCS83It2FYs+lbXiuF7TCjZgehebOx/WOvlz
KBaeEURN/ftD/rTaUZT8
=BtMe
-----END PGP SIGNATURE-----
