From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: dev_pagemap related cleanups
Date: Thu, 13 Jun 2019 23:10:45 +0000
Message-ID: <20190613231039.GE22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190613204043.GD22062@mellanox.com> <20190613212101.GA27174@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190613212101.GA27174-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <9DD504E2832E244190B09BBD35CAF05D-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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
Cc: linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6MjE6MDFQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6NDA6NDZQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBQZXJoYXBzIHdlIHNob3VsZCBwdWxsIHRob3NlIG91
dCBhbmQgcmVzZW5kIHRoZW0gdGhyb3VnaCBobW0uZ2l0Pwo+ID4gCj4gPiBJdCBjb3VsZCBiZSBk
b25lIC0gYnV0IGhvdyBiYWQgaXMgdGhlIGNvbmZsaWN0IHJlc29sdXRpb24/Cj4gCj4gVHJpdmlh
bC4gIEFsbCBidXQgb25lIHBhdGNoIGp1c3QgYXBwbHkgdXNpbmcgZ2l0LWFtLCBhbmQgdGhlIG90
aGVyIG9uZQo+IGp1c3QgaGFzIGEgZmV3IGxpbmVzIG9mIG9mZnNldHMuCgpPa2F5LCBOUCB0aGVu
LCB0cml2aWFsIG9uZXMgYXJlIE9LIHRvIHNlbmQgdG8gTGludXMuLgoKSWYgQW5kcmV3IGdldHMg
dGhlbSBpbnRvIC1yYzUgdGhlbiBJIHdpbGwgZ2V0IHJjNSBpbnRvIGhtbS5naXQgbmV4dAp3ZWVr
LgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
