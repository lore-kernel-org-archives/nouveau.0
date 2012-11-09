From: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: xf86-video-nouveau 1.0.4
Date: Fri,  9 Nov 2012 12:44:35 +1000
Message-ID: <1352429075-3325-1-git-send-email-airlied@redhat.com>
Reply-To: xorg-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-announce-bounces+gcfxa-xorg-announce=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-announce>,
	<mailto:xorg-announce-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-announce>
List-Post: <mailto:xorg-announce-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-announce-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-announce>,
	<mailto:xorg-announce-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-announce-bounces+gcfxa-xorg-announce=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-announce-bounces+gcfxa-xorg-announce=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: xorg-announce-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Release to fix Zaphod mode, a rendering regression, and drop some
old DRI interface usage.

Ben Skeggs (1):
      bump version to 1.0.4

Dave Airlie (3):
      nouveau: fix regression in virtualbox drawing hopefully.
      nouveau: drop DRI1 device open interface.
      nouveau: drop unused nv private members.

Emil Velikov (4):
      nouveau: Remove unneeded xf86GetEntityInfo()
      nouveau: introduce NVInitScrn()
      nouveau: Factor out common code to NVHasKMS()
      nouveau: NVPlatformProbe, handle shareable entities

git tag: xf86-video-nouveau-1.0.4

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.4.tar.bz2
MD5:  cff61597d94a06ddf73c32439437513f  xf86-video-nouveau-1.0.4.tar.bz2
SHA1: 68d4aa7269f3570938698f6a08b2640626193ea6  xf86-video-nouveau-1.0.4.tar.bz2
SHA256: 1a8290489cf4f48d2094a541ec9a6b68beb80299741d047e322e650c30ceb7c1  xf86-video-nouveau-1.0.4.tar.bz2

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.4.tar.gz
MD5:  eb58486f3032ff9272cf98a42d1ba643  xf86-video-nouveau-1.0.4.tar.gz
SHA1: 4b32945f6c5c0d516dee8cfc55e19c4d36be4786  xf86-video-nouveau-1.0.4.tar.gz
SHA256: ce19830a90124a196f4f630ec6f785466c3a374192645c36801da325a0ff7d19  xf86-video-nouveau-1.0.4.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQIcBAEBAgAGBQJQnG3kAAoJEAx081l5xIa+YlAP/1DFBXee4NBpF1CdpdvgAThS
8AwlhMKHa3qJqpq12pcIH5eRQhWhArFN8klwVSjqEKfvKLKaAjf/7FgAaG4JZidE
0/7lpMphKXIgSe+4PP0Lar1Z65S621nSZ4eWrxCZLzLE8E2BlfIPji9ZIcvLEN3c
9cgMmRZBZJENh4SX6yVJvM2+T6vyhcMLCI+NxHaEHHHCwI66GuoN0/lgeVm5gAp0
o5vcIwhtfgOZmsxitNa52FU9bDm+KXK5/Mm5ak7al6o8GFsxj1JKFERc3vm5FcTD
oQxUC0BxrTm2NHbFu3qHk4uh+HQvGdUx3zIKbhj1ragaYmm11bkT3MjfdUDY2CJp
Q+F8FYy4WzNPh8Km+8U/e3l6mnmPwcGcuzgwvu3dfr39osgkqAZx6VF4TEGoHniW
osr0Ktp/d2seRYKBrAh2ggntpjl7DXOERl8bISZT52nu1SQN7jbiWPThho5TUdSf
nsOw2X/I7x9mJdw6viwgMl4OkBcMHRnmuwpCjz7vSRI5dFu8UAgttLIoj2y5CHZT
anmLj9QiLWSRm89po/rmc/8cUEhVsUcDd9olPvg4r64Cl1b4qQRmhdH4+4+1HbrU
gREn4mJOZqlzubRO8d349dS+Uq9mKn/XfHGIcGUFLY2YXbvXdkBBcQoO9xV2VwSV
DgFhOlIkREh2DjbfYc0q
=MEms
-----END PGP SIGNATURE-----
