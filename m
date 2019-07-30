From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
Date: Tue, 30 Jul 2019 07:46:33 +0200
Message-ID: <20190730054633.GA28515@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de> <20190729233044.GA7171@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190729233044.GA7171-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDc6MzA6NDRQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNToyODo0M1BNICswMzAwLCBDaHJpc3Rv
cGggSGVsbHdpZyB3cm90ZToKPiA+IFRoZSBNSUdSQVRFX1BGTl9XUklURSBpcyBvbmx5IHVzZWQg
bG9jYWxseSBpbiBtaWdyYXRlX3ZtYV9jb2xsZWN0X3BtZCwKPiA+IHdoZXJlIGl0IGNhbiBiZSBy
ZXBsYWNlZCB3aXRoIGEgc2ltcGxlIGJvb2xlYW4gbG9jYWwgdmFyaWFibGUuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IE5BSyB0aGF0
IGZsYWcgaXMgdXNlZnVsLCBmb3IgaW5zdGFuY2UgYSBhbm9ueW1vdXMgdm1hIG1pZ2h0IGhhdmUK
PiBzb21lIG9mIGl0cyBwYWdlIHJlYWQgb25seSBldmVuIGlmIHRoZSB2bWEgaGFzIHdyaXRlIHBl
cm1pc3Npb24uCj4gCj4gSXQgc2VlbXMgdGhhdCB0aGUgY29kZSBpbiBub3V2ZWF1IGlzIHdyb25n
IChwcm9iYWJseSBsb3N0IHRoYXQKPiBpbiB2YXJpb3VzIHJlYmFzZS9yZXdvcmspIGFzIHRoaXMg
ZmxhZyBzaG91bGQgYmUgdXNlIHRvIGRlY2lkZQo+IHdldGhlciB0byBtYXAgdGhlIGRldmljZSBt
ZW1vcnkgd2l0aCB3cml0ZSBwZXJtaXNzaW9uIG9yIG5vdC4KPiAKPiBJIGFtIHRyYXZlbGluZyBy
aWdodCBub3csIGkgd2lsbCBpbnZlc3RpZ2F0ZSB3aGF0IGhhcHBlbmVkIHRvCj4gbm91dmVhdSBj
b2RlLgoKV2UgY2FuIGFkZCBpdCBiYWNrIHdoZW4gbmVlZGVkIHByZXR0eSBlYXNpbHkuICBNdWNo
IG9mIHRoaXMgaGFzIGJpdHJvdHRlZAp3YXkgdG8gZmFzdCwgYW5kIHRoZSBwZW5kaW5nIHBwYyBr
dm1obW0gY29kZSBkb2Vzbid0IG5lZWQgaXQgZWl0aGVyLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
