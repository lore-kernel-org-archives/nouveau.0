From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpu: drm: nouveau: add null check before
 pointer dereference
Date: Tue, 23 May 2017 08:24:26 +1000
Message-ID: <52f5e84e-7072-4814-275e-1f5a1dba60d2@redhat.com>
References: <20170522191237.GA6240@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170522191237.GA6240@embeddedgus>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "Gustavo A. R. Silva" <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gMDUvMjMvMjAxNyAwNToxMiBBTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBBZGQg
bnVsbCBjaGVjayBiZWZvcmUgZGVyZWZlcmVuY2luZyBwb2ludGVyIGFzeWMKSSd2ZSB0YWtlbiB0
aGUgcGF0Y2ggaW50byBteSB0cmVlLCB0aGFua3MhCgpCZW4uCgo+IAo+IEFkZHJlc3Nlcy1Db3Zl
cml0eS1JRDogMTM5NzkzMgo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGdh
cnNpbHZhQGVtYmVkZGVkb3IuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnY1MF9kaXNwbGF5LmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udjUwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5j
Cj4gaW5kZXggYTc2NjMyNC4uMDUyYTYwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udjUwX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
NTBfZGlzcGxheS5jCj4gQEAgLTIxMDcsNyArMjEwNyw4IEBAIG52NTBfaGVhZF9hdG9taWNfY2hl
Y2soc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKQo+
ICAgCQkJCQlhc3ljLT5zZXQuZGl0aGVyID0gdHJ1ZTsKPiAgIAkJCX0KPiAgIAkJfSBlbHNlIHsK
PiAtCQkJYXN5Yy0+c2V0Lm1hc2sgPSB+MDsKPiArCQkJaWYgKGFzeWMpCj4gKwkJCQlhc3ljLT5z
ZXQubWFzayA9IH4wOwo+ICAgCQkJYXN5aC0+c2V0Lm1hc2sgPSB+MDsKPiAgIAkJfQo+ICAgCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
