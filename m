From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v4 2/8] drm/nouveau: Enable polling even if we have
 runtime PM
Date: Thu, 02 Aug 2018 15:37:12 -0400
Message-ID: <b4c5e0ae5edd09e56077ad0a098ae896571c3731.camel@redhat.com>
References: <20180801211459.7731-1-lyude@redhat.com>
 <20180801211459.7731-3-lyude@redhat.com> <20180802191405.GB6180@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180802191405.GB6180@wunner.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

b29vaCwgdGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4gSSBzaG91bGQgaGF2ZSBncmVwcGVk
IGZvciB0aGlzIGZ1bmN0aW9uCmJlZm9yZSBkb2luZyB0aGF0IGNvbW1pdC4gVGhlcmUgYWxzbyBh
cHBlYXJzIHRvIGJlIGFub3RoZXIgZHVwbGljYXRlCmRybV9rbXNfaGVscGVyX3BvbGxfZW5hYmxl
KCkgaW4gbm91dmVhdV92Z2EuYyB3aGljaCBhbHNvIGxvb2tzIGVxdWFsbHkKc3VzcGVjaW91cyBh
cyBiZWluZyB1c2VsZXNzLiBJIHdpbGwgZml4IHRoaXMgdXAgYW5kIGFsc28gcmVtb3ZlIHRoYXQg
b3RoZXIKZHVwbGljYXRlIGNhbGwgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGlzCgpPbiBUaHUs
IDIwMTgtMDgtMDIgYXQgMjE6MTQgKzAyMDAsIEx1a2FzIFd1bm5lciB3cm90ZToKPiBPbiBXZWQs
IEF1ZyAwMSwgMjAxOCBhdCAwNToxNDo1MlBNIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwo+ID4gQEAgLTU5MiwxMCArNTkyLDEx
IEBAIG5vdXZlYXVfZHJtX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQKPiA+
IGxvbmcgZmxhZ3MpCj4gPiAgCQlwbV9ydW50aW1lX2FsbG93KGRldi0+ZGV2KTsKPiA+ICAJCXBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3koZGV2LT5kZXYpOwo+ID4gIAkJcG1fcnVudGltZV9wdXQo
ZGV2LT5kZXYpOwo+ID4gLQl9IGVsc2Ugewo+ID4gLQkJLyogZW5hYmxlIHBvbGxpbmcgZm9yIGV4
dGVybmFsIGRpc3BsYXlzICovCj4gPiAtCQlkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZShkZXYp
Owo+ID4gIAl9Cj4gPiArCj4gPiArCS8qIGVuYWJsZSBwb2xsaW5nIGZvciBjb25uZWN0b3JzIHdp
dGhvdXQgaHBkICovCj4gPiArCWRybV9rbXNfaGVscGVyX3BvbGxfZW5hYmxlKGRldik7Cj4gPiAr
Cj4gCj4gSSdtIHdvbmRlcmluZyB3aHkgZHJtX2ttc19oZWxwZXJfcG9sbF9lbmFibGUoKSBpcyBj
YWxsZWQgaGVyZSBhdCBhbGwuCj4gRG9lcyB0aGUgaW52b2NhdGlvbiBpbiBub3V2ZWF1X2Rpc3Bs
YXlfaW5pdCgpIG5vdCBzdWZmaWNlPyAgQ2FuIHRoZXJlCj4gYmUgYSBzaXR1YXRpb24gd2hlbiBu
b3V2ZWF1X2Rpc3BsYXlfaW5pdCgpIGlzIG5vdCBjYWxsZWQgZGVzcGl0ZSB0aGVyZQo+IGJlaW5n
IGNvbm5lY3RvcnMgdGhhdCBuZWVkIHRvIGJlIHBvbGxlZD8KPiAKPiBUaGFua3MsCj4gCj4gTHVr
YXMKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
