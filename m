From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 2/3] drm/nouveau: Fix runtime PM leak in
 nv50_disp_atomic_commit()
Date: Thu, 12 Jul 2018 13:02:53 -0400
Message-ID: <20180712170256.13018-3-lyude@redhat.com>
References: <20180712170256.13018-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180712170256.13018-1-lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

QSBDUlRDIGJlaW5nIGVuYWJsZWQgZG9lc24ndCBtZWFuIGl0J3Mgb24hIEl0IGRvZXNuJ3QgZXZl
biBuZWNlc3NhcmlseQptZWFuIGl0J3MgYmVpbmcgdXNlZC4gVGhpcyBmaXhlcyBydW50aW1lIFBN
IGxlYWtzIG9uIHRoZSBQNTAgSSd2ZSBnb3QKbmV4dCB0byBtZS4KClNpZ25lZC1vZmYtYnk6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0t
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvZGlzcC5jCmluZGV4IGQ5ZGE2OWM4M2FlNy4uOWJhZTRkYjg0Y2ZiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xODc4LDcgKzE4Nzgs
NyBAQCBudjUwX2Rpc3BfYXRvbWljX2NvbW1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlu
djUwX2Rpc3BfYXRvbWljX2NvbW1pdF90YWlsKHN0YXRlKTsKIAogCWRybV9mb3JfZWFjaF9jcnRj
KGNydGMsIGRldikgewotCQlpZiAoY3J0Yy0+c3RhdGUtPmVuYWJsZSkgeworCQlpZiAoY3J0Yy0+
c3RhdGUtPmFjdGl2ZSkgewogCQkJaWYgKCFkcm0tPmhhdmVfZGlzcF9wb3dlcl9yZWYpIHsKIAkJ
CQlkcm0tPmhhdmVfZGlzcF9wb3dlcl9yZWYgPSB0cnVlOwogCQkJCXJldHVybiAwOwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
