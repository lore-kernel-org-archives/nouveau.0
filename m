From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] fbcon/gf100-: reduce RING_SPACE allocation
Date: Mon, 29 Jun 2015 20:43:46 -0400
Message-ID: <1435625026-29003-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

V2Ugb25seSBlbWl0IDU4IHdvcmRzIHRvIHRoZSByaW5nLCBub3QgNjAuCgpTaWduZWQtb2ZmLWJ5
OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Ci0tLQogZHJtL25vdXZlYXUvbnZj
MF9mYmNvbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZjMF9mYmNvbi5jIGIvZHJtL25vdXZl
YXUvbnZjMF9mYmNvbi5jCmluZGV4IDYxMjQ2NjcuLmZjZDJlNWYgMTAwNjQ0Ci0tLSBhL2RybS9u
b3V2ZWF1L252YzBfZmJjb24uYworKysgYi9kcm0vbm91dmVhdS9udmMwX2ZiY29uLmMKQEAgLTE4
OCw3ICsxODgsNyBAQCBudmMwX2ZiY29uX2FjY2VsX2luaXQoc3RydWN0IGZiX2luZm8gKmluZm8p
CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCXJldCA9IFJJTkdfU1BBQ0UoY2hhbiwgNjApOwor
CXJldCA9IFJJTkdfU1BBQ0UoY2hhbiwgNTgpOwogCWlmIChyZXQpIHsKIAkJV0FSTl9PTigxKTsK
IAkJbm91dmVhdV9mYmNvbl9ncHVfbG9ja3VwKGluZm8pOwotLSAKMi4zLjYKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
