From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: remove open-coded drm_invalid_op()
Date: Tue, 6 Aug 2019 10:42:07 +0100
Message-ID: <CACvgo51AHoqgwDw+DMz3p8YAsheBB60+z4jM4ebirAJyZ0zB5w@mail.gmail.com>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <20190522150219.13913-2-emil.l.velikov@gmail.com>
 <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

SGkgQmVuLAoKT24gVGh1LCAyMyBNYXkgMjAxOSBhdCAwMToxOSwgQmVuIFNrZWdncyA8c2tlZ2dz
YkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMyBNYXkgMjAxOSBhdCAwMTowMywgRW1p
bCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPgo+ID4gQ2M6IEJl
biBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiA+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4KPiBUaGFua3MhCj4KU2FkbHkgRGF2ZSByZXZlcnRlZCB0aGlzLCBzaW5j
ZSB0aGUgdGhhbmtzIHdhc24ndCBzcGVsbGVkIG91dCBhcwpBY2tlZC1ieS9SLWIvb3RoZXIuCkNh
biB5b3UgYmUgbW9yZSBleHBsaWNpdCwgb3IgYWx0ZXJuYXRpdmVseSBmZWVsIGZyZWUgdG8gcGlj
ayB0aGUgcGF0Y2gKdGhyb3VnaCB5b3VyIHRyZWUuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
