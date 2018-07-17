From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 2/5] drm/nouveau: Grab RPM ref while probing
 outputs
Date: Tue, 17 Jul 2018 12:12:18 +0200
Message-ID: <CACO55ts2bGfH4GmoXUmHK8=-RzK5x3xHq5ji3Nsuyw+nf13e+Q@mail.gmail.com>
References: <20180716235936.11268-1-lyude@redhat.com>
 <20180716235936.11268-3-lyude@redhat.com>
 <20180717072152.GA16115@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180717072152.GA16115@wunner.de>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2Fyb2xoZXJic3RAZ21haWwuY29tPgoKT24gVHVl
LCBKdWwgMTcsIDIwMTggYXQgOToyMSBBTSwgTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+
IHdyb3RlOgo+IE9uIE1vbiwgSnVsIDE2LCAyMDE4IGF0IDA3OjU5OjI2UE0gLTA0MDAsIEx5dWRl
IFBhdWwgd3JvdGU6Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPj4g
QEAgLTIwMTIsMTAgKzIwMTIsMTggQEAgbnY1MF9kaXNwX2F0b21pY19zdGF0ZV9hbGxvYyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+PiAgICAgICByZXR1cm4gJmF0b20tPnN0YXRlOwo+PiAgfQo+
Pgo+PiArc3RhdGljIHZvaWQKPj4gK25vdXZlYXVfb3V0cHV0X3BvbGxfY2hhbmdlZChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQo+PiArewo+PiArICAgICBwbV9ydW50aW1lX2dldF9zeW5jKGRldi0+
ZGV2KTsKPj4gKyAgICAgZHJtX2ZiX2hlbHBlcl9ob3RwbHVnX2V2ZW50KGRldi0+ZmJfaGVscGVy
KTsKPj4gKyAgICAgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2LT5kZXYpOwo+PiArfQo+
PiArCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcwo+PiAgbnY1
MF9kaXNwX2Z1bmMgPSB7Cj4+ICAgICAgIC5mYl9jcmVhdGUgPSBub3V2ZWF1X3VzZXJfZnJhbWVi
dWZmZXJfY3JlYXRlLAo+PiAtICAgICAub3V0cHV0X3BvbGxfY2hhbmdlZCA9IGRybV9mYl9oZWxw
ZXJfb3V0cHV0X3BvbGxfY2hhbmdlZCwKPj4gKyAgICAgLm91dHB1dF9wb2xsX2NoYW5nZWQgPSBu
b3V2ZWF1X291dHB1dF9wb2xsX2NoYW5nZWQsCj4KPiBJdCBtaWdodCBtYWtlIHNlbnNlIHRvIHBy
b3ZpZGUgYSBnZW5lcmljIERSTSBoZWxwZXIgZm9yIHRoaXMuCj4gU2FtZSBmb3IgcGF0Y2ggMyBp
biB0aGlzIHNlcmllcy4KPgo+IFRoYW5rcywKPgo+IEx1a2FzCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
