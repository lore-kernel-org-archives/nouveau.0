From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Date: Wed, 19 Jun 2019 19:27:25 +0000
Message-ID: <20190619192719.GO9374@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <d2b77ea1-7b27-e37d-c248-267a57441374-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Content-ID: <081C2DB7B7A13A4A93487CC051D6E961-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDY6MjM6MDRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvMTMvMTkgNTo0MyBQTSwgSXJhIFdlaW55IHdyb3RlOgo+ID4gT24gVGh1LCBK
dW4gMTMsIDIwMTkgYXQgMDc6NTg6MjlQTSArMDAwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDEyOjUzOjAyUE0gLTA3MDAsIFJhbHBoIENhbXBi
ZWxsIHdyb3RlOgo+ID4+Pgo+IC4uLgo+ID4+IEh1bSwgc28gdGhlIG9ubHkgdGhpbmcgdGhpcyBj
b25maWcgZG9lcyBpcyBzaG9ydCBjaXJjdWl0IGhlcmU6Cj4gPj4KPiA+PiBzdGF0aWMgaW5saW5l
IGJvb2wgaXNfZGV2aWNlX3B1YmxpY19wYWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQo+ID4+
IHsKPiA+PiAgICAgICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19ERVZfUEFHRU1BUF9PUFMp
ICYmCj4gPj4gICAgICAgICAgICAgICAgIElTX0VOQUJMRUQoQ09ORklHX0RFVklDRV9QVUJMSUMp
ICYmCj4gPj4gICAgICAgICAgICAgICAgIGlzX3pvbmVfZGV2aWNlX3BhZ2UocGFnZSkgJiYKPiA+
PiAgICAgICAgICAgICAgICAgcGFnZS0+cGdtYXAtPnR5cGUgPT0gTUVNT1JZX0RFVklDRV9QVUJM
SUM7Cj4gPj4gfQo+ID4+Cj4gPj4gV2hpY2ggaXMgY2FsbGVkIGFsbCBvdmVyIHRoZSBwbGFjZS4u
IAo+ID4gCj4gPiA8c2lnaD4gIHllcyBidXQgdGhlIGVhcmxpZXIgcGF0Y2g6Cj4gPiAKPiA+IFtQ
QVRDSCAwMy8yMl0gbW06IHJlbW92ZSBobW1fZGV2bWVtX2FkZF9yZXNvdXJjZQo+ID4gCj4gPiBS
ZW1vdmVzIHRoZSBvbmx5IHBsYWNlIHR5cGUgaXMgc2V0IHRvIE1FTU9SWV9ERVZJQ0VfUFVCTElD
Lgo+ID4gCj4gPiBTbyBJIHRoaW5rIGl0IGlzIG9rLiAgRnJhbmtseSBJIHdhcyB3b25kZXJpbmcg
aWYgd2Ugc2hvdWxkIHJlbW92ZSB0aGUgcHVibGljCj4gPiB0eXBlIGFsdG9nZXRoZXIgYnV0IGNv
bmNlcHR1YWxseSBpdCBzZWVtcyBvay4gIEJ1dCBJIGRvbid0IHNlZSBhbnkgdXNlcnMgb2YgaXQK
PiA+IHNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUgY29kZSByYXRoZXIgdGhh
biB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwo+ID4gCj4gPiBJcmEKPiAKPiBUaGF0IHNlZW1zIHJl
YXNvbmFibGUuIEkgcmVjYWxsIHRoYXQgdGhlIGhvcGUgd2FzIGZvciB0aG9zZSBJQk0gUG93ZXIg
OQo+IHN5c3RlbXMgdG8gdXNlIF9QVUJMSUMsIGFzIHRoZXkgaGF2ZSBoYXJkd2FyZS1iYXNlZCBj
b2hlcmVudCBkZXZpY2UgKEdQVSkKPiBtZW1vcnksIGFuZCBzbyB0aGUgbWVtb3J5IHJlYWxseSBp
cyB2aXNpYmxlIHRvIHRoZSBDUFUuIEFuZCB0aGUgSUJNIHRlYW0KPiB3YXMgdGhpbmtpbmcgb2Yg
dGFraW5nIGFkdmFudGFnZSBvZiBpdC4gQnV0IEkgaGF2ZW4ndCBzZWVuIGFueXRoaW5nIG9uCj4g
dGhhdCBmcm9udCBmb3IgYSB3aGlsZS4KCkRvZXMgYW55b25lIGtub3cgd2hvIHRob3NlIHBlb3Bs
ZSBhcmUgYW5kIGNhbiB3ZSBlbmNvdXJhZ2UgdGhlbSB0bwpzZW5kIHNvbWUgcGF0Y2hlcz8gOikK
Ckphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
