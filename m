From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 09/19] drm/radeon: handle lockup in delayed work, v2
Date: Mon, 04 Aug 2014 16:58:17 +0200
Message-ID: <53DF9F89.60202@canonical.com>
References: <20140731153245.15061.63023.stgit@patser>
 <20140731153342.15061.54264.stgit@patser> <53DBC1EC.1010001@amd.com>
 <53DBD269.80807@canonical.com> <53DF462B.2060102@amd.com>
 <53DF4A7D.3040505@canonical.com> <53DF7516.2010408@amd.com>
 <53DF8BF2.4000309@canonical.com> <53DF9AC4.3010700@amd.com>
 <53DF9B58.8000403@canonical.com> <53DF9C88.6060107@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53DF9C88.6060107@amd.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, airlied@linux.ie
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com
List-Id: nouveau.vger.kernel.org

b3AgMDQtMDgtMTQgMTY6NDUsIENocmlzdGlhbiBLw7ZuaWcgc2NocmVlZjoKPiBBbSAwNC4wOC4y
MDE0IHVtIDE2OjQwIHNjaHJpZWIgTWFhcnRlbiBMYW5raG9yc3Q6Cj4+IG9wIDA0LTA4LTE0IDE2
OjM3LCBDaHJpc3RpYW4gS8O2bmlnIHNjaHJlZWY6Cj4+Pj4gSXQnYSBwYWluIHRvIGRlYWwgd2l0
aCBncHUgcmVzZXQuCj4+PiBZZWFoLCB3ZWxsIHRoYXQncyBub3RoaW5nIG5ldy4KPj4+Cj4+Pj4g
SSd2ZSBub3cgdHJpZWQgb3RoZXIgc29sdXRpb25zIGJ1dCB0aGF0IHdvdWxkIG1lYW4gcmV2ZXJ0
aW5nIHRvIHRoZSBvbGQgc3R5bGUgZHVyaW5nIGdwdSBsb2NrdXAgcmVjb3ZlcnksIGFuZCBvbmx5
IHJ1bm5pbmcgdGhlIGRlbGF5ZWQgd29yayB3aGVuICFsb2NrdXAuCj4+Pj4gQnV0IHRoaXMgbWVh
bnQgdGhhdCB0aGUgdGltZW91dCB3YXMgdXNlbGVzcyB0byBhZGQuIEkgdGhpbmsgdGhlIGNsZWFu
ZXN0IGlzIGtlZXBpbmcgdGhlIHYyIHBhdGNoLCBiZWNhdXNlIHBvdGVudGlhbGx5IGFueSB3YWl0
aW5nIGNvZGUgY2FuIGJlIGNhbGxlZCBkdXJpbmcgbG9ja3VwIHJlY292ZXJ5Lgo+Pj4gVGhlIGxv
Y2t1cCBjb2RlIGl0c2VsZiBzaG91bGQgbmV2ZXIgY2FsbCBhbnkgd2FpdGluZyBjb2RlIGFuZCBW
MiBkb2Vzbid0IHNlZW0gdG8gaGFuZGxlIGEgY291cGxlIG9mIGNhc2VzIGNvcnJlY3RseSBlaXRo
ZXIuCj4+Pgo+Pj4gSG93IGFib3V0IG1vdmluZyB0aGUgZmVuY2Ugd2FpdGluZyBvdXQgb2YgdGhl
IHJlc2V0IGNvZGU/Cj4+IFdoYXQgY2FzZXMgZGlkIEkgbWlzcyB0aGVuPwo+Pgo+PiBJJ20gY3Vy
aW91cyBob3cgeW91IHdhbnQgdG8gbW92ZSB0aGUgZmVuY2Ugd2FpdGluZyBvdXQgb2YgcmVzZXQs
IHdoZW4gdGhlcmUgYXJlIHNvIG1hbnkgcGxhY2VzIHRoYXQgY291bGQgcG90ZW50aWFsbHkgd2Fp
dCwgbGlrZSByYWRlb25faWJfZ2V0IGNhbiBjYWxsIHJhZGVvbl9zYV9ib19uZXcgd2hpY2ggY2Fu
IGRvIGEgd2FpdCwgb3IgcmFkZW9uX3JpbmdfYWxsb2MgdGhhdCBjYW4gd2FpdCBvbiByYWRlb25f
ZmVuY2Vfd2FpdF9uZXh0LCBldGMuCj4KPiBUaGUgSUIgdGVzdCBpdHNlbGYgZG9lc24ndCBuZWVk
cyB0byBiZSBwcm90ZWN0ZWQgYnkgdGhlIGV4Y2x1c2l2ZSBsb2NrLiBPbmx5IGV2ZXJ5dGhpbmcg
YmV0d2VlbiByYWRlb25fc2F2ZV9iaW9zX3NjcmF0Y2hfcmVncyBhbmQgcmFkZW9uX3JpbmdfcmVz
dG9yZS4KSSdtIG5vdCBzdXJlIGFib3V0IHRoYXQsIHdoYXQgZG8geW91IHdhbnQgdG8gZG8gaWYg
dGhlIHJpbmcgdGVzdHMgZmFpbD8gRG8geW91IGhhdmUgdG8gcmV0YWtlIHRoZSBleGNsdXNpdmUg
bG9jaz8KCn5NYWFydGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
