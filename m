From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/6] drm/nouveau: Pin bos from imported dma-bufs to GTT.
Date: Wed, 29 Mar 2017 10:45:41 +0200
Message-ID: <2e386e39-3fc1-80ff-f006-76b1d6ea2f3b@linux.intel.com>
References: <20170329002720.11445-1-raof@ubuntu.com>
 <20170329002720.11445-3-raof@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170329002720.11445-3-raof@ubuntu.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: raof@ubuntu.com, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Christopher James Halse Rogers <christopher.halse.rogers@canonical.com>
List-Id: nouveau.vger.kernel.org

T3AgMjktMDMtMTcgb20gMDI6Mjcgc2NocmVlZiByYW9mQHVidW50dS5jb206Cj4gRnJvbTogQ2hy
aXN0b3BoZXIgSmFtZXMgSGFsc2UgUm9nZXJzIDxjaHJpc3RvcGhlci5oYWxzZS5yb2dlcnNAY2Fu
b25pY2FsLmNvbT4KPgo+IEF0dGVtcHRpbmcgdG8gbWlncmF0ZSB0aGUgYm8gd2lsbCBicmVhayB0
aGUgc2hhcmluZyBvZiB0aGUgYnVmZmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIg
SmFtZXMgSGFsc2UgUm9nZXJzIDxjaHJpc3RvcGhlci5oYWxzZS5yb2dlcnNAY2Fub25pY2FsLmNv
bT4KPiBDQzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5j
Cj4gaW5kZXggMWZlZmM5M2FmMWQ3Li41ZjQ3NGViYjRkNmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9wcmltZS5jCj4gQEAgLTc2LDYgKzc2LDggQEAgc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpub3V2ZWF1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICAKPiAgCW52Ym8tPnZhbGlk
X2RvbWFpbnMgPSBOT1VWRUFVX0dFTV9ET01BSU5fR0FSVDsKPiArCS8qIHBpbiBpbXBvcnRlZCBi
dWZmZXIgdG8gR1RUICovCj4gKwlub3V2ZWF1X2JvX3BpbihudmJvLCBUVE1fUExfRkxBR19UVCwg
ZmFsc2UpOwo+ICAKPiAgCS8qIEluaXRpYWxpemUgdGhlIGVtYmVkZGVkIGdlbS1vYmplY3QuIFdl
IHJldHVybiBhIHNpbmdsZSBnZW0tcmVmZXJlbmNlCj4gIAkgKiB0byB0aGUgY2FsbGVyLCBpbnN0
ZWFkIG9mIGEgbm9ybWFsIG5vdXZlYXVfYm8gdHRtIHJlZmVyZW5jZS4gKi8KCk1pc3NpbmcgZXJy
b3IgaGFuZGxpbmcgaGVyZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
