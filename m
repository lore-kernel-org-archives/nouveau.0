From: Thomas Zimmermann <tdz@users.sourceforge.net>
Subject: [PATCH 4/4] drm/nouveau: Replace drm_dev_unref with drm_dev_put
Date: Mon, 18 Jun 2018 14:53:12 +0200
Message-ID: <20180618125312.14687-5-tdz@users.sourceforge.net>
References: <20180618125312.14687-1-tdz@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180618125312.14687-1-tdz@users.sourceforge.net>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tdz@users.sourceforge.net>, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org

VGhpcyBwYXRjaCB1bmlmaWVzIHRoZSBuYW1pbmcgb2YgRFJNIGZ1bmN0aW9ucyBmb3IgcmVmZXJl
bmNlIGNvdW50aW5nCm9mIHN0cnVjdCBkcm1fZGV2aWNlLiBUaGUgcmVzdWx0aW5nIGNvZGUgaXMg
bW9yZSBhbGlnbmVkIHdpdGggdGhlIHJlc3QKb2YgdGhlIExpbnV4IGtlcm5lbCBpbnRlcmZhY2Vz
LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHRkekB1c2Vycy5zb3VyY2Vmb3Jn
ZS5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wbGF0Zm9ybS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wbGF0Zm9ybS5jIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wbGF0Zm9ybS5jCmluZGV4IDFhZGExODZmYWI3
Ny4uMDM5ZTIzNTQ4ZTA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3BsYXRmb3JtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wbGF0
Zm9ybS5jCkBAIC0zNiw3ICszNiw3IEBAIHN0YXRpYyBpbnQgbm91dmVhdV9wbGF0Zm9ybV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcmV0ID0gZHJtX2Rldl9yZWdpc3Rl
cihkcm0sIDApOwogCWlmIChyZXQgPCAwKSB7Ci0JCWRybV9kZXZfdW5yZWYoZHJtKTsKKwkJZHJt
X2Rldl9wdXQoZHJtKTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLS0gCjIuMTQuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
