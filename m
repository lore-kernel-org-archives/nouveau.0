From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/5] nvc0: rename BEGIN_IMC0 to IMMED_NVC0
Date: Sun, 16 Oct 2016 15:14:32 -0400
Message-ID: <1476645274-9939-3-git-send-email-imirkin@alum.mit.edu>
References: <1476645274-9939-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1476645274-9939-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

Rm9yIGNvbnNpc3RlbmN5IHdpdGggbWVzYS4gSXQgd2Fzbid0IHVzZWQgYW55d2hlcmUgcHJldmlv
dXNseS4KClNpZ25lZC1vZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4K
LS0tCiBzcmMvbm91dmVhdV9sb2NhbC5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL25vdXZlYXVfbG9jYWwuaCBi
L3NyYy9ub3V2ZWF1X2xvY2FsLmgKaW5kZXggM2RlNjlhMi4uZGQ0OTM5NSAxMDA2NDQKLS0tIGEv
c3JjL25vdXZlYXVfbG9jYWwuaAorKysgYi9zcmMvbm91dmVhdV9sb2NhbC5oCkBAIC0yMzcsNyAr
MjM3LDcgQEAgQkVHSU5fTklDMChzdHJ1Y3Qgbm91dmVhdV9wdXNoYnVmICpwdXNoLCBpbnQgc3Vi
YywgaW50IG10aGQsIGludCBzaXplKQogfQogCiBzdGF0aWMgaW5saW5lIHZvaWQKLUJFR0lOX0lN
QzAoc3RydWN0IG5vdXZlYXVfcHVzaGJ1ZiAqcHVzaCwgaW50IHN1YmMsIGludCBtdGhkLCBpbnQg
ZGF0YSkKK0lNTUVEX05WQzAoc3RydWN0IG5vdXZlYXVfcHVzaGJ1ZiAqcHVzaCwgaW50IHN1YmMs
IGludCBtdGhkLCBpbnQgZGF0YSkKIHsKIAlQVVNIX0RBVEEgKHB1c2gsIDB4ODAwMDAwMDAgfCAo
ZGF0YSA8PCAxNikgfCAoc3ViYyA8PCAxMykgfCAobXRoZCAvIDQpKTsKIH0KLS0gCjIuNy4zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
