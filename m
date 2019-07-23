From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Date: Tue, 23 Jul 2019 15:27:41 +0000
Message-ID: <20190723152737.GO15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094426.18563-1-hch@lst.de>
Content-Language: en-US
Content-ID: <26A6F7202CFF03408F66F9FA8B336B7C@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NDQ6MjBBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2Vt
DQo+IGxvY2tpbmcgaW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRv
dmVyIGxlZ2FjeSBITU0gQVBJcw0KPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4NCj4gDQo+IFRoZSBm
aXJzdCA0IHBhdGNoZXMgYXJlIGEgYnVnIGZpeCBmb3Igbm91dmVhdSwgd2hpY2ggSSBzdXNwZWN0
IHNob3VsZA0KPiBnbyBpbnRvIHRoaXMgbWVyZ2Ugd2luZG93IGV2ZW4gaWYgdGhlIGNvZGUgaXMg
bWFya2VkIGFzIHN0YWdpbmcsIGp1c3QNCj4gdG8gYXZvaWQgcGVvcGxlIGNvcHlpbmcgdGhlIGJy
ZWFrYWdlLg0KDQpJZ25vcmluZyB0aGUgU1RBR0lORyBpc3N1ZSBJJ3ZlIHRyaWVkIHRvIHVzZSB0
aGUgc2FtZSBndWlkZWxpbmUgYXMgZm9yDQotc3RhYmxlIGZvciAtcmMgLi4gDQoNClNvIHRoaXMg
aXMgYSByZWFsIHByb2JsZW0sIHdlIGRlZmluaXRlbHkgaGl0IHRoZSBsb2NraW5nIGJ1Z3MgaWYg
d2UNCnJldHJ5L2V0YyB1bmRlciBzdHJlc3MsIHNvIEkgd291bGQgYmUgT0sgdG8gc2VuZCBpdCB0
byBMaW51cyBmb3INCmVhcmx5LXJjLg0KDQpIb3dldmVyLCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB0
aGUgMXN0IHBhdGNoIGlzIGZpeGluZyBhIGN1cnJlbnQgYnVnDQp0aG91Z2gsIHRoZSBvbmx5IGNh
bGxlcnMgdXNlcyBibG9ja2luZyA9IHRydWUsIHNvIGp1c3QgdGhlIG1pZGRsZQ0KdGhyZWUgYXJl
IC1yYz8NCg0KVGhhbmtzLA0KSmFzb24NCg==
