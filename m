From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/fbdev: Make skip_vt_switch the default
Date: Tue, 26 Mar 2019 16:25:11 +0100
Message-ID: <CAKMK7uH9dSRjuJr9hsc_BmeZ3LW6iVMSX+HANh=XWRm9kxeBnQ@mail.gmail.com>
References: <20181127170952.28507-1-daniel.vetter@ffwll.ch>
 <20181127173424.301-1-daniel.vetter@ffwll.ch>
 <3d406677-9d7d-6d8d-85af-1cfb253d1838@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3d406677-9d7d-6d8d-85af-1cfb253d1838@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Nouveau Dev <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@intel.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, Daniel Stone <daniels@collabora.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Junwei Zhang <Jerry.Zhang@amd.com>, Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>, Samuel Li <Samuel.Li@amd.com>, Shirish S <shirish.s@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgODoxNyBBTSBNYWFydGVuIExhbmtob3JzdAo8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9wIDI3LTExLTE4IG9tIDE4
OjM0IHNjaHJlZWYgRGFuaWVsIFZldHRlcjoKPiA+IEtNUyBkcml2ZXJzIHJlYWxseSBzaG91bGQg
YWxsIGJlIGFibGUgdG8gcmVzdG9yZSB0aGVpciBkaXNwbGF5IHN0YXRlCj4gPiBvbiByZXN1bWUg
d2l0aG91dCBmYmNvbiBoZWxwaW5nIG91dC4gU28gbWFrZSB0aGlzIHRoZSBkZWZhdWx0Lgo+ID4K
PiA+IFNpbmNlIEknbSBub3QgZW50aXJlbHkgZm9vbGlzaCwgbWFrZSBpdCBvbmx5IGEgZGVmYXVs
dCwgd2hpY2ggZHJpdmVycwo+ID4gY2FuIHN0aWxsIG92ZXJyaWRlLiBUaGF0IHdheSB3aGVuIHRo
ZSBpbmV2aXRhYmxlIHJlZ3Jlc3Npb24gcmVwb3J0Cj4gPiBoYXBwZW5zIEkgY2FuIGZpeCB0aGlu
Z3MgdXAgd2l0aCBhIG9uZS1saW5lciBwbHVzIEZJWE1FIGNvbW1lbnQgdGhhdAo+ID4gc29tZW9u
ZSBzaG91bGQgZml4IHVwIHRoZSBzdXNwZW5kL3Jlc3VtZSBjb2RlIGluIHRoYXQgZHJpdmVyLgo+
ID4KPiA+IEJ1dCBhdCBsZWFzdCBhbGwgbmV3IGRyaXZlcnMgd29uJ3QgYmUgYnJva2VuIGJ5IGFj
Y2lkZW50IGFzIHNvb24gYXMKPiA+IHlvdSB0dXJuIG9mZiBmYmNvbiBiZWNhdXNlICJzdXNwZW5k
L3Jlc3VtZSB3b3JrZWQgd2hlbiBJIHRlc3RlZCBpdCIuCj4gPgo+ID4gdjI6IEtlZXAgdGhpcyBm
b3IgcmFkZW9uIGJlY2F1c2Ugb2YKPiA+Cj4gPiBjb21taXQgMThjNDM3Y2FhNWIxOGEyMzVkZDY1
Y2VjMjI0ZWFiNTRiZWJjZWU2NQo+ID4gQXV0aG9yOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gPiBEYXRlOiAgIFR1ZSBOb3YgMTQgMTc6MTk6MjkgMjAxNyAtMDUw
MAo+ID4KPiA+ICAgICBSZXZlcnQgImRybS9yYWRlb246IGRvbnQgc3dpdGNoIHZ0IG9uIHN1c3Bl
bmQiCj4gPgo+ID4gVGhhbmtzIHRvIE1pY2hlbCBEw6RuemVyIGZvciBwb2ludGluZyB0aGlzIG9u
ZSBvdXQuCj4KPiBNYXliZSBqdXN0IHJlbG9hZCB0aGUgZ2FtbWEgbHV0IG9uIHJlc3VtZSBmb3Ig
cmFkZW9uLCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gZmJjb24/Cj4KPiBPdGhlcndpc2UgcGF0Y2gg
bG9va3Mgc2FuZSwgd291bGQgYmUgbmljZSBpZiByYWRlb24gd2FzIGZpeGVkIGluc3RlYWQgb2Yg
d29ya2VkIGFyb3VuZC4KPgo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKTm90aWNlZCB0aGlzIG9sZCBwYXRjaCwgZmlu
YWxseSBnb3R0ZW4gYXJvdW5kIHRvIG1lcmdpbmcgaXQuIFRoYW5rcwpldmVyeW9uZSBmb3IgcmV2
aWV3aW5nLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
