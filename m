From: Thomas Zimmermann <tdz@users.sourceforge.net>
Subject: [PATCH 1/4] drm/nouveau: Replace drm_connector_{un/reference} with
 put, get functions
Date: Mon, 18 Jun 2018 14:53:09 +0200
Message-ID: <20180618125312.14687-2-tdz@users.sourceforge.net>
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
bmNlIGNvdW50aW5nCm9mIHN0cnVjdCBkcm1fY29ubmVjdG9yLiBUaGUgcmVzdWx0aW5nIGNvZGUg
aXMgbW9yZSBhbGlnbmVkIHdpdGggdGhlCnJlc3Qgb2YgdGhlIExpbnV4IGtlcm5lbCBpbnRlcmZh
Y2VzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHRkekB1c2Vycy5zb3VyY2Vm
b3JnZS5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCmluZGV4IGI4MzQ2NWFlN2MxYi4uMWY4
YmJhOGY2NTI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9k
aXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0x
MDA3LDcgKzEwMDcsNyBAQCBudjUwX21zdG1fZGVzdHJveV9jb25uZWN0b3Ioc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCiAJbXN0Yy0+cG9ydCA9IE5VTEw7CiAJZHJtX21vZGVz
ZXRfdW5sb2NrKCZkcm0tPmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7CiAKLQlk
cm1fY29ubmVjdG9yX3VucmVmZXJlbmNlKCZtc3RjLT5jb25uZWN0b3IpOworCWRybV9jb25uZWN0
b3JfcHV0KCZtc3RjLT5jb25uZWN0b3IpOwogfQogCiBzdGF0aWMgdm9pZAotLSAKMi4xNC40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
