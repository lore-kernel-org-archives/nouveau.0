From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v3 14/45] drm/msm: dma-mapping: Use unsigned long
	for dma_attrs
Date: Thu, 02 Jun 2016 17:39:16 +0200
Message-ID: <1464881987-13203-15-git-send-email-k.kozlowski__28339.3000871458$1464937971$gmane$org@samsung.com>
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
cnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9kcnYuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwppbmRl
eCAxZjdkZTQ3ZDgxN2UuLjliODA2ZTU3NmQzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKQEAgLTIz
MCwxMSArMjMwLDEwIEBAIHN0YXRpYyBpbnQgbXNtX2RybV91bmluaXQoc3RydWN0IGRldmljZSAq
ZGV2KQogCX0KIAogCWlmIChwcml2LT52cmFtLnBhZGRyKSB7Ci0JCURFRklORV9ETUFfQVRUUlMo
YXR0cnMpOwotCQlkbWFfc2V0X2F0dHIoRE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcsICZhdHRy
cyk7CisJCXVuc2lnbmVkIGxvbmcgYXR0cnMgPSBETUFfQVRUUl9OT19LRVJORUxfTUFQUElORzsK
IAkJZHJtX21tX3Rha2Vkb3duKCZwcml2LT52cmFtLm1tKTsKIAkJZG1hX2ZyZWVfYXR0cnMoZGV2
LCBwcml2LT52cmFtLnNpemUsIE5VTEwsCi0JCQkgICAgICAgcHJpdi0+dnJhbS5wYWRkciwgJmF0
dHJzKTsKKwkJCSAgICAgICBwcml2LT52cmFtLnBhZGRyLCBhdHRycyk7CiAJfQogCiAJY29tcG9u
ZW50X3VuYmluZF9hbGwoZGV2LCBkZGV2KTsKQEAgLTI5OSwyMSArMjk4LDIxIEBAIHN0YXRpYyBp
bnQgbXNtX2luaXRfdnJhbShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCX0KIAogCWlmIChzaXpl
KSB7Ci0JCURFRklORV9ETUFfQVRUUlMoYXR0cnMpOworCQl1bnNpZ25lZCBsb25nIGF0dHJzID0g
MDsKIAkJdm9pZCAqcDsKIAogCQlwcml2LT52cmFtLnNpemUgPSBzaXplOwogCiAJCWRybV9tbV9p
bml0KCZwcml2LT52cmFtLm1tLCAwLCAoc2l6ZSA+PiBQQUdFX1NISUZUKSAtIDEpOwogCi0JCWRt
YV9zZXRfYXR0cihETUFfQVRUUl9OT19LRVJORUxfTUFQUElORywgJmF0dHJzKTsKLQkJZG1hX3Nl
dF9hdHRyKERNQV9BVFRSX1dSSVRFX0NPTUJJTkUsICZhdHRycyk7CisJCWF0dHJzIHw9IERNQV9B
VFRSX05PX0tFUk5FTF9NQVBQSU5HOworCQlhdHRycyB8PSBETUFfQVRUUl9XUklURV9DT01CSU5F
OwogCiAJCS8qIG5vdGUgdGhhdCBmb3Igbm8ta2VybmVsLW1hcHBpbmcsIHRoZSB2YWRkciByZXR1
cm5lZAogCQkgKiBpcyBib2d1cywgYnV0IG5vbi1udWxsIGlmIGFsbG9jYXRpb24gc3VjY2VlZGVk
OgogCQkgKi8KIAkJcCA9IGRtYV9hbGxvY19hdHRycyhkZXYtPmRldiwgc2l6ZSwKLQkJCQkmcHJp
di0+dnJhbS5wYWRkciwgR0ZQX0tFUk5FTCwgJmF0dHJzKTsKKwkJCQkmcHJpdi0+dnJhbS5wYWRk
ciwgR0ZQX0tFUk5FTCwgYXR0cnMpOwogCQlpZiAoIXApIHsKIAkJCWRldl9lcnIoZGV2LT5kZXYs
ICJmYWlsZWQgdG8gYWxsb2NhdGUgVlJBTVxuIik7CiAJCQlwcml2LT52cmFtLnBhZGRyID0gMDsK
LS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
