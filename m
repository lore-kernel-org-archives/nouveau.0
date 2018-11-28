From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/fbdev: Make skip_vt_switch the default
Date: Wed, 28 Nov 2018 08:17:04 +0100
Message-ID: <3d406677-9d7d-6d8d-85af-1cfb253d1838@linux.intel.com>
References: <20181127170952.28507-1-daniel.vetter@ffwll.ch>
 <20181127173424.301-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20181127173424.301-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>, nouveau@lists.freedesktop.org, DRI Development <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Daniel Stone <daniels@collabora.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Junwei Zhang <Jerry.Zhang@amd.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@amd.com>, Sandy Huang <hjc@rock-chips.com>, Samuel Li <Samuel.Li@amd.com>, Shirish S <shirish.s@amd.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
List-Id: nouveau.vger.kernel.org

T3AgMjctMTEtMTggb20gMTg6MzQgc2NocmVlZiBEYW5pZWwgVmV0dGVyOgo+IEtNUyBkcml2ZXJz
IHJlYWxseSBzaG91bGQgYWxsIGJlIGFibGUgdG8gcmVzdG9yZSB0aGVpciBkaXNwbGF5IHN0YXRl
Cj4gb24gcmVzdW1lIHdpdGhvdXQgZmJjb24gaGVscGluZyBvdXQuIFNvIG1ha2UgdGhpcyB0aGUg
ZGVmYXVsdC4KPgo+IFNpbmNlIEknbSBub3QgZW50aXJlbHkgZm9vbGlzaCwgbWFrZSBpdCBvbmx5
IGEgZGVmYXVsdCwgd2hpY2ggZHJpdmVycwo+IGNhbiBzdGlsbCBvdmVycmlkZS4gVGhhdCB3YXkg
d2hlbiB0aGUgaW5ldml0YWJsZSByZWdyZXNzaW9uIHJlcG9ydAo+IGhhcHBlbnMgSSBjYW4gZml4
IHRoaW5ncyB1cCB3aXRoIGEgb25lLWxpbmVyIHBsdXMgRklYTUUgY29tbWVudCB0aGF0Cj4gc29t
ZW9uZSBzaG91bGQgZml4IHVwIHRoZSBzdXNwZW5kL3Jlc3VtZSBjb2RlIGluIHRoYXQgZHJpdmVy
Lgo+Cj4gQnV0IGF0IGxlYXN0IGFsbCBuZXcgZHJpdmVycyB3b24ndCBiZSBicm9rZW4gYnkgYWNj
aWRlbnQgYXMgc29vbiBhcwo+IHlvdSB0dXJuIG9mZiBmYmNvbiBiZWNhdXNlICJzdXNwZW5kL3Jl
c3VtZSB3b3JrZWQgd2hlbiBJIHRlc3RlZCBpdCIuCj4KPiB2MjogS2VlcCB0aGlzIGZvciByYWRl
b24gYmVjYXVzZSBvZgo+Cj4gY29tbWl0IDE4YzQzN2NhYTViMThhMjM1ZGQ2NWNlYzIyNGVhYjU0
YmViY2VlNjUKPiBBdXRob3I6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KPiBEYXRlOiAgIFR1ZSBOb3YgMTQgMTc6MTk6MjkgMjAxNyAtMDUwMAo+Cj4gICAgIFJldmVy
dCAiZHJtL3JhZGVvbjogZG9udCBzd2l0Y2ggdnQgb24gc3VzcGVuZCIKPgo+IFRoYW5rcyB0byBN
aWNoZWwgRMOkbnplciBmb3IgcG9pbnRpbmcgdGhpcyBvbmUgb3V0LgoKTWF5YmUganVzdCByZWxv
YWQgdGhlIGdhbW1hIGx1dCBvbiByZXN1bWUgZm9yIHJhZGVvbiwgaW5zdGVhZCBvZiByZWx5aW5n
IG9uIGZiY29uPwoKT3RoZXJ3aXNlIHBhdGNoIGxvb2tzIHNhbmUsIHdvdWxkIGJlIG5pY2UgaWYg
cmFkZW9uIHdhcyBmaXhlZCBpbnN0ZWFkIG9mIHdvcmtlZCBhcm91bmQuCgpSZXZpZXdlZC1ieTog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBt
YWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
