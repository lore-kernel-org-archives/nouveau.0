From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 01/10] mm: turn migrate_vma upside down
Date: Sat, 17 Aug 2019 12:50:06 +0000
Message-ID: <20190817125002.GB10068@mellanox.com>
References: <20190814075928.23766-1-hch@lst.de>
 <20190814075928.23766-2-hch@lst.de> <20190816171101.GK5412@mellanox.com>
 <20190817113128.GA23295@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190817113128.GA23295-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <1695A1151C0F3641B6BBDBD97CAD2365-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDE6MzE6MjhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDU6MTE6MDdQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gLQlpZiAoYXJncy0+Y3BhZ2VzKQo+ID4gLQkJbWlncmF0
ZV92bWFfcHJlcGFyZShhcmdzKTsKPiA+IC0JaWYgKGFyZ3MtPmNwYWdlcykKPiA+IC0JCW1pZ3Jh
dGVfdm1hX3VubWFwKGFyZ3MpOwo+ID4gKwlpZiAoIWFyZ3MtPmNwYWdlcykKPiA+ICsJCXJldHVy
biAwOwo+ID4gKwo+ID4gKwltaWdyYXRlX3ZtYV9wcmVwYXJlKGFyZ3MpOwo+ID4gKwltaWdyYXRl
X3ZtYV91bm1hcChhcmdzKTsKPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgb2suICBCb3RoIG1p
Z3JhdGVfdm1hX3ByZXBhcmUgYW5kIG1pZ3JhdGVfdm1hX3VubWFwCj4gY2FuIHJlZHVjZSBhcmdz
LT5jcGFnZXMsIGluY2x1ZGluZyBwb3NzaWJseSB0byAwLgoKT2gsIHllcywgdGhhdCB3YXMgZmFy
IHRvbyBoYXN0eSBvbiBteSBwYXJ0LCBJIGhhZCBhc3N1bWVkIGNvbGxlY3Qgc2V0CnRoZSBjcGFn
ZXMuIFRoYW5rIHlvdSBmb3IgY2hlY2tpbmcKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQ==
