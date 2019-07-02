From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: dev_pagemap related cleanups v4
Date: Wed, 3 Jul 2019 00:47:31 +0200
Message-ID: <20190702224731.GA23841@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701082517.GA22461@lst.de> <20190702184201.GO31718@mellanox.com>
 <2807E5FD2F6FDA4886F6618EAC48510E79DEA747@CRSMSX101.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E79DEA747-8k97q/ur5Z2krb+BlOpmy7fspsVTdybXVpNB7YpNyf8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "Weiny, Ira" <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Williams,
 Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMTA6NDU6MzRQTSArMDAwMCwgV2VpbnksIElyYSB3cm90
ZToKPiA+IAo+ID4gT24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTA6MjU6MTdBTSArMDIwMCwgQ2hy
aXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IEFuZCBJJ3ZlIGRlbW9uc3RyYXRlZCB0aGF0IEkg
Y2FuJ3Qgc2VuZCBwYXRjaCBzZXJpZXMuLiAgV2hpbGUgdGhpcyBoYXMKPiA+ID4gYWxsIHRoZSBy
aWdodCBwYXRjaGVzLCBpdCBhbHNvIGhhcyB0aGUgZXh0cmEgcGF0Y2hlcyBhbHJlYWR5IGluIHRo
ZQo+ID4gPiBobW0gdHJlZSwgYW5kIGZvdXIgZXh0cmEgcGF0Y2hlcyBJIHdhbnRlZCB0byBzZW5k
IG9uY2UgdGhpcyBzZXJpZXMgaXMKPiA+ID4gbWVyZ2VkLiAgSSdsbCBnaXZlIHVwIGZvciBub3cs
IHBsZWFzZSB1c2UgdGhlIGdpdCB1cmwgZm9yIGFueXRoaW5nCj4gPiA+IHNlcmlvdXMsIGFzIGl0
IGNvbnRhaW5zIHRoZSByaWdodCB0aGluZy4KPiA+IAo+ID4gT2theSwgSSBzb3J0ZWQgaXQgYWxs
IG91dCBhbmQgdGVtcG9yYXJpbHkgcHV0IGl0IGhlcmU6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvaG1tCj4gPiAKPiA+IEJpdCBpbnZvbHZlZCBq
b2I6Cj4gPiAtIFRvb2sgSXJhJ3MgdjQgcGF0Y2ggaW50byBobW0uZ2l0IGFuZCBjb25maXJtZWQg
aXQgbWF0Y2hlcyB3aGF0Cj4gPiAgIEFuZHJldyBoYXMgaW4gbGludXgtbmV4dCBhZnRlciBhbGwg
dGhlIGZpeHVwcwo+IAo+IExvb2tpbmcgYXQgdGhlIGZpbmFsIGJyYW5jaCBzZWVtcyBnb29kLgoK
TG9va3MgZ29vZCB0byBtZSBhcyB3ZWxsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
