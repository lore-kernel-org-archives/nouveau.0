From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH v2 10/10] clk/nv50: Enable user reclocking for NVA0
Date: Sun, 24 May 2015 10:44:02 +0200
Message-ID: <1432457042-3116-4-git-send-email-rspliet@eclipso.eu>
References: <1432457042-3116-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1432457042-3116-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

VGVzdGVkIG9uIGEgZmV3IGNhcmRzLiBQcm9iYWJseSB3b3JrcyBxdWl0ZSB3ZWxsIGZvciBtb3N0
LCBnaXZlbiB0aGV5IHNob3VsZAphbGwgYmUgR0REUjMuCgpTaWduZWQtb2ZmLWJ5OiBSb3kgU3Bs
aWV0IDxyc3BsaWV0QGVjbGlwc28uZXU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvY2xrL252NTAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvY2xrL252NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L2Nsay9udjUwLmMKaW5kZXggOWI0ZmZkNi4uODljNWQ4OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL252NTAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvbnY1MC5jCkBAIC01MDksNyArNTA5LDggQEAg
bnY1MF9jbGtfY3RvcihzdHJ1Y3QgbnZrbV9vYmplY3QgKnBhcmVudCwgc3RydWN0IG52a21fb2Jq
ZWN0ICplbmdpbmUsCiAJaW50IHJldDsKIAogCXJldCA9IG52a21fY2xrX2NyZWF0ZShwYXJlbnQs
IGVuZ2luZSwgb2NsYXNzLCBwY2xhc3MtPmRvbWFpbnMsCi0JCQkgICAgICBOVUxMLCAwLCBmYWxz
ZSwgJnByaXYpOworCQkJICAgICAgTlVMTCwgMCwgbnZfZGV2aWNlKHBhcmVudCktPmNoaXBzZXQg
PT0gMHhhMCwKKwkJCSAgICAgICZwcml2KTsKIAkqcG9iamVjdCA9IG52X29iamVjdChwcml2KTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotLSAKMi4xLjAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
