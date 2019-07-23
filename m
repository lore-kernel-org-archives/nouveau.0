From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: hmm_range_fault related fixes and legacy API removal
 v2
Date: Tue, 23 Jul 2019 15:20:20 +0000
Message-ID: <20190723152015.GN15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <7e1f33d4-4d3b-7927-38d1-b98b22ed4d78@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <7e1f33d4-4d3b-7927-38d1-b98b22ed4d78-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Content-ID: <D009F8CD1C365A4CBB6461E07B6FA753-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDY6MTE6MDRQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6DQo+IA0KPiBPbiA3LzIyLzE5IDI6NDQgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3Rl
Og0KPiA+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiA+IA0KPiA+IGJlbG93IGlzIGEg
c2VyaWVzIGFnYWluc3QgdGhlIGhtbSB0cmVlIHdoaWNoIGZpeGVzIHVwIHRoZSBtbWFwX3NlbQ0K
PiA+IGxvY2tpbmcgaW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRv
dmVyIGxlZ2FjeSBITU0gQVBJcw0KPiA+IG9ubHkgdXNlZCBieSBub3V2ZWF1Lg0KPiA+IA0KPiA+
IFRoZSBmaXJzdCA0IHBhdGNoZXMgYXJlIGEgYnVnIGZpeCBmb3Igbm91dmVhdSwgd2hpY2ggSSBz
dXNwZWN0IHNob3VsZA0KPiA+IGdvIGludG8gdGhpcyBtZXJnZSB3aW5kb3cgZXZlbiBpZiB0aGUg
Y29kZSBpcyBtYXJrZWQgYXMgc3RhZ2luZywganVzdA0KPiA+IHRvIGF2b2lkIHBlb3BsZSBjb3B5
aW5nIHRoZSBicmVha2FnZS4NCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiA+ICAgLSBk
b24ndCByZXR1cm4gdGhlIHZhbGlkIHN0YXRlIGZyb20gaG1tX3JhbmdlX3VucmVnaXN0ZXINCj4g
PiAgIC0gYWRkaXRpb25hbCBub3V2ZWF1IGNsZWFudXBzDQo+ID4gDQo+IA0KPiBJIHJhbiBzb21l
IE9wZW5DTCB0ZXN0cyBmcm9tIEplcm9tZSB3aXRoIG5vdXZlYXUgYW5kIHRoaXMgc2VyaWVzLA0K
PiA1LjMuMC1yYzEsIGFuZCBteSB0d28gSE1NIGZpeGVzOg0KPiAoIm1tL2htbTogZml4IFpPTkVf
REVWSUNFIGFub24gcGFnZSBtYXBwaW5nIHJldXNlIikNCj4gKCJtbS9obW06IEZpeCBiYWQgc3Vi
cGFnZSBwb2ludGVyIGluIHRyeV90b191bm1hcF9vbmUiKQ0KPiANCj4gWW91IGNhbiBhZGQgZm9y
IHRoZSBzZXJpZXM6DQo+IFRlc3RlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlk
aWEuY29tPg0KDQpUaGFua3MsIHdvdWxkIHlvdSBhbHNvIHJlYmFzZSBhbmQgcmVzZW5kIHRoZSBw
YXRjaCBkZWxldGluZyANCnN0cnVjdCBobW1fdXBkYXRlID8NCg0KSmFzb24NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
