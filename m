From: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Subject: Re: hmm_range_fault related fixes and legacy API removal
 v2
Date: Tue, 9 Jul 2019 16:33:20 -0300
Message-ID: <20190709193320.GD3422@ziepe.ca>
References: <20190703220214.28319-1-hch@lst.de>
 <20190705123336.GA31543@ziepe.ca> <20190709143038.GA3092@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190709143038.GA3092-jcswGhMUV9g@public.gmane.org>
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
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDQ6MzA6MzhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDI6MDhQ
TSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IEhpIErDqXLDtG1lLCBCZW4g
YW5kIEphc29uLAo+ID4gPiAKPiA+ID4gYmVsb3cgaXMgYSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1t
IHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4gPiA+IGxvY2tpbmcgaW4gbm91dmVh
dSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRvdmVyIGxlZ2FjeSBITU0gQVBJcwo+
ID4gPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4KPiA+Cj4gPiBBcyBtdWNoIGFzIEkgbGlrZSB0aGlz
IHNlcmllcywgaXQgd29uJ3QgbWFrZSBpdCB0byB0aGlzIG1lcmdlIHdpbmRvdywKPiA+IHNvcnJ5
Lgo+IAo+IE5vdGUgdGhhdCBwYXRjaCA0IGZpeGVzIGEgcHJldHR5IHNldmVyZSBsb2NraW5nIGJ1
ZywgYW5kIDEtMyBpcyBqdXN0Cj4gcHJlcGFyYXRpb24gZm9yIHRoYXQuICAKClllcywgSSBrbm93
LCBidXQgdGhhdCBjb2RlIGlzIGFsbCBtYXJrZWQgU1RBR0lORyBsYXN0IEkgc2F3LCBzbyBJCmRv
bid0IGZlZWwgYW4gdXJnZW5jeSB0byBnZXQgc2V2ZXJlIGJ1ZyBmaXhlcyBpbiBmb3IgaXQgYWZ0
ZXIgdGhlCm1lcmdlIHdpbmRvdyBvcGVucy4KCkknZCBsaWtlIHRvIGFwcGx5IGl0IHRvIGhtbS5n
aXQgd2hlbiByYzEgY29tZXMgb3V0IHdpdGggUmFscGgncyB0ZXN0CnJlc3VsdC4uCgpKYXNvbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
