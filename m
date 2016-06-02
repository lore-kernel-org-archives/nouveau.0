From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v3 10/45] cris: dma-mapping: Use unsigned long for
	dma_attrs
Date: Thu, 02 Jun 2016 17:39:12 +0200
Message-ID: <1464881987-13203-11-git-send-email-k.kozlowski__43132.5982128785$1464937964$gmane$org@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <1464881987-13203-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans-Christian Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>, Steven Miao <realmz6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Mikael Starvik <starvik-VrBV9hrLPhE@public.gmane.org>, Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Richard Kuo <rkuo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Fenghua Yu <fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>Michal Simek <mo>
Cc: hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

U3BsaXQgb3V0IHN1YnN5c3RlbSBzcGVjaWZpYyBjaGFuZ2VzIGZvciBlYXNpZXIgcmV2aWV3cy4g
VGhpcyB3aWxsIGJlCnNxdWFzaGVkIHdpdGggbWFpbiBjb21taXQuCgpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2Ny
aXMvYXJjaC12MzIvZHJpdmVycy9wY2kvZG1hLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Ny
aXMvYXJjaC12MzIvZHJpdmVycy9wY2kvZG1hLmMgYi9hcmNoL2NyaXMvYXJjaC12MzIvZHJpdmVy
cy9wY2kvZG1hLmMKaW5kZXggOGQ1ZWZhNThjY2UxLi4xZjA2MzY3OTNmMGMgMTAwNjQ0Ci0tLSBh
L2FyY2gvY3Jpcy9hcmNoLXYzMi9kcml2ZXJzL3BjaS9kbWEuYworKysgYi9hcmNoL2NyaXMvYXJj
aC12MzIvZHJpdmVycy9wY2kvZG1hLmMKQEAgLTE3LDcgKzE3LDcgQEAKICNpbmNsdWRlIDxhc20v
aW8uaD4KIAogc3RhdGljIHZvaWQgKnYzMl9kbWFfYWxsb2Moc3RydWN0IGRldmljZSAqZGV2LCBz
aXplX3Qgc2l6ZSwKLQkJZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSwgZ2ZwX3QgZ2ZwLCAgc3RydWN0
IGRtYV9hdHRycyAqYXR0cnMpCisJCWRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsIGdmcF90IGdmcCwg
dW5zaWduZWQgbG9uZyBhdHRycykKIHsKIAl2b2lkICpyZXQ7CiAKQEAgLTM3LDIyICszNywyMSBA
QCBzdGF0aWMgdm9pZCAqdjMyX2RtYV9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBz
aXplLAogfQogCiBzdGF0aWMgdm9pZCB2MzJfZG1hX2ZyZWUoc3RydWN0IGRldmljZSAqZGV2LCBz
aXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCi0JCWRtYV9hZGRyX3QgZG1hX2hhbmRsZSwgc3RydWN0
IGRtYV9hdHRycyAqYXR0cnMpCisJCWRtYV9hZGRyX3QgZG1hX2hhbmRsZSwgdW5zaWduZWQgbG9u
ZyBhdHRycykKIHsKIAlmcmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXZhZGRyLCBnZXRfb3JkZXIo
c2l6ZSkpOwogfQogCiBzdGF0aWMgaW5saW5lIGRtYV9hZGRyX3QgdjMyX2RtYV9tYXBfcGFnZShz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJCXN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25nIG9m
ZnNldCwgc2l6ZV90IHNpemUsCi0JCWVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbiwK
LQkJc3RydWN0IGRtYV9hdHRycyAqYXR0cnMpCisJCWVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRp
cmVjdGlvbiwgdW5zaWduZWQgbG9uZyBhdHRycykKIHsKIAlyZXR1cm4gcGFnZV90b19waHlzKHBh
Z2UpICsgb2Zmc2V0OwogfQogCiBzdGF0aWMgaW5saW5lIGludCB2MzJfZG1hX21hcF9zZyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2csCiAJCWludCBuZW50cywgZW51
bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uLAotCQlzdHJ1Y3QgZG1hX2F0dHJzICphdHRy
cykKKwkJdW5zaWduZWQgbG9uZyBhdHRycykKIHsKIAlwcmludGsoIk1hcCBzZ1xuIik7CiAJcmV0
dXJuIG5lbnRzOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
