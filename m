From: "Li, Samuel" <Samuel.Li@amd.com>
Subject: Re: [PATCH] drm/fbdev: Make skip_vt_switch the default
Date: Wed, 28 Nov 2018 16:00:42 +0000
Message-ID: <7a37ad7d-7706-7fe6-5b7a-5b867a87e8ed@amd.com>
References: <20181127170952.28507-1-daniel.vetter@ffwll.ch>
 <20181127173424.301-1-daniel.vetter@ffwll.ch>
 <3d406677-9d7d-6d8d-85af-1cfb253d1838@linux.intel.com>
 <20181128082057.GH4266@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181128082057.GH4266@phenom.ffwll.local>
Content-Language: en-US
Content-ID: <81F8EDE2EF7F9D4D86DB1FDC4A1AE56C@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Daniel Vetter <daniel.vetter@intel.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Daniel Stone <daniels@collabora.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Zhang, Jerry" <Jerry.Zhang@amd.com>, Sean Paul <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Daenzer, Michel" <Michel.Daenzer@amd.com>, "S,
 Shirish" <Shirish.S@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
List-Id: nouveau.vger.kernel.org

UmV2aWV3ZWQtYnk6IFNhbXVlbCBMaSA8c2FtdWVsLmxpQGFtZC5jb20+DQoNCg0KDQpPbiAyMDE4
LTExLTI4IDM6MjAgYS5tLiwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gV2VkLCBOb3YgMjgs
IDIwMTggYXQgMDg6MTc6MDRBTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6DQo+PiBP
cCAyNy0xMS0xOCBvbSAxODozNCBzY2hyZWVmIERhbmllbCBWZXR0ZXI6DQo+Pj4gS01TIGRyaXZl
cnMgcmVhbGx5IHNob3VsZCBhbGwgYmUgYWJsZSB0byByZXN0b3JlIHRoZWlyIGRpc3BsYXkgc3Rh
dGUNCj4+PiBvbiByZXN1bWUgd2l0aG91dCBmYmNvbiBoZWxwaW5nIG91dC4gU28gbWFrZSB0aGlz
IHRoZSBkZWZhdWx0Lg0KPj4+DQo+Pj4gU2luY2UgSSdtIG5vdCBlbnRpcmVseSBmb29saXNoLCBt
YWtlIGl0IG9ubHkgYSBkZWZhdWx0LCB3aGljaCBkcml2ZXJzDQo+Pj4gY2FuIHN0aWxsIG92ZXJy
aWRlLiBUaGF0IHdheSB3aGVuIHRoZSBpbmV2aXRhYmxlIHJlZ3Jlc3Npb24gcmVwb3J0DQo+Pj4g
aGFwcGVucyBJIGNhbiBmaXggdGhpbmdzIHVwIHdpdGggYSBvbmUtbGluZXIgcGx1cyBGSVhNRSBj
b21tZW50IHRoYXQNCj4+PiBzb21lb25lIHNob3VsZCBmaXggdXAgdGhlIHN1c3BlbmQvcmVzdW1l
IGNvZGUgaW4gdGhhdCBkcml2ZXIuDQo+Pj4NCj4+PiBCdXQgYXQgbGVhc3QgYWxsIG5ldyBkcml2
ZXJzIHdvbid0IGJlIGJyb2tlbiBieSBhY2NpZGVudCBhcyBzb29uIGFzDQo+Pj4geW91IHR1cm4g
b2ZmIGZiY29uIGJlY2F1c2UgInN1c3BlbmQvcmVzdW1lIHdvcmtlZCB3aGVuIEkgdGVzdGVkIGl0
Ii4NCj4+Pg0KPj4+IHYyOiBLZWVwIHRoaXMgZm9yIHJhZGVvbiBiZWNhdXNlIG9mDQo+Pj4NCj4+
PiBjb21taXQgMThjNDM3Y2FhNWIxOGEyMzVkZDY1Y2VjMjI0ZWFiNTRiZWJjZWU2NQ0KPj4+IEF1
dGhvcjogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4+IERhdGU6
ICAgVHVlIE5vdiAxNCAxNzoxOToyOSAyMDE3IC0wNTAwDQo+Pj4NCj4+PiAgICAgUmV2ZXJ0ICJk
cm0vcmFkZW9uOiBkb250IHN3aXRjaCB2dCBvbiBzdXNwZW5kIg0KPj4+DQo+Pj4gVGhhbmtzIHRv
IE1pY2hlbCBEw6RuemVyIGZvciBwb2ludGluZyB0aGlzIG9uZSBvdXQuDQo+Pg0KPj4gTWF5YmUg
anVzdCByZWxvYWQgdGhlIGdhbW1hIGx1dCBvbiByZXN1bWUgZm9yIHJhZGVvbiwgaW5zdGVhZCBv
ZiByZWx5aW5nIG9uIGZiY29uPw0KPiANCj4gSXQgYWxzbyBjYXVzZWQgcmFuZG9tIHNvdW5kIGlz
c3VlcyBhbmQgb3RoZXIgZnVuLiBBbHNvLCBhZmFpdWkgcmFkZW9uIGRvZXMNCj4gbG9hZCB0aGUg
bHV0LiBFeGNlcHQgYmVjYXVzZSBvZiB0aW1pbmcgb3IgYmFkIGx1Y2ssIGl0IGRvZXNuJ3Qgd29y
aw0KPiByZWxpYWJseSwgYW5kIHRoZSB2dCBzd2l0Y2ggZG9pbmcgaXQgYSAybmQgdGltZSBoZWxw
cyBvdXQuDQo+IC1EYW5pZWwNCj4gDQo+PiBPdGhlcndpc2UgcGF0Y2ggbG9va3Mgc2FuZSwgd291
bGQgYmUgbmljZSBpZiByYWRlb24gd2FzIGZpeGVkIGluc3RlYWQgb2Ygd29ya2VkIGFyb3VuZC4N
Cj4+DQo+PiBSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
