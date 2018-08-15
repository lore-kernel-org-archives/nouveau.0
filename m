From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 1/3] drm/nouveau: Remove useless poll_enable() call in
 switcheroo_set_state()
Date: Wed, 15 Aug 2018 15:15:11 -0400
Message-ID: <20180815191513.6266-2-lyude@redhat.com>
References: <20180815191513.6266-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180815191513.6266-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

VGhpcyBkb2Vzbid0IGRvIGFueXRoaW5nLCBkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZSgpIGdl
dHMgY2FsbGVkIGluCm5vdXZlYXVfcG1vcHNfcmVzdW1lKCktPm5vdXZlYXVfZGlzcGxheV9yZXN1
bWUoKS0+bm91dmVhdV9kaXNwbGF5X2luaXQoKQphbHJlYWR5LgoKU2lnbmVkLW9mZi1ieTogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hl
cmJzdEByZWRoYXQuY29tPgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV92Z2EuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ZnYS5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYwppbmRleCAzZGE1YTQzMDVhYTQu
LjA5YjFkODE1MTg4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV92Z2EuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ZnYS5jCkBAIC00
Niw3ICs0Niw2IEBAIG5vdXZlYXVfc3dpdGNoZXJvb19zZXRfc3RhdGUoc3RydWN0IHBjaV9kZXYg
KnBkZXYsCiAJCXByX2VycigiVkdBIHN3aXRjaGVyb286IHN3aXRjaGVkIG5vdXZlYXUgb25cbiIp
OwogCQlkZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hfUE9XRVJfQ0hBTkdJTkc7
CiAJCW5vdXZlYXVfcG1vcHNfcmVzdW1lKCZwZGV2LT5kZXYpOwotCQlkcm1fa21zX2hlbHBlcl9w
b2xsX2VuYWJsZShkZXYpOwogCQlkZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hf
UE9XRVJfT047CiAJfSBlbHNlIHsKIAkJcHJfZXJyKCJWR0Egc3dpdGNoZXJvbzogc3dpdGNoZWQg
bm91dmVhdSBvZmZcbiIpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
