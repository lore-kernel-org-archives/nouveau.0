From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 2/2] drm: Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ to
 UAPI
Date: Tue, 23 May 2017 09:38:38 +0200
Message-ID: <CAKMK7uFvCDHB_a0X3SRcneaRzXN=LUNLw4JHGFsX+rhZ_xk_cQ@mail.gmail.com>
References: <20170519205017.23307-1-robert.foss@collabora.com>
 <20170519205017.23307-2-robert.foss@collabora.com>
 <20170522160908.GA12629@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170522160908.GA12629@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Robert Foss <robert.foss@collabora.com>, Nouveau Dev <nouveau@lists.freedesktop.org>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Hellstrom <thellstrom@vmware.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Mali DP Maintainers <malidp@foss.arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBNYXkgMjIsIDIwMTcgYXQgNjowOSBQTSwgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+ICsvKgo+PiArICogRFJNX01PREVfUkVG
TEVDVF88YXhpcz4KPj4gKyAqCj4+ICsgKiBTaWduYWxzIHRoYXQgdGhlIGNvbnRlbnRzIG9mIGEg
ZHJtIHBsYW5lIGlzIHJlZmxlY3RlZCBpbiB0aGUgPGF4aXM+IGF4aXMsCj4+ICsgKiBpbiB0aGUg
c2FtZSB3YXkgYXMgbWlycm9yaW5nLgo+Cj4gVGhhdCdzIG5vdCB3aGF0IEkgd2FzIGFmdGVyLiBX
ZSdyZSBzdGlsbCBtaXNzaW5nIHRoZSBpbmZvcm1hdGlvbiBhYm91dAo+IHRoZSBvcmRlciBpbiB3
aGljaCByZWZsZWN0aW9uIGFuZCByb3RhdGlvbiBoYXBwZW5zLiBBbHNvIGRvZXMgImluIHRoZQo+
IGF4aXMiIG1lYW4gdGhlIHNhbWUgdGhpbmcgYXMgImFsb25nIHRoZSBheGlzIiBhbmQgbm90ICJh
Y3Jvc3MgdGhlIGF4aXMiPwo+IC9tZSB0aGlua3MgdGhlIG9sZCB0ZXh0IHdhcyBiZXR0ZXIKClRo
ZXJlJ3MgYWxyZWFkeSBhIHByZXR0eSBsZW5ndGh5IGtlcm5lbC1kb2MgaW4gZHJtX2JsZW5kLmMg
d2hpY2ggaXMKdHJ5aW5nIHRvIGV4cGxhaW4gYWxsIHRoaXMuIER1cGxpY2F0aW5nIGFsbCB0aGVz
ZSB0aGluZ3MgaGVyZSBpcyBub3QKYWxsIHRoYXQgYXdlc29tZSBpbW8uIENhbiB3ZSBwZXJoYXBz
IGluc3RlYWQgcmVmZXJlbmNlIHRoZSB0ZXh0IGluCmRybV9ibGVuZC5jIGFuZCBtYWtlIHN1cmUg
dGhhdCBpcyB0aGUgb25lIHRydWUgc291cmNlIG9mIHRydXRoPwotRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2
NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
