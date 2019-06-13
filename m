From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: dev_pagemap related cleanups
Date: Thu, 13 Jun 2019 14:16:27 +0000
Message-ID: <20190613141622.GE22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190613094326.24093-1-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <3F56F1D2ECF2EA44ADBAB2BD95ADFE6F-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MDNBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIERhbiwgSsOpcsO0bWUgYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgdGhhdCBjbGVhbnMgdXAgdGhlIGRldl9wYWdlbWFwIGludGVyZmFjZSBzbyB0aGF0
DQo+IGl0IGlzIG1vcmUgZWFzaWx5IHVzYWJsZSwgd2hpY2ggcmVtb3ZlcyB0aGUgbmVlZCB0byB3
cmFwIGl0IGluIGhtbQ0KPiBhbmQgdGh1cyBhbGxvd2luZyB0byBraWxsIGEgbG90IG9mIGNvZGUN
Cg0KRG8geW91IHdhbnQgc29tZSBvZiB0aGlzIHRvIHJ1biB0aHJvdWdoIGhtbS5naXQ/IEkgc2Vl
IG1hbnkgcGF0Y2hlcw0KdGhhdCBkb24ndCBzZWVtIHRvIGhhdmUgaW50ZXItZGVwZW5kZW5jaWVz
Li4NCg0KVGhhbmtzLA0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW52ZGltbSBtYWlsaW5nIGxpc3QKTGludXgtbnZkaW1tQGxpc3Rz
LjAxLm9yZwpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW52ZGlt
bQo=
