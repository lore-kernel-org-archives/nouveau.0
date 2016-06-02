From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v3 01/45] powerpc: dma-mapping: Don't hard-code the
 value of DMA_ATTR_WEAK_ORDERING
Date: Thu, 02 Jun 2016 17:39:03 +0200
Message-ID: <1464881987-13203-2-git-send-email-k.kozlowski__9559.84758115864$1464937984$gmane$org@samsung.com>
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

SGFyZC1jb2RlZCB2YWx1ZSBvZiBETUFfQVRUUl9XRUFLX09SREVSSU5HIGlzIHRoZW4gY29tcGFy
ZWQgd2l0aCB0aGUKc3ltYm9sLiAgVGhpcyB3aWxsIHN0b3AgbWF0Y2hpbmcgaWYgdGhlIHZhbHVl
IG9mIHN5bWJvbCBpcyBjaGFuZ2VkICh3aGVuCnN3aXRjaGluZyBETUEgYXR0cmlidXRlcyB0byB1
bnNpZ25lZCBsb25nKS4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGsua296
bG93c2tpQHNhbXN1bmcuY29tPgotLS0KIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9pb21t
dS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL2lvbW11LmMgYi9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvaW9tbXUuYwppbmRleCAxNGE1ODJiMjEyNzQuLjBjMjc5
NGQyYjZjMCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL2lvbW11LmMK
KysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL2lvbW11LmMKQEAgLTExNjIsNyArMTE2
Miw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHNldHVwX2lvbW11X2ZpeGVkKGNoYXIgKnN0cikKIAlw
Y2llcCA9IG9mX2ZpbmRfbm9kZV9ieV90eXBlKE5VTEwsICJwY2llLWVuZHBvaW50Iik7CiAKIAlp
ZiAoc3RyY21wKHN0ciwgIndlYWsiKSA9PSAwIHx8IChwY2llcCAmJiBzdHJjbXAoc3RyLCAic3Ry
b25nIikgIT0gMCkpCi0JCWlvbW11X2ZpeGVkX2lzX3dlYWsgPSAxOworCQlpb21tdV9maXhlZF9p
c193ZWFrID0gRE1BX0FUVFJfV0VBS19PUkRFUklORzsKIAogCW9mX25vZGVfcHV0KHBjaWVwKTsK
IAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
