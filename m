From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 08/25] memremap: move dev_pagemap callbacks
 into a separate structure
Date: Mon, 17 Jun 2019 21:55:26 +0200
Message-ID: <20190617195526.GB20275@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
 <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NTE6MzVBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ID4gLSAgICAgICBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwID0gX3BnbWFwOwo+IAo+
IFdob29wcywgbmVlZGVkIHRvIGtlZXAgdGhpcyBsaW5lIHRvIGF2b2lkOgo+IAo+IHRvb2xzL3Rl
c3RpbmcvbnZkaW1tL3Rlc3QvaW9tYXAuYzoxMDk6MTE6IGVycm9yOiDigJhwZ21hcOKAmSB1bmRl
Y2xhcmVkCj4gKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmF9w
Z21hcOKAmT8KClNvIEkgcmVhbGx5IHNob3VsZG4ndCBiZSB0cmlwcGluZyBvdmVyIHRoaXMgYW55
bW9yZSwgYnV0IGNhbiB3ZSBzb21laG93CnRoaXMgbWVzcz8KCiAtIGF0IGxlYXN0IGFkZCBpdCB0
byB0aGUgbm9ybWFsIGJ1aWxkIHN5c3RlbSBhbmQga2NvbmZpZyBkZXBzIGluc3RlYWQKICAgb2Yg
c3Rhc2hpbmcgaXQgYXdheSBzbyB0aGF0IHRoaW5ncyBsaWtlIGJ1aWxkYm90IGNhbiBidWlsZCBp
dD8KIC0gYXQgbGVhc3QgYWxsb3cgYnVpbGRpbmcgaXQgKHVuZGVyIENPTVBJTEVfVEVTVCkgaWYg
bmVlZGVkIGV2ZW4gd2hlbgogICBwbWVtLmtvIGFuZCBmcmllbmRzIGFyZSBidWlsdCBpbiB0aGUg
a2VybmVsPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
