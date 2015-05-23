From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH v2 01/10] clk/gt215: u32->s32 for difference in
	req. and set clock
Date: Sat, 23 May 2015 10:37:42 +0200
Message-ID: <1432370271-8468-2-git-send-email-rspliet@eclipso.eu>
References: <1432370271-8468-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1432370271-8468-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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

VGhpcyBkaWZmZXJlbmNlIGNhbiBvZiBjb3Vyc2UgYmUgbmVnYXRpdmUgdG9vLi4uCgpTaWduZWQt
b2ZmLWJ5OiBSb3kgU3BsaWV0IDxyc3BsaWV0QGVjbGlwc28uZXU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1LmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9ndDIxNS5jIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1LmMKaW5kZXggODIyZDMyYS4uMDY1ZTlmNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1LmMK
QEAgLTE4MCw3ICsxODAsOCBAQCBndDIxNV9jbGtfaW5mbyhzdHJ1Y3QgbnZrbV9jbGsgKmNsb2Nr
LCBpbnQgY2xrLCB1MzIga2h6LAogCSAgICAgICBzdHJ1Y3QgZ3QyMTVfY2xrX2luZm8gKmluZm8p
CiB7CiAJc3RydWN0IGd0MjE1X2Nsa19wcml2ICpwcml2ID0gKHZvaWQgKiljbG9jazsKLQl1MzIg
b2Nsaywgc2Nsaywgc2RpdiwgZGlmZjsKKwl1MzIgb2Nsaywgc2Nsaywgc2RpdjsKKwlzMzIgZGlm
ZjsKIAogCWluZm8tPmNsayA9IDA7CiAKLS0gCjIuMS4wCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
