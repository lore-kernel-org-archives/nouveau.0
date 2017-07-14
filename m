From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM:
 exception RIP: drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 17:05:31 +0200
Message-ID: <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1500039693.5763.15.camel-Mmb7MZpHnFY@public.gmane.org>
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
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gNy8xNC8xNyAzOjQxIFBNLCBNaWtlIEdhbGJyYWl0aCB3cm90ZToKPiBPbiBGcmksIDIwMTct
MDctMTQgYXQgMTU6MzYgKzAyMDAsIE1pa2UgR2FsYnJhaXRoIHdyb3RlOgo+PiAgwqBBbGwgRFJN
IGRpZCB3YXMgdG8gc2xpcCBhCj4+IFdBUk5fT05fT05DRSgpIHRoYXQgbm91dmVhdSB0cmlnZ2Vy
cyBpbnRvIGEga2VybmVsIG1vZHVsZSB3aGVyZSBzdWNoCj4+IHRoaW5ncyBubyBsb25nZXIgd2Fy
biwgdGhleSBibG93IHRoZSBib3ggb3V0IG9mIHRoZSB3YXRlci4KPiBCVFcsIHR1cm4gdGhhdCBp
cmtzb21lIFdBUk5fT05fT05DRSgpIGluIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBp
bnRvIGEgV0FSTl9PTkNFKCksIGFuZCBhbGwgaXMgcGVhY2h5LCB5b3UgZ2V0IHRoZSB3YXJuaW5n
LCBib3ggbGl2ZXMuCj4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgfCAg
ICAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fdmJsYW5rLmMKPiBAQCAtNjA1LDcgKzYwNSw4IEBAIGJvb2wgZHJtX2NhbGNf
dmJsdGltZXN0YW1wX2Zyb21fc2Nhbm91dHAKPiAgIAkgKi8KPiAgIAlpZiAobW9kZS0+Y3J0Y19j
bG9jayA9PSAwKSB7Cj4gICAJCURSTV9ERUJVRygiY3J0YyAldTogTm9vcCBkdWUgdG8gdW5pbml0
aWFsaXplZCBtb2RlLlxuIiwgcGlwZSk7Cj4gLQkJV0FSTl9PTl9PTkNFKGRybV9kcnZfdXNlc19h
dG9taWNfbW9kZXNldChkZXYpKTsKPiArCQlXQVJOX09OQ0UoZHJtX2Rydl91c2VzX2F0b21pY19t
b2Rlc2V0KGRldiksICIlczogcmVwb3J0IG1lLlxuIiwKPiArCQkJICBkZXYtPmRyaXZlci0+bmFt
ZSk7Cj4gICAKPiAgIAkJcmV0dXJuIGZhbHNlOwo+ICAgCX0KCgpIZXksCgpjb25maXJtZWQgdGhp
cyBoZWxwcyBzYXZpbmcgdGhlIGJveCwgYnV0IHdlIHN0aWxsIGhhdmUgdG8gZmluZCB0aGUgcm9v
dCAKY2F1c2UhIEJhY2t0cmFjZSB3aXRoIHRoZSBhYm92ZSBmaXggYXBwbGllZCAoYW5kIHRoZSBv
bmUgd2hpY2ggY2FtZSBpbiAKd2l0aCB0aGUgbGF0ZXN0IGRybS1maXhlcyBtZXJnZSkhCgoKWzFd
IGh0dHBzOi8vaGFzdGViaW4uY29tL3V5b3FpZmlqZWQuaHR0cAoKVGhhbmtzLAoKVG9iaWFzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
