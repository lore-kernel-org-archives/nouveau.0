From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 1/5] mm: return valid info from
 hmm_range_unregister
Date: Wed, 3 Jul 2019 22:28:57 +0200
Message-ID: <20190703202857.GA15690@lst.de>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-2-hch@lst.de> <20190703190045.GN18688@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190703190045.GN18688-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
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
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDc6MDA6NTBQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgZG9uJ3QgdGhpbmsgdGhlIEFQSSBzaG91bGQgYmUgZW5jb3VyYWdpbmcgc29t
ZSBzaG9ydGN1dCBoZXJlLi4KPiAKPiBXZSBjYW4ndCBkbyB0aGUgYWJvdmUgcGF0dGVybiBiZWNh
dXNlIHRoZSBvbGQgaG1tX3ZtYSBBUEkgZGlkbid0IGFsbG93Cj4gaXQsIHdoaWNoIGlzIHByZXN1
bWFibHkgYSByZWFzb24gd2h5IGl0IGlzIG9ic29sZXRlLgo+IAo+IEknZCByYXRoZXIgc2VlIGRy
aXZlcnMgbW92ZSB0byBhIGNvbnNpc3RlbnQgcGF0dGVybiBzbyB3ZSBjYW4gdGhlbgo+IGVhc2ls
eSBob2lzdCB0aGUgc2VxY291bnQgbG9jayBzY2hlbWUgaW50byBzb21lIGNvbW1vbiBtbXUgbm90
aWZpZXIKPiBjb2RlLCBhcyBkaXNjdXNzZWQuCgpTbyB5b3UgZG9uJ3QgbGlrZSB0aGUgdmVyc2lv
biBpbiBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUgaW4KbGludXgtbmV4dCBlaXRo
ZXI/CgpJIGNhbiByZW1vdmUgdGhpcyBhbmQganVzdCBtb3ZlIGhtbV92bWFfcmFuZ2VfZG9uZSB0
byBub3V2ZWF1IGluc3RlYWQuCkxldCBtZSBrbm93IGlmIHlvdSBoYXZlIG90aGVyIGNvbW1lbnRz
IGJlZm9yZSBJIHJlc2VuZC4gIE5vdGUgdGhhdApJJ2xsIHByb2JhYmx5IGJlIG9mZmxpbmUgVGh1
LVN1biB0aGlzIHdlZWsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
