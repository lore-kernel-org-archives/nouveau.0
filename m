From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] gr/gf100: wait on bottom half of FE's pipeline
Date: Mon, 8 Jun 2015 17:53:56 +0900
Message-ID: <1433753637-24706-5-git-send-email-acourbot@nvidia.com>
References: <1433753637-24706-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1433753637-24706-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

V2hlbiBlbWl0dGluZyB0aGUgSUNNRCBidW5kbGUsIHdhaXQgb24gdGhlIGJvdHRvbSBoYWxmIChi
aXQgMyBvZiB0aGUKR1JfU1RBVFVTIHJlZ2lzdGVyKSBpbnN0ZWFkIG9mIHVwcGVyIGhhbGYgKGJp
dCAyKSB0byBtYWtlIHN1cmUgbWV0aG9kcwphcmUgZWZmZWN0aXZlbHkgZW1pdHRlZC4KClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgotLS0KIGRy
bS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dmMTAwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9nci9nZjEwMC5jIGIvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvZ2YxMDAu
YwppbmRleCA1NjA2YzI1ZTVkMDIuLjAxZWZjMmM5NjA0NSAxMDA2NDQKLS0tIGEvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZ3IvZ2YxMDAuYworKysgYi9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9n
ci9nZjEwMC5jCkBAIC02OTksNyArNjk5LDcgQEAgZ2YxMDBfZ3JfaWNtZChzdHJ1Y3QgZ2YxMDBf
Z3JfcHJpdiAqcHJpdiwgY29uc3Qgc3RydWN0IGdmMTAwX2dyX3BhY2sgKnApCiAKIAkJd2hpbGUg
KGFkZHIgPCBuZXh0KSB7CiAJCQludl93cjMyKHByaXYsIDB4NDAwMjAwLCBhZGRyKTsKLQkJCW52
X3dhaXQocHJpdiwgMHg0MDA3MDAsIDB4MDAwMDAwMDIsIDB4MDAwMDAwMDApOworCQkJbnZfd2Fp
dChwcml2LCAweDQwMDcwMCwgMHgwMDAwMDAwNCwgMHgwMDAwMDAwMCk7CiAJCQlhZGRyICs9IGlu
aXQtPnBpdGNoOwogCQl9CiAJfQotLSAKMi40LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
