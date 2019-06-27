From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 15/25] memremap: provide an optional internal
 refcount in struct dev_pagemap
Date: Thu, 27 Jun 2019 10:51:35 +0200
Message-ID: <20190627085135.GB11420@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-16-hch@lst.de>
 <20190626214750.GC8399@iweiny-DESK2.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190626214750.GC8399-J5EW/p2F9lUlb2qzJQmr9q2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6NDc6NTBQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+ID4gKwo+ID4gKwkJaW5pdF9jb21wbGV0aW9uKCZwZ21hcC0+ZG9uZSk7Cj4gPiArCQllcnJv
ciA9IHBlcmNwdV9yZWZfaW5pdCgmcGdtYXAtPmludGVybmFsX3JlZiwKPiA+ICsJCQkJZGV2X3Bh
Z2VtYXBfcGVyY3B1X3JlbGVhc2UsIDAsIEdGUF9LRVJORUwpOwo+ID4gKwkJaWYgKGVycm9yKQo+
ID4gKwkJCXJldHVybiBFUlJfUFRSKGVycm9yKTsKPiA+ICsJCXBnbWFwLT5yZWYgPSAmcGdtYXAt
PmludGVybmFsX3JlZjsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJCWlmICghcGdtYXAtPm9wcyB8fCAh
cGdtYXAtPm9wcy0+a2lsbCB8fCAhcGdtYXAtPm9wcy0+Y2xlYW51cCkgewo+ID4gKwkJCVdBUk4o
MSwgIk1pc3NpbmcgcmVmZXJlbmNlIGNvdW50IHRlYXJkb3duIGRlZmluaXRpb25cbiIpOwo+ID4g
KwkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ID4gKwkJfQo+IAo+IEFmdGVyIHRoaXMgc2Vy
aWVzIGFyZSB0aGVyZSBhbnkgdXNlcnMgd2hvIGNvbnRpbnVlIHRvIHN1cHBseSB0aGVpciBvd24K
PiByZWZlcmVuY2Ugb2JqZWN0IGFuZCB0aGVzZSBjYWxsYmFja3M/CgpZZXMsIGZzZGF4IHVzZXMg
dGhlIGJsb2NrIGxheWVyIHJlcXVlc3RfcXVldWUgcmVmZXJlbmNlIGNvdW50LgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
