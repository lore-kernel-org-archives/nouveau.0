From: =?UTF-8?B?T3J0d2luIEdsw7xjaw==?= <odi-L693kI9kcNY@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix crash with noaccel=1
Date: Mon, 12 Nov 2012 19:12:01 +0100
Message-ID: <50A13BF1.50202@odi.ch>
References: <20121111190009.GD3530@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121111190009.GD3530-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

SSBhbSBjb25maXJtaW5nIHRoYXQgaXQgZml4ZXMgdGhlIHByb2JsZW0uCgpUaGFua3MhCgpPcnR3
aW4KCk9uIDExLjExLjIwMTIgMjA6MDAsIE1hcmNpbiBTbHVzYXJ6IHdyb3RlOgo+Cj4gUmVwb3J0
ZWQtYnk6IE9ydHdpbiBHbMO8Y2sgPG9kaUBvZGkuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTWFyY2lu
IFNsdXNhcnogPG1hcmNpbi5zbHVzYXJ6QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuYyB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYWJpMTYuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYu
Ywo+IGluZGV4IGNjNzljNzkuLmNiZjFmYzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9hYmkxNi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9hYmkxNi5jCj4gQEAgLTI0MSw2ICsyNDEsMTAgQEAgbm91dmVhdV9hYmkxNl9pb2N0
bF9jaGFubmVsX2FsbG9jKEFCSTE2X0lPQ1RMX0FSR1MpCj4KPiAgIAlpZiAodW5saWtlbHkoIWFi
aTE2KSkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJaWYgKCFkcm0tPmNoYW5uZWwpCj4g
KwkJcmV0dXJuIG5vdXZlYXVfYWJpMTZfcHV0KGFiaTE2LCAtRU5PREVWKTsKPiArCj4gICAJY2xp
ZW50ID0gbnZfY2xpZW50KGFiaTE2LT5jbGllbnQpOwo+Cj4gICAJaWYgKGluaXQtPmZiX2N0eGRt
YV9oYW5kbGUgPT0gfjAgfHwgaW5pdC0+dHRfY3R4ZG1hX2hhbmRsZSA9PSB+MCkKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
