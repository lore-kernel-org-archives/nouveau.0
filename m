From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: hmm_range_fault related fixes and legacy API removal
 v2
Date: Mon, 8 Jul 2019 17:32:24 +0000
Message-ID: <20190708173219.GL23966@mellanox.com>
References: <20190703220214.28319-1-hch@lst.de>
 <20190704164236.GP3401@mellanox.com>
 <41dbb308-fc9e-d730-ffb0-6ce051dff1e1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <41dbb308-fc9e-d730-ffb0-6ce051dff1e1-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Content-ID: <F61E600089470D4898FBE87BCA1D4B71-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTA6MzA6NTVBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6DQo+IA0KPiBPbiA3LzQvMTkgOTo0MiBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0K
PiA+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDAzOjAyOjA4UE0gLTA3MDAsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOg0KPiA+ID4gSGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sDQo+ID4gPiAN
Cj4gPiA+IGJlbG93IGlzIGEgc2VyaWVzIGFnYWluc3QgdGhlIGhtbSB0cmVlIHdoaWNoIGZpeGVz
IHVwIHRoZSBtbWFwX3NlbQ0KPiA+ID4gbG9ja2luZyBpbiBub3V2ZWF1IGFuZCB3aGlsZSBhdCBp
dCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzDQo+ID4gPiBvbmx5IHVzZWQg
Ynkgbm91dmVhdS4NCj4gPiA+IA0KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gPiA+ICAgLSBk
b24ndCByZXR1cm4gdGhlIHZhbGlkIHN0YXRlIGZyb20gaG1tX3JhbmdlX3VucmVnaXN0ZXINCj4g
PiA+ICAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMNCj4gPiANCj4gPiBSYWxwaCwgc2lu
Y2UgbW9zdCBvZiB0aGlzIGlzIG5vdXZlYXUgY291bGQgeW91IGNvbnRyaWJ1dGUgYQ0KPiA+IFRl
c3RlZC1ieT8gVGhhbmtzDQo+ID4gDQo+ID4gSmFzb24NCj4gPiANCj4gDQo+IEkgY2FuIHRlc3Qg
dGhpbmdzIGZhaXJseSBlYXNpbHkgYnV0IHdpdGggYWxsIHRoZSBkaWZmZXJlbnQgcGF0Y2hlcywN
Cj4gY29uZmxpY3RzLCBhbmQgcGVyc29uYWwgZ2l0IHRyZWVzLCBjYW4geW91IHNwZWNpZnkgdGhl
IGdpdCB0cmVlDQo+IGFuZCBicmFuY2ggd2l0aCBldmVyeXRoaW5nIGFwcGxpZWQgdGhhdCB5b3Ug
d2FudCBtZSB0byB0ZXN0Pw0KDQpUaGlzIHNlcmllcyB3aWxsIGJlIHB1c2hlZCB0byB0aGUgbmV4
dCBjeWNsZSwgc28gaWYgeW91IHRlc3QgdjUuMy1yYzENCisgdGhpcyBzZXJpZXMgeW91J2QgZ2V0
IHRoZSByaWdodCBjb3ZlcmFnZS4NCg0KVGhhbmtzLA0KSmFzb24NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
