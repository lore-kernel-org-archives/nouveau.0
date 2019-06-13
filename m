From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 08/22] memremap: pass a struct dev_pagemap to
 ->kill
Date: Thu, 13 Jun 2019 19:26:20 +0000
Message-ID: <20190613192615.GT22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-9-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190613094326.24093-9-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <6555DEAFF3F4AF4A941D63DB429D69BC-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MTFBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gUGFzc2luZyB0aGUgYWN0dWFsIHR5cGVkIHN0cnVjdHVyZSBsZWFkcyB0byBt
b3JlIHVuZGVyc3RhbmRhYmxlIGNvZGUKPiB2cyB0aGUgYWN0dWFsIHJlZmVyZW5jZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gIGRyaXZlcnMv
ZGF4L2RldmljZS5jICAgICAgICAgICAgICB8IDcgKysrLS0tLQo+ICBkcml2ZXJzL252ZGltbS9w
bWVtLmMgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICBkcml2ZXJzL3BjaS9wMnBkbWEuYyAgICAg
ICAgICAgICAgfCA2ICsrKy0tLQo+ICBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggICAgICAgICAg
fCAyICstCj4gIGtlcm5lbC9tZW1yZW1hcC5jICAgICAgICAgICAgICAgICB8IDQgKystLQo+ICBt
bS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgdG9vbHMvdGVzdGlu
Zy9udmRpbW0vdGVzdC9pb21hcC5jIHwgNiArKy0tLS0KPiAgNyBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Rh
eC9kZXZpY2UuYyBiL2RyaXZlcnMvZGF4L2RldmljZS5jCj4gaW5kZXggNGFkYWI3NzRkYWRlLi5l
MjNmYTFiZDhjOTcgMTAwNjQ0Cj4gKysrIGIvZHJpdmVycy9kYXgvZGV2aWNlLmMKPiBAQCAtMzcs
MTMgKzM3LDEyIEBAIHN0YXRpYyB2b2lkIGRldl9kYXhfcGVyY3B1X2V4aXQodm9pZCAqZGF0YSkK
PiAgCXBlcmNwdV9yZWZfZXhpdChyZWYpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBkZXZfZGF4
X3BlcmNwdV9raWxsKHN0cnVjdCBwZXJjcHVfcmVmICpkYXRhKQo+ICtzdGF0aWMgdm9pZCBkZXZf
ZGF4X3BlcmNwdV9raWxsKHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCj4gIHsKCkxvb2tzIGxp
a2UgaXQgd2FzIGFsd2F5cyBsaWtlIHRoaXMsIGJ1dCBJIGFsc28gY2FuJ3Qgc2VlIGEgcmVhc29u
IHRvCnVzZSB0aGUgcGVyY3B1IGFzIGEgaGFuZGxlIGZvciBhIGRldl9wYWdlbWFwIGNhbGxiYWNr
LgoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
