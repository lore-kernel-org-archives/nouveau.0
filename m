From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 15:36:08 +0200
Message-ID: <1500039368.5763.12.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
         <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-QEsAZW81vc9tIYr3HPvB"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


--=-QEsAZW81vc9tIYr3HPvB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-07-12 at 07:37 -0400, Ilia Mirkin wrote:
> On Wed, Jul 12, 2017 at 7:25 AM, Mike Galbraith <efault@gmx.de> wrote:
> > On Wed, 2017-07-12 at 11:55 +0200, Mike Galbraith wrote:
> >> On Tue, 2017-07-11 at 14:22 -0400, Ilia Mirkin wrote:
> >> >
> >> > Some display stuff did change for 4.13 for GM20x+ boards. If it's no=
t
> >> > too much trouble, a bisect would be pretty useful.
> >>
> >> Bisection seemingly went fine, but the result is odd.
> >>
> >> e98c58e55f68f8785aebfab1f8c9a03d8de0afe1 is the first bad commit
> >
> > But it really really is bad.  Looking at gitk fork in the road leading
> > to it...
> >
> > 52d9d38c183b drm/sti:fix spelling mistake: "compoment" -> "component" -=
 good
> > e4e818cc2d7c drm: make drm_panel.h self-contained                     -=
 good
> > 9cf8f5802f39 drm: add missing declaration to drm_blend.h              -=
 good
> >
> > Before the git highway splits, all is well.  The lane with commits
> > works fine at both ends, but e98c58e55f68 is busted.  Merge arfifact?
>=20
> Hmmm... that tree does not appear to have gotten a v4.12 backmerge at
> any point. The last backmerge from Linus as far as I can tell was
> v4.11-rc7. Could be an interaction with some out-of-tree change.

Ok, a network outage gave me time to go hunting. =C2=A0Indeed it is a bad
interaction with the tree DRM merged into. =C2=A0All DRM did was to slip a
WARN_ON_ONCE() that nouveau triggers into a kernel module where such
things no longer warn, they blow the box out of the water. =C2=A0I made a
dinky testcase module (attached), and bisected to the real root....

19d436268dde95389c616bb3819da73f0a8b28a8 is the first bad commit
commit 19d436268dde95389c616bb3819da73f0a8b28a8
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Sat Feb 25 08:56:53 2017 +0100

    debug: Add _ONCE() logic to report_bug()
   =20
    Josh suggested moving the _ONCE logic inside the trap handler, using a
    bit in the bug_entry::flags field, avoiding the need for the extra
    variable.
   =20
    Sadly this only works for WARN_ON_ONCE(), since the others have
    printk() statements prior to triggering the trap.
   =20
    Still, this saves a fair amount of text and some data:
   =20
      text         data       filename
      10682460     4530992    defconfig-build/vmlinux.orig
      10665111     4530096    defconfig-build/vmlinux.patched
   =20
    Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Cc: Andy Lutomirski <luto@kernel.org>
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: Borislav Petkov <bp@alien8.de>
    Cc: Brian Gerst <brgerst@gmail.com>
    Cc: Denys Vlasenko <dvlasenk@redhat.com>
    Cc: H. Peter Anvin <hpa@zytor.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

:040000 040000 9f47f66ec4c234f6ee8e2a09e991c95fe47cf2c1 3e92aa9e77b39ed075a=
e2c3bdf041d92ef898f62 M	arch
:040000 040000 34f70b73d40c82533dd7df9b289106be69e2fa8d dd5d7248694a36b3e17=
0f2dca5d9c4121535a990 M	include
:040000 040000 f6e627b0d378f0a00d2987fdd0c7b215306e6e3c b360d4ee2579744cce5=
30184d7dab13493f73ee0 M	lib=C2=A0
--=-QEsAZW81vc9tIYr3HPvB
Content-Disposition: attachment; filename="warn_on_once.patch"
Content-Type: text/x-patch; name="warn_on_once.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

LS0tCiBrZXJuZWwvTWFrZWZpbGUgfCAgICAyICsrCiBrZXJuZWwvZm9vLmMgICAgfCAgIDE1ICsr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgotLS0gYS9r
ZXJuZWwvTWFrZWZpbGUKKysrIGIva2VybmVsL01ha2VmaWxlCkBAIC0xMTEsNiArMTExLDggQEAg
b2JqLSQoQ09ORklHX01FTUJBUlJJRVIpICs9IG1lbWJhcnJpZXIubwogCiBvYmotJChDT05GSUdf
SEFTX0lPTUVNKSArPSBtZW1yZW1hcC5vCiAKK29iai1tICs9IGZvby5vCisKICQob2JqKS9jb25m
aWdzLm86ICQob2JqKS9jb25maWdfZGF0YS5oCiAKIHRhcmdldHMgKz0gY29uZmlnX2RhdGEuZ3oK
LS0tIC9kZXYvbnVsbAorKysgYi9rZXJuZWwvZm9vLmMKQEAgLTAsMCArMSwxNSBAQAorI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2J1Zy5oPgorCitzdGF0aWMgaW50
IF9faW5pdCBmb29faW5pdCh2b2lkKQoreworCXByaW50ayhLRVJOX0lORk8gImZvbzogbW9kdWxl
IGxvYWRlZFxuIik7CisJV0FSTl9PTl9PTkNFKDEpOworCXJldHVybiAwOworfQorCitzdGF0aWMg
dm9pZCBfX2V4aXQgZm9vX2V4aXQodm9pZCkgeyB9CisKK21vZHVsZV9pbml0KGZvb19pbml0KTsK
K21vZHVsZV9leGl0KGZvb19leGl0KTsKK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsK


--=-QEsAZW81vc9tIYr3HPvB--
