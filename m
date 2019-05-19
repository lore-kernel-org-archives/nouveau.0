From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 1/4] drm/nouveau: drop use of DRM_UDELAY
Date: Sun, 19 May 2019 16:00:41 +0200
Message-ID: <20190519140044.22142-2-sam@ravnborg.org>
References: <20190519140044.22142-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190519140044.22142-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: nouveau.vger.kernel.org

VGhlIERSTV9VREVMQVkgaXMgYSBzaW1wbGUgd3JhcHBlciBmb3IgdWRlYWx5KCkgYW5kIHRvIGJl
IGNvbnNpc3RlbnQKY2FsbCB1ZGVsYXkoKSBkaXJlY3QgbGlrZSBpbiBtYXkgb3RoZXIgcGxhY2Vz
LgpUaGlzIGF2b2lkcyB0aGUgbmVlZCB0byBwdWxsIGluIGRybV9vc19saW51eC5oIHdoZW4gd2Ug
bGF0ZXIKZHJvcCBkcm1QLmggdXNlcyBpbiBub3V2ZWF1LgoKU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQu
Y29tPgpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RtYS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1hLmMK
aW5kZXggMDc4ZjY1ZDg0OWNlLi4zYzQzMGE1NTBhNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWEuYwpAQCAtMTE4LDcgKzExOCw3IEBAIG52NTBfZG1hX3B1c2hfd2FpdChzdHJ1
Y3Qgbm91dmVhdV9jaGFubmVsICpjaGFuLCBpbnQgY291bnQpCiAJCX0KIAogCQlpZiAoKCsrY250
ICYgMHhmZikgPT0gMCkgewotCQkJRFJNX1VERUxBWSgxKTsKKwkJCXVkZWxheSgxKTsKIAkJCWlm
IChjbnQgPiAxMDAwMDApCiAJCQkJcmV0dXJuIC1FQlVTWTsKIAkJfQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
