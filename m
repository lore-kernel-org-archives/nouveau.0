From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
Date: Sat, 17 Aug 2019 08:11:03 +0200
Message-ID: <20190817061103.GA18179@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
 <20190810111308.GB26349@lst.de>
 <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
 <20190816071132.GA7513@lst.de>
 <CABDvA=n4Y0QticHZowEWFOqiEB3p99nV71GvHAySYdkcgw-Aow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABDvA=n4Y0QticHZowEWFOqiEB3p99nV71GvHAySYdkcgw-Aow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMTE6MDU6MzZBTSArMTAwMCwgQmVuIFNrZWdncyB3cm90
ZToKPiA+ID4+IGNvbnN0YW50cyB3aXRoIHNpbWlsYXIgbmFtZXMgYW5kIGlkZW50aWNhbCB2YWx1
ZXMsIGFuZCB0aG9zZSBhcmUgdXNlZAo+ID4gPj4gaW4gbW11L3ZtbWdwMTAwLmMgYW5kIHdoYXQg
YXBwZWFycyB0byBmaW5hbGx5IGRvIHRoZSBsb3ctbGV2ZWwgZG1hCj4gPiA+PiBtYXBwaW5nIGFu
ZCB0YWxraW5nIHRvIHRoZSBoYXJkd2FyZS4gIEFyZSB0aGVzZSB0d28gc2V0cyBvZiBjb25zdGFu
dHMKPiA+ID4+IHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lPyAgQXJlIHRoZSBhY3R1YWwgaGFyZHdh
cmUgdmFsdWVzIG9yIGp1c3QgYQo+ID4gPj4gZHJpdmVyIGludGVybmFsIGludGVyZmFjZT8KPiA+
ID4KPiA+ID4gSXQgbG9va3MgYSBiaXQgb2RkIHRvIG1lIHRvby4KPiA+ID4gSSBkb24ndCByZWFs
bHkga25vdyB0aGUgc3RydWN0dXJlL2hpc3Rvcnkgb2Ygbm91dmVhdS4KPiA+ID4gUGVyaGFwcyBC
ZW4gU2tlZ2dzIGNhbiBzaGVkIG1vcmUgbGlnaHQgb24geW91ciBxdWVzdGlvbi4KPiA+Cj4gPiBC
ZW4sIGRvIHlvdSBoYXZlIGFueSBpbnNpZ2h0cyBvbiB0aGVzZSBjb25zdGFudHM/Cj4gVGhvc2Ug
c2V0cyBvZiBjb25zdGFudHMgYXJlIChjdXJyZW50bHkpIHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1l
IHZhbHVlLgo+IFRoZXkgZG9uJ3QgbmVjZXNzYXJpbHkgbWFwIHRvIHRoZSBIVyBkaXJlY3RseSBh
dCB0aGlzIHN0YWdlLCBhbmQKPiBzb21ldGhpbmcgZGlmZmVyZW50IHdpbGwgbGlrZWx5IGJlIGRv
bmUgaW4gdGhlIGZ1dHVyZSBhcyBIVyBjaGFuZ2VzLgoKU28gd2h5IGRvIHdlIGhhdmUgdHdvIHNl
dHMgb2YgY29uc3RhbnRzIGluc3RlYWQgb2Ygb25lIHNldCBmb3IgdGhlc2UKdmFsdWVzPyAgVGhh
dCBtYWtlcyB0cnlpbmcgdG8gZm9sbG93IHRoZSBjb2RlIHByZXR0eSBoYXJkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
