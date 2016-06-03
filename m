From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC v3 01/45] powerpc: dma-mapping: Don't hard-code
 the value of DMA_ATTR_WEAK_ORDERING
Date: Fri, 03 Jun 2016 09:55:48 +0200
Message-ID: <57513804.9020309__30151.9292327159$1465192920$gmane$org@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
 <1464881987-13203-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <1464881987-13203-2-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
Cc: hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMDYvMDIvMjAxNiAwNTozOSBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBIYXJk
LWNvZGVkIHZhbHVlIG9mIERNQV9BVFRSX1dFQUtfT1JERVJJTkcgaXMgdGhlbiBjb21wYXJlZCB3
aXRoIHRoZQo+IHN5bWJvbC4gIFRoaXMgd2lsbCBzdG9wIG1hdGNoaW5nIGlmIHRoZSB2YWx1ZSBv
ZiBzeW1ib2wgaXMgY2hhbmdlZCAod2hlbgo+IHN3aXRjaGluZyBETUEgYXR0cmlidXRlcyB0byB1
bnNpZ25lZCBsb25nKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
Lmtvemxvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9j
ZWxsL2lvbW11LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwv
aW9tbXUuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9pb21tdS5jCj4gaW5kZXggMTRh
NTgyYjIxMjc0Li4wYzI3OTRkMmI2YzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9jZWxsL2lvbW11LmMKPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvaW9t
bXUuYwo+IEBAIC0xMTYyLDcgKzExNjIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBzZXR1cF9pb21t
dV9maXhlZChjaGFyICpzdHIpCj4gIAlwY2llcCA9IG9mX2ZpbmRfbm9kZV9ieV90eXBlKE5VTEws
ICJwY2llLWVuZHBvaW50Iik7Cj4gIAo+ICAJaWYgKHN0cmNtcChzdHIsICJ3ZWFrIikgPT0gMCB8
fCAocGNpZXAgJiYgc3RyY21wKHN0ciwgInN0cm9uZyIpICE9IDApKQo+IC0JCWlvbW11X2ZpeGVk
X2lzX3dlYWsgPSAxOwo+ICsJCWlvbW11X2ZpeGVkX2lzX3dlYWsgPSBETUFfQVRUUl9XRUFLX09S
REVSSU5HOwoKQWZ0ZXIgc29tZSBtb3JlIHRob3VnaHRzIGdpdmVuIHRvIHRoaXMsIEkgdGhpbmsg
bXkgZml4IGlzIG5vdCBjb3JyZWN0LgpUaGUgJ2lvbW11X2ZpeGVkX2lzX3dlYWsnIHN0b3JlcyB0
aGUgYm9vbCBhbmQgaXQgaXMgdXNlZCB0byBjb21wYXJlIHdpdGgKcmVzdWx0IG9mIHRlc3RfYml0
KCkuCgpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
