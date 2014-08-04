From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [PATCH 09/19] drm/radeon: handle lockup in delayed work, v2
Date: Mon, 4 Aug 2014 16:45:28 +0200
Message-ID: <53DF9C88.6060107@amd.com>
References: <20140731153245.15061.63023.stgit@patser>
 <20140731153342.15061.54264.stgit@patser> <53DBC1EC.1010001@amd.com>
 <53DBD269.80807@canonical.com> <53DF462B.2060102@amd.com>
 <53DF4A7D.3040505@canonical.com> <53DF7516.2010408@amd.com>
 <53DF8BF2.4000309@canonical.com> <53DF9AC4.3010700@amd.com>
 <53DF9B58.8000403@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53DF9B58.8000403@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>, airlied@linux.ie
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com
List-Id: nouveau.vger.kernel.org

QW0gMDQuMDguMjAxNCB1bSAxNjo0MCBzY2hyaWViIE1hYXJ0ZW4gTGFua2hvcnN0Ogo+IG9wIDA0
LTA4LTE0IDE2OjM3LCBDaHJpc3RpYW4gS8O2bmlnIHNjaHJlZWY6Cj4+PiBJdCdhIHBhaW4gdG8g
ZGVhbCB3aXRoIGdwdSByZXNldC4KPj4gWWVhaCwgd2VsbCB0aGF0J3Mgbm90aGluZyBuZXcuCj4+
Cj4+PiBJJ3ZlIG5vdyB0cmllZCBvdGhlciBzb2x1dGlvbnMgYnV0IHRoYXQgd291bGQgbWVhbiBy
ZXZlcnRpbmcgdG8gdGhlIG9sZCBzdHlsZSBkdXJpbmcgZ3B1IGxvY2t1cCByZWNvdmVyeSwgYW5k
IG9ubHkgcnVubmluZyB0aGUgZGVsYXllZCB3b3JrIHdoZW4gIWxvY2t1cC4KPj4+IEJ1dCB0aGlz
IG1lYW50IHRoYXQgdGhlIHRpbWVvdXQgd2FzIHVzZWxlc3MgdG8gYWRkLiBJIHRoaW5rIHRoZSBj
bGVhbmVzdCBpcyBrZWVwaW5nIHRoZSB2MiBwYXRjaCwgYmVjYXVzZSBwb3RlbnRpYWxseSBhbnkg
d2FpdGluZyBjb2RlIGNhbiBiZSBjYWxsZWQgZHVyaW5nIGxvY2t1cCByZWNvdmVyeS4KPj4gVGhl
IGxvY2t1cCBjb2RlIGl0c2VsZiBzaG91bGQgbmV2ZXIgY2FsbCBhbnkgd2FpdGluZyBjb2RlIGFu
ZCBWMiBkb2Vzbid0IHNlZW0gdG8gaGFuZGxlIGEgY291cGxlIG9mIGNhc2VzIGNvcnJlY3RseSBl
aXRoZXIuCj4+Cj4+IEhvdyBhYm91dCBtb3ZpbmcgdGhlIGZlbmNlIHdhaXRpbmcgb3V0IG9mIHRo
ZSByZXNldCBjb2RlPwo+IFdoYXQgY2FzZXMgZGlkIEkgbWlzcyB0aGVuPwo+Cj4gSSdtIGN1cmlv
dXMgaG93IHlvdSB3YW50IHRvIG1vdmUgdGhlIGZlbmNlIHdhaXRpbmcgb3V0IG9mIHJlc2V0LCB3
aGVuIHRoZXJlIGFyZSBzbyBtYW55IHBsYWNlcyB0aGF0IGNvdWxkIHBvdGVudGlhbGx5IHdhaXQs
IGxpa2UgcmFkZW9uX2liX2dldCBjYW4gY2FsbCByYWRlb25fc2FfYm9fbmV3IHdoaWNoIGNhbiBk
byBhIHdhaXQsIG9yIHJhZGVvbl9yaW5nX2FsbG9jIHRoYXQgY2FuIHdhaXQgb24gcmFkZW9uX2Zl
bmNlX3dhaXRfbmV4dCwgZXRjLgoKVGhlIElCIHRlc3QgaXRzZWxmIGRvZXNuJ3QgbmVlZHMgdG8g
YmUgcHJvdGVjdGVkIGJ5IHRoZSBleGNsdXNpdmUgbG9jay4gCk9ubHkgZXZlcnl0aGluZyBiZXR3
ZWVuIHJhZGVvbl9zYXZlX2Jpb3Nfc2NyYXRjaF9yZWdzIGFuZCAKcmFkZW9uX3JpbmdfcmVzdG9y
ZS4KCkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
