From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 17/22] mm: remove hmm_devmem_add
Date: Thu, 13 Jun 2019 19:42:43 +0000
Message-ID: <20190613194239.GX22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-18-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190613094326.24093-18-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <4271DAA2E22D344AB96571BECBECE6B2-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MjBBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlcmUgaXNuJ3QgcmVhbGx5IG11Y2ggdmFsdWUgYWRkIGluIHRoZSBobW1f
ZGV2bWVtX2FkZCB3cmFwcGVyLiAgSnVzdAo+IGZhY3RvciBvdXQgYSBsaXR0bGUgaGVscGVyIHRv
IGZpbmQgdGhlIHJlc291cmNlLCBhbmQgb3RoZXJ3aXNlIGxldCB0aGUKPiBkcml2ZXIgaW1wbGVt
ZW50IHRoZSBkZXZfcGFnZW1hcF9vcHMgZGlyZWN0bHkuCgpXYXMgdGhpcyBjb21taXQgbWVzc2Fn
ZSB3cml0dGVuIHdoZW4gb3RoZXIgcGF0Y2hlcyB3ZXJlIHNxdWFzaGVkIGluCmhlcmU/IEkgdGhp
bmsgdGhlIGhlbHBlciB0aGlzIG1lbnRpb25zIHdhcyBmcm9tIGFuIGVhcmxpZXIgcGF0Y2gKCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vdm0vaG1tLnJzdCB8ICAyNiAtLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2ht
bS5oICAgICAgfCAxMjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IG1tL2htbS5jICAgICAgICAgICAgICAgICB8IDExNSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjcwIGRlbGV0aW9ucygtKQoKSSBsb29rZWQg
Zm9yIGluLWZsaWdodCBwYXRjaGVzIHRoYXQgbWlnaHQgYmUgdXNpbmcgdGhlc2UgQVBJcyBhbmQK
Zm91bmQgbm90aGluZy4gVG8gYmUgc2VudCBwYXRjaGVzIGNhbiB1c2UgdGhlIG5ldyBBUEkgd2l0
aCBubyBsb3NzIGluCmZ1bmN0aW9uYWxpdHkuLi4KClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
