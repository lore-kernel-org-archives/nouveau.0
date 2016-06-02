From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v3 26/45] h8300: dma-mapping: Use unsigned long for
	dma_attrs
Date: Thu, 02 Jun 2016 17:39:28 +0200
Message-ID: <1464881987-13203-27-git-send-email-k.kozlowski__44946.3318604559$1464937927$gmane$org@samsung.com>
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
cnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2g4
MzAwL2tlcm5lbC9kbWEuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9oODMwMC9rZXJuZWwvZG1h
LmMgYi9hcmNoL2g4MzAwL2tlcm5lbC9kbWEuYwppbmRleCBlZWIxM2QzZjI0MjQuLjM2NTFkYTA0
NTgwNiAxMDA2NDQKLS0tIGEvYXJjaC9oODMwMC9rZXJuZWwvZG1hLmMKKysrIGIvYXJjaC9oODMw
MC9rZXJuZWwvZG1hLmMKQEAgLTEyLDcgKzEyLDcgQEAKIAogc3RhdGljIHZvaWQgKmRtYV9hbGxv
YyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAogCQkgICAgICAgZG1hX2FkZHJfdCAq
ZG1hX2hhbmRsZSwgZ2ZwX3QgZ2ZwLAotCQkgICAgICAgc3RydWN0IGRtYV9hdHRycyAqYXR0cnMp
CisJCSAgICAgICB1bnNpZ25lZCBsb25nIGF0dHJzKQogewogCXZvaWQgKnJldDsKIApAQCAtMzIs
NyArMzIsNyBAQCBzdGF0aWMgdm9pZCAqZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6
ZV90IHNpemUsCiAKIHN0YXRpYyB2b2lkIGRtYV9mcmVlKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6
ZV90IHNpemUsCiAJCSAgICAgdm9pZCAqdmFkZHIsIGRtYV9hZGRyX3QgZG1hX2hhbmRsZSwKLQkJ
ICAgICBzdHJ1Y3QgZG1hX2F0dHJzICphdHRycykKKwkJICAgICB1bnNpZ25lZCBsb25nIGF0dHJz
KQogCiB7CiAJZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZyl2YWRkciwgZ2V0X29yZGVyKHNpemUp
KTsKQEAgLTQxLDE0ICs0MSwxNCBAQCBzdGF0aWMgdm9pZCBkbWFfZnJlZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHNpemVfdCBzaXplLAogc3RhdGljIGRtYV9hZGRyX3QgbWFwX3BhZ2Uoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIAkJCQkgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0
LCBzaXplX3Qgc2l6ZSwKIAkJCQkgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbiwK
LQkJCQkgIHN0cnVjdCBkbWFfYXR0cnMgKmF0dHJzKQorCQkJCSAgdW5zaWduZWQgbG9uZyBhdHRy
cykKIHsKIAlyZXR1cm4gcGFnZV90b19waHlzKHBhZ2UpICsgb2Zmc2V0OwogfQogCiBzdGF0aWMg
aW50IG1hcF9zZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLAog
CQkgIGludCBuZW50cywgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uLAotCQkgIHN0
cnVjdCBkbWFfYXR0cnMgKmF0dHJzKQorCQkgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCiB7CiAJc3Ry
dWN0IHNjYXR0ZXJsaXN0ICpzZzsKIAlpbnQgaTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
