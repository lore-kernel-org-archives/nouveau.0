From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v3] drm/nouveau: Move irq setup/teardown to
 pci ctor/dtor
Date: Fri, 26 Jan 2018 03:36:09 +0100
Message-ID: <1516934169.6967.2.camel@gmx.de>
References: <20180125232955.14574-1-lyude@redhat.com>
 <20180126012026.kx5ijte72ch67oyi@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180126012026.kx5ijte72ch67oyi-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCAyMDE4LTAxLTI2IGF0IDAyOjIwICswMTAwLCBBZGFtIEJvcm93c2tpIHdyb3RlOgo+
IE9uIFRodSwgSmFuIDI1LCAyMDE4IGF0IDA2OjI5OjUzUE0gLTA1MDAsIEx5dWRlIFBhdWwgd3Jv
dGU6Cj4gPiBUaGlzIHdhcyBtYWRlIGFwcGFyZW50IGJ5IHdoYXQgYXBwZWFyZWQgdG8gYmUgYSBy
ZWdyZXNzaW9uIGluIHRoZQo+ID4gbWFpbmxpbmUga2VybmVsIHRoYXQgc3RhcnRlZCBpbnRyb2R1
Y2luZyBzdXNwZW5kL3Jlc3VtZSBpc3N1ZXMgZm9yCj4gPiBub3V2ZWF1Ogo+ID4gCj4gPiAgICAg
ICAgIGEwYzkyNTlkYzRlMSAoaXJxL21hdHJpeDogU3ByZWFkIGludGVycnVwdHMgb24gYWxsb2Nh
dGlvbikKPiAKPiBJJ20ganVzdCBhIGR1bWIgdXNlciBoZXJlLCBidXQgSSBjb25maXJtOgo+IENQ
VTogQU1EIFBoZW5vbSBJSSBYNiAxMDU1VCwgR1BVOiBHVFggNTYwIFRpCj4gMTAwJSBmYWlsIHRv
IHJlc3VtZSBHUFUgb24gNC4xNS1yYyosIDEwMCUgb2sgd2l0aCB5b3VyIHBhdGNoLgoKRGl0dG8u
LiBhbmQgbXkgR1RYIDk4MCB3b3JrcyBhZ2Fpbi4KCgktTWlrZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
