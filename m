From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/3] drm/nv4c/vga: decode register is in a
	different place on nv4x igp's
Date: Wed,  5 Feb 2014 14:33:03 -0500
Message-ID: <1391628784-18834-2-git-send-email-imirkin@alum.mit.edu>
References: <1391628784-18834-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1391628784-18834-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

U3VnZ2VzdGVkLWJ5OiBNYXJjaW4gS2/Fm2NpZWxuaWNraSA8a29yaWFraW5AMHgwNC5uZXQ+ClNp
Z25lZC1vZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ZnYS5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfdmdhLmMKaW5kZXggODE2MzhkNy4uNDcxMzQ3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3ZnYS5jCkBAIC0xNCw3ICsxNCw5IEBAIG5vdXZlYXVfdmdhX3NldF9kZWNvZGUo
dm9pZCAqcHJpdiwgYm9vbCBzdGF0ZSkKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9kZXZpY2UgKmRldmlj
ZSA9IG5vdXZlYXVfZGV2KHByaXYpOwogCi0JaWYgKGRldmljZS0+Y2hpcHNldCA+PSAweDQwKQor
CWlmIChkZXZpY2UtPmNhcmRfdHlwZSA9PSBOVl80MCAmJiBkZXZpY2UtPmNoaXBzZXQgPj0gMHg0
YykKKwkJbnZfd3IzMihkZXZpY2UsIDB4MDg4MDYwLCBzdGF0ZSk7CisJZWxzZSBpZiAoZGV2aWNl
LT5jaGlwc2V0ID49IDB4NDApCiAJCW52X3dyMzIoZGV2aWNlLCAweDA4ODA1NCwgc3RhdGUpOwog
CWVsc2UKIAkJbnZfd3IzMihkZXZpY2UsIDB4MDAxODU0LCBzdGF0ZSk7Ci0tIAoxLjguMy4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
