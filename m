From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] pm/nv40: rename pcounter domains to 'pc'
	instead of 'pm'
Date: Fri, 19 Jun 2015 17:36:38 +0200
Message-ID: <1434728198-873-2-git-send-email-samuel.pitoiset@gmail.com>
References: <1434728198-873-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1434728198-873-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

VGhpcyB0cml2aWFsIHBhdGNoIG1ha2VzIHRoaW5nIG1vcmUgY29uc2lzdGVudCBzaW5jZSBoYXJk
d2FyZSBzaWduYWxzCm5hbWVzIGFyZSBwcmVmaXhlZCBieSAncGNYWCcuCgpTaWduZWQtb2ZmLWJ5
OiBTYW11ZWwgUGl0b2lzZXQgPHNhbXVlbC5waXRvaXNldEBnbWFpbC5jb20+Ci0tLQogZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvcG0vbnY0MC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9l
bmdpbmUvcG0vbnY0MC5jIGIvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvcG0vbnY0MC5jCmluZGV4
IDFjNmQxY2EuLjVhODdmM2EgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vZW5naW5lL3Bt
L252NDAuYworKysgYi9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9wbS9udjQwLmMKQEAgLTEwOCw3
ICsxMDgsNyBAQCBudjQwX3BtX2N0b3Ioc3RydWN0IG52a21fb2JqZWN0ICpwYXJlbnQsIHN0cnVj
dCBudmttX29iamVjdCAqZW5naW5lLAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlyZXQg
PSBudmttX3BlcmZkb21fbmV3KCZwcml2LT5iYXNlLCAicG0iLCAwLCAwLCAwLCA0LCBtY2xhc3Mt
PmRvbXMpOworCXJldCA9IG52a21fcGVyZmRvbV9uZXcoJnByaXYtPmJhc2UsICJwYyIsIDAsIDAs
IDAsIDQsIG1jbGFzcy0+ZG9tcyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotLSAKMi40
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
