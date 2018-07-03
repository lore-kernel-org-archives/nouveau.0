From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: Fix runtime PM leak in
 nv50_disp_atomic_commit()
Date: Tue,  3 Jul 2018 18:06:00 -0400
Message-ID: <20180703220602.16664-3-lyude@redhat.com>
References: <20180703220602.16664-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180703220602.16664-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
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
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
