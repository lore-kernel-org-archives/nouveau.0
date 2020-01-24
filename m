From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v4 15/22] drm/stm: Convert to CRTC VBLANK callbacks
Date: Fri, 24 Jan 2020 10:43:04 +0000
Message-ID: <40c4b198-0796-631e-b533-494822af9c47@st.com>
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-16-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200123135943.24140-16-tzimmermann@suse.de>
Content-Language: en-US
Content-ID: <DB2A5D2782CBB040AC5BB0FB174AA7FD@st.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "christian.koenig@amd.com" <christian.koenig@amd.com>, "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>, "robdclark@gmail.com" <robdclark@gmail.com>, "sean@poorly.run" <sean@poorly.run>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, Vincent ABRIOU <vincent.abriou@st.com>, Yannick FERTRE <yannick.fertre@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "eric@anholt.net" <eric@anholt.>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

RGVhciBUaG9tYXMsDQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsDQpGb3IgdGhpcyBzdG0gcGFy
dCwNCkFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQ
aGlsaXBwZSA6LSkNCg0KT24gMS8yMy8yMCAyOjU5IFBNLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gVkJMQU5LIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVwcmVjYXRl
ZCBpbiBmYXZvciBvZg0KPiB0aGVpciBlcXVpdmFsZW50cyBpbiBzdHJ1Y3QgZHJtX2NydGNfZnVu
Y3MuIENvbnZlcnQgc3RtIG92ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyw6kg
PHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9k
cnYuYyAgfCAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDEgKw0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9k
cnYuYw0KPiBpbmRleCA0ODY5ODU2MDQxMDkuLmVhOWZjYmRjNjhiMyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Ry
di5jDQo+IEBAIC03Miw3ICs3Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcnZfZHJp
dmVyID0gew0KPiAgIAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLA0K
PiAgIAkuZ2VtX3ByaW1lX3Z1bm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3Z1bm1hcCwNCj4gICAJ
LmdlbV9wcmltZV9tbWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwNCj4gLQkuZ2V0X3ZibGFu
a190aW1lc3RhbXAgPSBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zLA0KPiAg
IH07DQo+ICAgDQo+ICAgc3RhdGljIGludCBkcnZfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
dikNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMNCj4gaW5kZXggOGI2ZDFhMjI1MmUzLi5lZTJhOGNhYzU5Y2IgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5jDQo+IEBAIC03MjIsNiArNzIyLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fY3J0Y19mdW5jcyBsdGRjX2NydGNfZnVuY3MgPSB7DQo+ICAgCS5hdG9taWNfZGVz
dHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2NydGNfZGVzdHJveV9zdGF0ZSwNCj4gICAJ
LmVuYWJsZV92YmxhbmsgPSBsdGRjX2NydGNfZW5hYmxlX3ZibGFuaywNCj4gICAJLmRpc2FibGVf
dmJsYW5rID0gbHRkY19jcnRjX2Rpc2FibGVfdmJsYW5rLA0KPiArCS5nZXRfdmJsYW5rX3RpbWVz
dGFtcCA9IGRybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXAsDQo+ICAg
CS5nYW1tYV9zZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0LA0KPiAgIH07
DQo+ICAgDQo+IA==
