From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 07/13] drm/nouveau: Drop drm_vblank_cleanup
Date: Wed, 21 Jun 2017 10:28:44 +0200
Message-ID: <20170621082850.13224-8-daniel.vetter@ffwll.ch>
References: <20170621082850.13224-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170621082850.13224-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

bm91dmVhdV9kaXNwbGF5X3ZibGFua19maW5pIGlzIGNhbGxlZCBpbiB0aGUgbG9hZCBlcnJvciBw
YXRoICh3aGVyZSBpdApkb2Vzbid0IG1hdHRlcikgYW5kIG1vZHVsZSB1bmxvYWQgKHdoZXJlIHZi
bGFua3MgaGF2ZSBiZWVuIHNodXQgZG93bgpjb3JyZWN0bHkgYWxyZWFkeSB0aHJvdWdoIGRybV92
Ymxhbmtfb2ZmKSwgd2UgY2FuIGRyb3AgaXQuCgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPgpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCmlu
ZGV4IDhkMWRmNTY3OGVhYS4uYjlhMTA5YmU5ODljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Rpc3BsYXkuYwpAQCAtMTU5LDggKzE1OSw2IEBAIG5vdXZlYXVfZGlzcGxheV92
YmxhbmtfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCXN0cnVjdCBkcm1fY3J0YyAq
Y3J0YzsKIAotCWRybV92YmxhbmtfY2xlYW51cChkZXYpOwotCiAJbGlzdF9mb3JfZWFjaF9lbnRy
eShjcnRjLCAmZGV2LT5tb2RlX2NvbmZpZy5jcnRjX2xpc3QsIGhlYWQpIHsKIAkJc3RydWN0IG5v
dXZlYXVfY3J0YyAqbnZfY3J0YyA9IG5vdXZlYXVfY3J0YyhjcnRjKTsKIAkJbnZpZl9ub3RpZnlf
ZmluaSgmbnZfY3J0Yy0+dmJsYW5rKTsKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
