From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/nouveau/dmem: Fix a NULL vs IS_ERR() check
Date: Fri, 22 Feb 2019 09:34:04 +0300
Message-ID: <20190222063404.GA12190@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

VGhlIGhtbV9kZXZtZW1fYWRkKCkgZnVuY3Rpb24gZG9lc24ndCByZXR1cm4gTlVMTCwgaXQgcmV0
dXJucyBlcnJvcgpwb2ludGVycy4KCkZpeGVzOiA1YmU3M2I2OTA4NzUgKCJkcm0vbm91dmVhdS9k
bWVtOiBkZXZpY2UgbWVtb3J5IGhlbHBlcnMgZm9yIFNWTSIpClNpZ25lZC1vZmYtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMK
aW5kZXggYWE5ZmVjODA0OTJkLi4yODYyNGRkMGM5MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZG1lbS5jCkBAIC02MjMsNyArNjIzLDcgQEAgbm91dmVhdV9kbWVtX2luaXQoc3Ry
dWN0IG5vdXZlYXVfZHJtICpkcm0pCiAJICovCiAJZHJtLT5kbWVtLT5kZXZtZW0gPSBobW1fZGV2
bWVtX2FkZCgmbm91dmVhdV9kbWVtX2Rldm1lbV9vcHMsCiAJCQkJCSAgIGRldmljZSwgc2l6ZSk7
Ci0JaWYgKGRybS0+ZG1lbS0+ZGV2bWVtID09IE5VTEwpIHsKKwlpZiAoSVNfRVJSKGRybS0+ZG1l
bS0+ZGV2bWVtKSkgewogCQlrZnJlZShkcm0tPmRtZW0pOwogCQlkcm0tPmRtZW0gPSBOVUxMOwog
CQlyZXR1cm47Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
