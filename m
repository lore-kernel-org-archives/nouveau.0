From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 06/25] mm: export alloc_pages_vma
Date: Wed, 26 Jun 2019 14:36:23 +0200
Message-ID: <20190626123623.GU17798@dhcp22.suse.cz>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-7-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190626122724.13313-7-hch@lst.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christoph Hellwig <hch@lst.de>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkIDI2LTA2LTE5IDE0OjI3OjA1LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBub3V2
ZWF1IGlzIGN1cnJlbnRseSB1c2luZyB0aGlzIHRocm91Z2ggYW4gb2RkIGhtbSB3cmFwcGVyLCBh
bmQgSSBwbGFuCj4gdG8gc3dpdGNoIGl0IHRvIHRoZSByZWFsIHRoaW5nIGxhdGVyIGluIHRoaXMg
c2VyaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
Pgo+IFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CgpBY2tl
ZC1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CgpUaGFua3MhCgo+IC0tLQo+ICBt
bS9tZW1wb2xpY3kuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvbW0vbWVtcG9saWN5LmMgYi9tbS9tZW1wb2xpY3kuYwo+IGluZGV4IDAx
NjAwZDgwYWUwMS4uZjQ4NTY5YWExODYzIDEwMDY0NAo+IC0tLSBhL21tL21lbXBvbGljeS5jCj4g
KysrIGIvbW0vbWVtcG9saWN5LmMKPiBAQCAtMjA5OCw2ICsyMDk4LDcgQEAgYWxsb2NfcGFnZXNf
dm1hKGdmcF90IGdmcCwgaW50IG9yZGVyLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAg
b3V0Ogo+ICAJcmV0dXJuIHBhZ2U7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTChhbGxvY19wYWdlc192
bWEpOwo+ICAKPiAgLyoqCj4gICAqIAlhbGxvY19wYWdlc19jdXJyZW50IC0gQWxsb2NhdGUgcGFn
ZXMuCj4gLS0gCj4gMi4yMC4xCgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
