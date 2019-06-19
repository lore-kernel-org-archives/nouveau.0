From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: dev_pagemap related cleanups v2
Date: Wed, 19 Jun 2019 09:46:23 -0700
Message-ID: <CAPcyv4hYtQdg0DTYjrJxCNXNjadBSWQ5QaMJYsA-QSribKuwrQ@mail.gmail.com>
References: <20190617122733.22432-1-hch@lst.de>
 <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
 <20190619094032.GA8928@lst.de> <20190619163655.GG9360@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190619163655.GG9360@ziepe.ca>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgOTozNyBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAxMTo0MDozMkFNICswMjAw
LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDEy
OjQ3OjEwUE0gLTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+ID4gPiBHaXQgdHJlZToKPiA+
ID4gPgo+ID4gPiA+ICAgICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5n
aXQgaG1tLWRldm1lbS1jbGVhbnVwLjIKPiA+ID4gPgo+ID4gPiA+IEdpdHdlYjoKPiA+ID4gPgo+
ID4gPiA+ICAgICBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3No
b3J0bG9nL3JlZnMvaGVhZHMvaG1tLWRldm1lbS1jbGVhbnVwLjIKPiA+Cj4gPiA+Cj4gPiA+IEF0
dGFjaGVkIGlzIG15IGluY3JlbWVudGFsIGZpeHVwcyBvbiB0b3Agb2YgdGhpcyBzZXJpZXMsIHdp
dGggdGhvc2UKPiA+ID4gaW50ZWdyYXRlZCB5b3UgY2FuIGFkZDoKPiA+Cj4gPiBJJ3ZlIGZvbGRl
ZCB5b3VyIGluY3JlbWVudGFsIGJpdHMgaW4gYW5kIHB1c2hlZCBvdXQgYSBuZXcKPiA+IGhtbS1k
ZXZtZW0tY2xlYW51cC4zIHRvIHRoZSByZXBvIGFib3ZlLiAgTGV0IG1lIGtub3cgaWYgSSBkaWRu
J3QgbWVzcwo+ID4gdXAgYW55dGhpbmcgZWxzZS4gIEknbGwgd2FpdCBmb3IgYSBmZXcgbW9yZSBj
b21tZW50cyBhbmQgSmFzb24ncwo+ID4gcGxhbm5lZCByZWJhc2Ugb2YgdGhlIGhtbSBicmFuY2gg
YmVmb3JlIHJlcG9zdGluZy4KPgo+IEkgc2FpZCBJIHdvdWxkbid0IHJlYmFzZSB0aGUgaG1tLmdp
dCAoYXMgaXQgbmVlZHMgdG8gZ28gdG8gRFJNLCBBTUQKPiBhbmQgUkRNQSBnaXQgdHJlZXMpLi4K
Pgo+IEluc3RlYWQgSSB3aWxsIG1lcmdlIHY1LjItcmM1IHRvIHRoZSB0cmVlIGJlZm9yZSBhcHBs
eWluZyB0aGlzIHNlcmllcy4KPgo+IEkndmUgdW5kZXJzdG9vZCB0aGlzIHRvIGJlIExpbnVzJ3Mg
cHJlZmVyZWQgd29ya2Zsb3cuCj4KPiBTbywgcGxlYXNlIHNlbmQgdGhlIG5leHQgaXRlcmF0aW9u
IG9mIHRoaXMgYWdhaW5zdCBlaXRoZXIKPiBwbGFpbnY1LjItcmM1IG9yIHY1LjItcmM1IG1lcmdl
ZCB3aXRoIGhtbS5naXQgYW5kIEknbGwgc29ydCBpdCBvdXQuCgpKdXN0IG1ha2Ugc3VyZSB0aGF0
IHdoZW4geW91IGJhY2ttZXJnZSB2NS4yLXJjNSB5b3UgaGF2ZSBhIGNsZWFyCnJlYXNvbiBpbiB0
aGUgbWVyZ2UgY29tbWl0IG1lc3NhZ2UgYWJvdXQgd2h5IHlvdSBuZWVkZWQgdG8gZG8gaXQuCldo
aWxlIG5lZWRsZXNzIHJlYmFzaW5nIGlzIHRvcCBvZiB0aGUgcGV0IHBlZXZlIGxpc3QsIHNlY29u
ZCBwbGFjZSwgYXMKSSBmb3VuZCBvdXQsIGlzIG15c3RlcnkgbWVyZ2VzIHdpdGhvdXQgZXhwbGFu
YXRpb25zLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
