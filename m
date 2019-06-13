From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 21/22] mm: remove the HMM config option
Date: Thu, 13 Jun 2019 20:01:55 +0000
Message-ID: <20190613200150.GB22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-22-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190613094326.24093-22-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <4F4AB6FDDD24014F95455A97A0E953B7-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MjRBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQWxsIHRoZSBtbS9obW0uYyBjb2RlIGlzIGJldHRlciBrZXllZCBvZmYgSE1N
X01JUlJPUi4gIEFsc28gbGV0IG5vdXZlYXUKPiBkZXBlbmQgb24gaXQgaW5zdGVhZCBvZiB0aGUg
bWl4IG9mIGEgZHVtbXkgZGVwZW5kZW5jeSBzeW1ib2wgcGx1cyB0aGUKPiBhY3R1YWxseSBzZWxl
Y3RlZCBvbmUuICBEcm9wIHZhcmlvdXMgb2RkIGRlcGVuZGVuY2llcywgYXMgdGhlIGNvZGUgaXMK
PiBwcmV0dHkgcG9ydGFibGUuCgpJIGRvbid0IHJlYWxseSBrbm93LCBidXQgSSB0aG91Z2h0IHRo
aXMgbmVlZGVkIHRoZSBhcmNoIHJlc3RyaWN0aW9uCmZvciB0aGUgc2FtZSByZWFzb24gZ2V0X3Vz
ZXJfcGFnZXMgaGFzIHZhcmlvdXMgdW5pcXVlIGFyY2ggc3BlY2lmaWMKaW1wbGVtZW50YXRpb25z
IChpdCBkb2VzIHNlZW0gdG8gaGF2ZSBzb21lIG9wZW4gY29kZWQgR1VQIGxpa2UgdGhpbmcpPwoK
SSB3YXMgaG9waW5nIHdlIGNvdWxkIGRvIHRoaXMgYWZ0ZXIgeW91ciBjb21tb24gZ3VwIHNlcmll
cz8gQnV0IHNvb25lcgppcyBiZXR0ZXIgdG9vLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
