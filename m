From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: dev_pagemap related cleanups
Date: Fri, 14 Jun 2019 08:12:47 +0200
Message-ID: <20190614061247.GB7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613141622.GE22062@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190613141622.GE22062-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDI6MTY6MjdQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjAzQU0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gSGkgRGFuLCBKw6lyw7RtZSBhbmQgSmFzb24sCj4gPiAK
PiA+IGJlbG93IGlzIGEgc2VyaWVzIHRoYXQgY2xlYW5zIHVwIHRoZSBkZXZfcGFnZW1hcCBpbnRl
cmZhY2Ugc28gdGhhdAo+ID4gaXQgaXMgbW9yZSBlYXNpbHkgdXNhYmxlLCB3aGljaCByZW1vdmVz
IHRoZSBuZWVkIHRvIHdyYXAgaXQgaW4gaG1tCj4gPiBhbmQgdGh1cyBhbGxvd2luZyB0byBraWxs
IGEgbG90IG9mIGNvZGUKPiAKPiBEbyB5b3Ugd2FudCBzb21lIG9mIHRoaXMgdG8gcnVuIHRocm91
Z2ggaG1tLmdpdD8gSSBzZWUgbWFueSBwYXRjaGVzCj4gdGhhdCBkb24ndCBzZWVtIHRvIGhhdmUg
aW50ZXItZGVwZW5kZW5jaWVzLi4KCkkgdGhpbmsgcnVubmluZyBpdCB0aHJvdWdoIGhtbS5naXQg
bWFrZXMgc2Vuc2UuICBXaGlsZSB0aGVyZSBhcmUgbm90CmFjdHVhbCBmdW5jdGlvbmFsIGRlcGVu
ZGVuY3kgYW5kIGp1c3QgYSBmZXcgY29zbWV0aWMgY29uZmxpY3RzIGtlZXBpbmcKdGhlIGhtbSBz
dHVmZiB0b2dldGhlciBtYWtlcyBhIGxvdCBvZiBzZW5zZS4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
