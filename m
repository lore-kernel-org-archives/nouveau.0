From: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.6
Date: Mon,  7 Jan 2013 14:17:15 +1000
Message-ID: <1357532235-20315-1-git-send-email-airlied@redhat.com>
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


1.0.6 release of nouveau, fixes some misrendering on rendercheck, and
edid.

Ben Skeggs (2):
      nvc0-/exa: fix typo which caused breakage in rendercheck tmcoords test
      bump to 1.0.5

Dave Airlie (2):
      nouveau: fix dirty redisplay damage handling
      bump to 1.0.6

Emil Velikov (1):
      kms: Let the server know if we got more than 1 EDID block

Marcin Slusarz (1):
      add some missing newlines in error messages

git tag: xf86-video-nouveau-1.0.6

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.6.tar.bz2
MD5:  140e819c983fc01ed7a52d915dcffd74  xf86-video-nouveau-1.0.6.tar.bz2
SHA1: 602f47934f303e5b93ac25d91987d7519c6d80ab  xf86-video-nouveau-1.0.6.tar.bz2
SHA256: e3e1522d08134da74cb1796e8863fd3ad3caad9eb5e9d27f4cee3dfa7c75341f  xf86-video-nouveau-1.0.6.tar.bz2

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.6.tar.gz
MD5:  9787ce13569d20bf5302d0a7ad27e3ed  xf86-video-nouveau-1.0.6.tar.gz
SHA1: 86feffc53af5e7ea45a93498c88cd07fac1e6059  xf86-video-nouveau-1.0.6.tar.gz
SHA256: 8ae09090ebeb914a63697a5789848fdcc1d58ff6611fe6654e0941499b7936e6  xf86-video-nouveau-1.0.6.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ6kwgAAoJEAx081l5xIa+ut8P/Rvurb7CPEgq0kkUie6u1PLM
5E5gJtXVsJp0kk2a7T5tclSlODSjWqe2AJ2O9eNKcPeeEGV78fF14Rn3YGPSzLpD
cnQMoX3AELH3xn9+T9D2I1l5L6Qklnd2JN+YGhwJCW5S/rE8UkgbzYNZMOWiU5dz
+jdvRpjww5AzVBLgBkVm8V4OFV2r0gsAInI9ctlV1T4Ohz7aLhINfVw27cgi8tUX
w7YCfGWCbCC4+iGNY+63+uOJMy99LykmuKjRy+BajNfnaWc2bpPXBxE5h2SvWhKF
QW+CzG2o8L9k2rEL5DTDaSgfNtXN6TY8XB0TgrMdagvQWt0z2X9LmdnKHUKD0ySa
qjquE/kXdqGHBHfNKZNbJ3ZEOsGjrA9L79UUtd2U2BOSOl8B4Yevgp0L3QnpLlvA
cQWk0ClGcjEfZzsMEZE4EMXVj3ZIlwIq3YK+g87jFxmLPCp8FW7MHAkrAUK0sEqN
S+us9+ruEDq9ze2Vx9eSYIOy0o3IrDsTar+m22A4TJyv5zLVMu/5itye/IB6ccBN
KiOnRypxU83+sYYCzZOVSzvHYwRq1OMFu6RKk6/sHMepALYP8AdsrxJZbtjUIvZF
YhOfJPdK8lW7V16hI21EioM95F+NyYi2HasILhBqWD7lsv/UdXBPQMnbUTEC8xAd
oUPy08h5jd5o3b1wJfWT
=hrXe
-----END PGP SIGNATURE-----
