From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 06/22] mm: factor out a
 devm_request_free_mem_region helper
Date: Sat, 15 Jun 2019 16:30:43 +0200
Message-ID: <20190615143043.GA27825@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-7-hch@lst.de>
 <56c130b1-5ed9-7e75-41d9-c61e73874cb8@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56c130b1-5ed9-7e75-41d9-c61e73874cb8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDc6MjE6NTRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvMTMvMTkgMjo0MyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBL
ZWVwIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFsbG9jYXRpb24gdGhhdCBobW1fYWRkX2RldmljZSBk
b2VzIHdpdGggdGhlCj4gPiByZXN0IG9mIHRoZSByZXNvdXJjZSBjb2RlLCBhbmQgYWxsb3cgZnV0
dXJlIHJldXNlIG9mIGl0IHdpdGhvdXQgdGhlIGhtbQo+ID4gd3JhcHBlci4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAtLS0KPiA+ICBp
bmNsdWRlL2xpbnV4L2lvcG9ydC5oIHwgIDIgKysKPiA+ICBrZXJuZWwvcmVzb3VyY2UuYyAgICAg
IHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgbW0vaG1t
LmMgICAgICAgICAgICAgICB8IDMzICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4g
Cj4gU29tZSB0cml2aWFsIHR5cG9zIG5vdGVkIGJlbG93LCBidXQgdGhpcyBhY2N1cmF0ZWx5IG1v
dmVzIHRoZSBjb2RlCj4gaW50byBhIGhlbHBlciByb3V0aW5lLCBsb29rcyBnb29kLgoKVGhhbmtz
IGZvciB0aGUgdHlwbyBzcG90dGluZy4gIFRoZXNlIHR3byBhY3R1YWxseSB3ZXJlIGNvcHkgYW5k
IHBhc3RlZApmcm9tIHRoZSBvcmlnaW5hbCBobW0gY29kZSwgYnV0IEknbGwgZ2xhZGx5IGZpeCB0
aGVtIGZvciB0aGUgbmV4dAppdGVyYXRpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
