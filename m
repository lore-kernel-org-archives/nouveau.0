From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: hmm_range_fault related fixes and legacy API removal v3
Date: Thu, 25 Jul 2019 17:55:01 -0700
Message-ID: <a07dbc3b-7a54-e524-944a-b7e4e49b2a93@nvidia.com>
References: <20190724065258.16603-1-hch@lst.de>
 <20190726001622.GL7450@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190726001622.GL7450@mellanox.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Ck9uIDcvMjUvMTkgNToxNiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgSnVs
IDI0LCAyMDE5IGF0IDA4OjUyOjUxQU0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
PiBIaSBKw6lyw7RtZSwgQmVuIGFuZCBKYXNvbiwKPj4KPj4gYmVsb3cgaXMgYSBzZXJpZXMgYWdh
aW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4+IGxvY2tpbmcg
aW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRvdmVyIGxlZ2FjeSBI
TU0gQVBJcwo+PiBvbmx5IHVzZWQgYnkgbm91dmVhdS4KPj4KPj4gVGhlIGZpcnN0IDQgcGF0Y2hl
cyBhcmUgYSBidWcgZml4IGZvciBub3V2ZWF1LCB3aGljaCBJIHN1c3BlY3Qgc2hvdWxkCj4+IGdv
IGludG8gdGhpcyBtZXJnZSB3aW5kb3cgZXZlbiBpZiB0aGUgY29kZSBpcyBtYXJrZWQgYXMgc3Rh
Z2luZywganVzdAo+PiB0byBhdm9pZCBwZW9wbGUgY29weWluZyB0aGUgYnJlYWthZ2UuCj4+Cj4+
IENoYW5nZXMgc2luY2UgdjI6Cj4+ICAgLSBuZXcgcGF0Y2ggZnJvbSBKYXNvbiB0byBkb2N1bWVu
dCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIHNlbWFudGljcwo+PiAgICAgYmV0dGVyCj4+ICAgLSBy
ZW1vdmUgLUVBR0FJTiBoYW5kbGluZyBpbiBub3V2ZWF1IGVhcmxpZXIKPiAKPiBJIGRvbid0IHNl
ZSBSYWxwaCdzIHRlc3RlZCBieSwgZG8geW91IHRoaW5rIGl0IGNoYW5nZWQgZW5vdWdoIHRvCj4g
cmVxdWlyZSB0ZXN0aW5nIGFnYWluPyBJZiBzbywgUmFscGggd291bGQgeW91IGJlIHNvIGtpbmQ/
Cj4gCj4gSW4gYW55IGV2ZW50LCBJJ20gc2VuZGluZyB0aGlzIGludG8gbGludXgtbmV4dCBhbmQg
aW50ZW5kIHRvIGZvcndhcmQKPiB0aGUgZmlyc3QgZm91ciBuZXh0IHdlZWsuCj4gCj4gVGhhbmtz
LAo+IEphc29uCj4gCgpJIGhhdmUgYmVlbiB0ZXN0aW5nIENocmlzdG9waCdzIHYzIHdpdGggbXkg
c2V0IG9mIHYyIGNoYW5nZXMgc28KZmVlbCBmcmVlIHRvIGFkZCBteSB0ZXN0ZWQtYnkuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
