From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 09/22] memremap: lift the devmap_enable
 manipulation into devm_memremap_pages
Date: Thu, 13 Jun 2019 19:34:31 +0000
Message-ID: <20190613193427.GU22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-10-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190613094326.24093-10-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <2494E1C39D43164DA0596E93A4038E37-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MTJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSnVzdCBjaGVjayBpZiB0aGVyZSBpcyBhIC0+cGFnZV9mcmVlIG9wZXJhdGlv
biBzZXQgYW5kIHRha2UgY2FyZSBvZiB0aGUKPiBzdGF0aWMga2V5IGVuYWJsZSwgYXMgd2VsbCBh
cyB0aGUgcHV0IHVzaW5nIGRldmljZSBtYW5hZ2VkIHJlc291cmNlcy4KPiBkaWZmIC0tZ2l0IGEv
bW0vaG1tLmMgYi9tbS9obW0uYwo+IGluZGV4IGM3NmExYjVkZWZkYS4uNmRjNzY5ZmViMmUxIDEw
MDY0NAo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTEzNzgsOCArMTM3OCw2IEBAIHN0cnVjdCBobW1f
ZGV2bWVtICpobW1fZGV2bWVtX2FkZChjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywK
PiAgCXZvaWQgKnJlc3VsdDsKPiAgCWludCByZXQ7Cj4gIAo+IC0JZGV2X3BhZ2VtYXBfZ2V0X29w
cygpOwo+IC0KCldoZXJlIHdhcyB0aGUgbWF0Y2hpbmcgZGV2X3BhZ2VtYXBfcHV0X29wcygpIGZv
ciB0aGlzIGhtbSBjYXNlPyBUaGlzCmlzIGEgYnVnIGZpeCB0b28/CgpUaGUgbm91dmVhdSBkcml2
ZXIgaXMgdGhlIG9ubHkgb25lIHRvIGFjdHVhbGx5IGNhbGwgdGhpcyBobW0gZnVuY3Rpb24KYW5k
IGl0IGRvZXMgaXQgYXMgcGFydCBvZiBhIHByb2JlIGZ1bmN0aW9uLiAKClNlZW1zIHJlYXNvbmFi
bGUsIGhvd2V2ZXIsIGluIHRoZSB1bmxpa2VseSBldmVudCB0aGF0IGl0IGZhaWxzIHRvIGluaXQK
J2RtZW0nIHRoZSBkcml2ZXIgd2lsbCByZXRhaW4gYSBkZXZfcGFnZW1hcF9nZXRfb3BzIHVudGls
IGl0IHVubG9hZHMuClRoaXMgaW1iYWxhbmNlIGRvZXNuJ3Qgc2VlbSB3b3J0aCB3b3JyeWluZyBh
Ym91dC4KClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
