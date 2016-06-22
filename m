From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 00/15] Runtime pm ref leak bonanza
Date: Wed, 22 Jun 2016 14:43:33 +0200
Message-ID: <CAKMK7uFxSX1cw4H3Yo_iM8e1Vk764C9mFWBORYO0OTOZkScFaA@mail.gmail.com>
References: <cover.1465392124.git.lukas@wunner.de>
 <20160609065032.GI3363@phenom.ffwll.local>
 <CADnq5_NENZukwJg-CACQ-djWsP4e299gnr4aWrEJkdcVMeaZWA@mail.gmail.com>
 <20160615113735.GA562@wunner.de> <20160615151154.GF1338@phenom.ffwll.local>
 <20160622124447.GA3267@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160622124447.GA3267-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdW4gMjIsIDIwMTYgYXQgMjo0NCBQTSwgTHVrYXMgV3VubmVyIDxsdWthc0B3dW5u
ZXIuZGU+IHdyb3RlOgo+PiBZZWFoIHdpbGwgcGljayB1cCBsYXRlciB0aGlzIHdlZWssIHJpZ2h0
IG5vdyBJIGhhdmUgYSBiaWcgZHJtLW1pc2MgcHVsbAo+PiB0aGF0J3MgcGVuZGluZy4gV291bGQg
bGlrZSB0byBnZXQgdGhhdCBsYW5kZWQgZmlyc3QuIFBsZWFzZSBwaW5nIG1lIGlmCj4+IHlvdXIg
cGF0Y2hlcyBoYXZlbid0IGxhbmRlZCBpbiBkcm0tbWlzYyBieSBuZXh0IHdlZWsuCj4KPiBJZiB5
b3UgY2FuIGJlIGJvdGhlcmVkIHRvIHVwZGF0ZSB5b3VyIGRybS1taXNjIHB1bGw6IFBpbmchCj4g
KE90aGVyd2lzZSBJIHRoaW5rIERhdmUgb3IgVGhpZXJyeS9TdW1pdCBjb3VsZCBwaWNrIGl0IHVw
IGluc3RlYWQuKQoKU28gbXVjaCBmb3IgbXkgNSBzZWNvbmQgYXR0ZW50aW9uIHNwYW4gOiggSSds
bCBtZXJnZSB0aGVtIHJpZ2h0IG5vdywKYnV0IEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gbGV0IHRo
ZW0gc29hayBhIGJpdCBtb3JlLiBNYXliZSBUaGllcnJ5IGNhbgpzZW5kIGEgcHVsbCByZXF1ZXN0
IG5leHQgd2VlayAoaWYgbW9yZSBwYXRjaGVzIHNob3cgdXApLiBOb3RlIEknbGwKd2FpdCB3aXRo
IHB1c2hpbmcgb3V0IHVudGlsIERhdmUgbWVyZ2VkIHRoZSBwcmV2aW91cyBwdWxsLCB0byBhdm9p
ZCBhCm1lc3MgaW4gY2FzZSBhbm90aGVyIGZpeHVwIGlzIG5lZWRlZC4KClRoYW5rcyBmb3IgcmVt
aW5kaW5nIG1lLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
