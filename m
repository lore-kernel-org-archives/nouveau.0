From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events
Date: Wed, 2 Dec 2015 09:55:26 +0100
Message-ID: <20151202085526.GA17050@phenom.ffwll.local>
References: <1446242140-6766-1-git-send-email-daniel.vetter@ffwll.ch>
 <5637147C.6010802@daenzer.net>
 <20151116151100.GU16848@phenom.ffwll.local>
 <CAF+9+UOe=vj0PGJZ21orH4BAkSYJO294qrJY_2vWTJvqQbi9ZQ@mail.gmail.com>
 <20151201155519.GW17050@phenom.ffwll.local>
 <565DD933.4010004@gmail.com>
 <CAF+9+UPxVnRU_RJLTpr6qVFZU8A3oz9pzMF_yStjk5gBpharkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAF+9+UPxVnRU_RJLTpr6qVFZU8A3oz9pzMF_yStjk5gBpharkg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: poma <pomidorabelisima@gmail.com>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, DRI Development <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBEZWMgMDIsIDIwMTUgYXQgMDY6NDA6MzJBTSArMDEwMCwgcG9tYSB3cm90ZToKPiBP
biBUdWUsIERlYyAxLCAyMDE1IGF0IDY6MzAgUE0sIE1hcmlvIEtsZWluZXIKPiA8bWFyaW8ua2xl
aW5lci5kZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gV2hlbiB3ZSBhcmUgYXQgaXQsIHRoZSBvbmUg
d2l0aCB0aGUgdGl0bGUgIltQQVRDSF0gZHJtL25vdXZlYXU6IFVzZQo+ID4gZHJtX3ZibGFua19v
bi9vZmYgY29uc2lzdGVudGx5IiBmcm9tIERhbmllbCwgd2hpY2ggaGFzIGEgcmV2aWV3ZWQgYW5k
IHRlc3RlZAo+ID4gYnkgbWUgYWxzbyBuZXZlciBtYWRlIGl0IGludG8gbm91dmVhdS4KPiA+Cj4g
PiBNYXliZSBwaWNrIHRoYXQgdXAgYXMgd2VsbD8KPiA+Cj4gPiAtbWFyaW8KPiA+Cj4gCj4gSWYg
eW91IHJlZmVyIHRvCj4gIlsxLzNdIGRybS9ub3V2ZWF1OiBVc2UgZHJtX3ZibGFua19vbi9vZmYg
Y29uc2lzdGVudGx5Igo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81
MDc3MQo+IAo+IHRoaXMgaXMgdGhlIHJlc3VsdDoKPiBwYXRjaGVkIDQuNC4wLTAucmMzLmdpdDAu
MS5mYzI0Lng4Nl82NCB3aXRoIGl0LAo+IGkuZS4gMS0zLWRybS1ub3V2ZWF1LVVzZS1kcm1fdmJs
YW5rX29uLW9mZi1jb25zaXN0ZW50bHkucGF0Y2gKPiAKPiAjIGNhdCAvdmFyL2xvZy9Yb3JnLjAu
bG9nCj4gWyAgIDEyNi4zNjBdCj4gWC5PcmcgWCBTZXJ2ZXIgMS4xOC4wCj4gLi4uCj4gWyAgIDEy
Ni45MDldIChFRSkgW2RybV0gRmFpbGVkIHRvIG9wZW4gRFJNIGRldmljZSBmb3IgcGNpOjAwMDA6
MDI6MDAuMDogLTE5Cj4gWyAgIDEyNi45MDldIChFRSkgTm8gZGV2aWNlcyBkZXRlY3RlZC4KPiBb
ICAgMTI2LjkwOV0gKEVFKQo+IEZhdGFsIHNlcnZlciBlcnJvcjoKPiBbICAgMTI2LjkwOV0gKEVF
KSBubyBzY3JlZW5zIGZvdW5kKEVFKQo+IFsgICAxMjYuOTA5XSAoRUUpCj4gUGxlYXNlIGNvbnN1
bHQgLi4uLgoKS2VybmVsIGxvZyBuZWVkZWQgaWYgdGhlIGRybSBkZXZpY2UgaXNuJ3QgdGhlcmUu
IEFuZCB0aGlzIGlzIHByZXR0eSBtdWNoCmltcG9zc2libGUsIHdvcnN0IGNhc2UgbW9kZXNldHRp
bmcgaXMgZnVuY3Rpb25hbGx5IGJ1c3RlZC4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
