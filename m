From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau/led: guard against a division by 0
Date: Fri, 16 Sep 2016 10:34:43 +0300
Message-ID: <20160916073444.8952-2-martin.peres@free.fr>
References: <20160916073444.8952-1-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160916073444.8952-1-martin.peres-GANU6spQydw@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAZnJlZS5mcj4KLS0tCiBk
cm0vbm91dmVhdS9ub3V2ZWF1X2xlZC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L25vdXZl
YXVfbGVkLmMgYi9kcm0vbm91dmVhdS9ub3V2ZWF1X2xlZC5jCmluZGV4IDVlMjhiNWYuLjFmNzMx
ZGEgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L25vdXZlYXVfbGVkLmMKKysrIGIvZHJtL25vdXZl
YXUvbm91dmVhdV9sZWQuYwpAQCAtNDQsNyArNDQsMTAgQEAgbm91dmVhdV9sZWRfZ2V0X2JyaWdo
dG5lc3Moc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkKQogCWRpdiA9ICBudmlmX3JkMzIoZGV2aWNl
LCAweDYxYzg4MCkgJiAweDAwZmZmZmZmOwogCWR1dHkgPSBudmlmX3JkMzIoZGV2aWNlLCAweDYx
Yzg4NCkgJiAweDAwZmZmZmZmOwogCi0JcmV0dXJuIGR1dHkgKiBMRURfRlVMTCAvIGRpdjsKKwlp
ZiAoZGl2ID4gMCkKKwkJcmV0dXJuIGR1dHkgKiBMRURfRlVMTCAvIGRpdjsKKwllbHNlCisJCXJl
dHVybiAwOwogfQogCiBzdGF0aWMgdm9pZAotLSAKMi44LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
