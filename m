From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/25] memremap: move dev_pagemap callbacks into a
 separate structure
Date: Mon, 17 Jun 2019 14:09:24 -0700
Message-ID: <CAPcyv4iYP-7QtO7hDkAeaxJsfUCrCTBSJi3bK6e5v-VVAKQz-w@mail.gmail.com>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
 <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
 <20190617195526.GB20275@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190617195526.GB20275-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6NTkgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NTE6MzVBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiAtICAgICAgIHN0cnVjdCBkZXZfcGFnZW1hcCAq
cGdtYXAgPSBfcGdtYXA7Cj4gPgo+ID4gV2hvb3BzLCBuZWVkZWQgdG8ga2VlcCB0aGlzIGxpbmUg
dG8gYXZvaWQ6Cj4gPgo+ID4gdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jOjEwOTox
MTogZXJyb3I6IOKAmHBnbWFw4oCZIHVuZGVjbGFyZWQKPiA+IChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhfcGdtYXDigJk/Cj4KPiBTbyBJIHJlYWxseSBzaG91
bGRuJ3QgYmUgdHJpcHBpbmcgb3ZlciB0aGlzIGFueW1vcmUsIGJ1dCBjYW4gd2Ugc29tZWhvdwo+
IHRoaXMgbWVzcz8KPgo+ICAtIGF0IGxlYXN0IGFkZCBpdCB0byB0aGUgbm9ybWFsIGJ1aWxkIHN5
c3RlbSBhbmQga2NvbmZpZyBkZXBzIGluc3RlYWQKPiAgICBvZiBzdGFzaGluZyBpdCBhd2F5IHNv
IHRoYXQgdGhpbmdzIGxpa2UgYnVpbGRib3QgY2FuIGJ1aWxkIGl0Pwo+ICAtIGF0IGxlYXN0IGFs
bG93IGJ1aWxkaW5nIGl0ICh1bmRlciBDT01QSUxFX1RFU1QpIGlmIG5lZWRlZCBldmVuIHdoZW4K
PiAgICBwbWVtLmtvIGFuZCBmcmllbmRzIGFyZSBidWlsdCBpbiB0aGUga2VybmVsPwoKRG9uZTog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTAwMDQ3Ny8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbnZkaW1tIG1haWxpbmcg
bGlzdApMaW51eC1udmRpbW1AbGlzdHMuMDEub3JnCmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbnZkaW1tCg==
