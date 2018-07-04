From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 3/5] drm/nouveau: Remove unecessary dma_fence_ops
Date: Wed,  4 Jul 2018 11:29:07 +0200
Message-ID: <20180704092909.6599-4-daniel.vetter@ffwll.ch>
References: <20180704092909.6599-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180704092909.6599-1-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

ZG1hX2ZlbmNlX2RlZmF1bHRfd2FpdCBpcyB0aGUgZGVmYXVsdCBub3cuCgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQmVuIFNrZWdncyA8
YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZlbmNlLmMgfCAxIC0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9mZW5j
ZS5jCmluZGV4IDQxMmQ0OWJjNmU1Ni4uOTliZTYxZGRlYjc1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZlbmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9mZW5jZS5jCkBAIC01MjYsNiArNTI2LDUgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkbWFfZmVuY2Vfb3BzIG5vdXZlYXVfZmVuY2Vfb3BzX3VldmVudCA9IHsKIAkuZ2V0X3Rp
bWVsaW5lX25hbWUgPSBub3V2ZWF1X2ZlbmNlX2dldF90aW1lbGluZV9uYW1lLAogCS5lbmFibGVf
c2lnbmFsaW5nID0gbm91dmVhdV9mZW5jZV9lbmFibGVfc2lnbmFsaW5nLAogCS5zaWduYWxlZCA9
IG5vdXZlYXVfZmVuY2VfaXNfc2lnbmFsZWQsCi0JLndhaXQgPSBkbWFfZmVuY2VfZGVmYXVsdF93
YWl0LAogCS5yZWxlYXNlID0gbm91dmVhdV9mZW5jZV9yZWxlYXNlCiB9OwotLSAKMi4xOC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
