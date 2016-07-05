From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 4/6] drm/nouveau: use drm_crtc_handle_vblank()
Date: Mon,  4 Jul 2016 21:04:50 -0300
Message-ID: <1467677092-5089-4-git-send-email-gustavo@padovan.org>
References: <1467677092-5089-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467677092-5089-1-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
List-Id: nouveau.vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
UmVtb3ZlIGxlZ2FjeSB1c2FnZSBvZiBkcm1faGFuZGxlX3ZibGFuaygpCgpTaWduZWQtb2ZmLWJ5
OiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEuY28udWs+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCmluZGV4IGJkOGQ1YmIuLjZlOTc4NjIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCkBAIC00Nyw3ICs0Nyw3IEBAIG5v
dXZlYXVfZGlzcGxheV92YmxhbmtfaGFuZGxlcihzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkK
IHsKIAlzdHJ1Y3Qgbm91dmVhdV9jcnRjICpudl9jcnRjID0KIAkJY29udGFpbmVyX29mKG5vdGlm
eSwgdHlwZW9mKCpudl9jcnRjKSwgdmJsYW5rKTsKLQlkcm1faGFuZGxlX3ZibGFuayhudl9jcnRj
LT5iYXNlLmRldiwgbnZfY3J0Yy0+aW5kZXgpOworCWRybV9jcnRjX2hhbmRsZV92YmxhbmsoJm52
X2NydGMtPmJhc2UpOwogCXJldHVybiBOVklGX05PVElGWV9LRUVQOwogfQogCi0tIAoyLjUuNQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
