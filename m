From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [PATCH 09/19] drm/radeon: handle lockup in delayed work, v2
Date: Mon, 4 Aug 2014 17:04:11 +0200
Message-ID: <53DFA0EB.5040302@amd.com>
References: <20140731153245.15061.63023.stgit@patser>
 <20140731153342.15061.54264.stgit@patser> <53DBC1EC.1010001@amd.com>
 <53DBD269.80807@canonical.com> <53DF462B.2060102@amd.com>
 <53DF4A7D.3040505@canonical.com> <53DF7516.2010408@amd.com>
 <53DF8BF2.4000309@canonical.com> <53DF9AC4.3010700@amd.com>
 <53DF9B58.8000403@canonical.com> <53DF9C88.6060107@amd.com>
 <53DF9F89.60202@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53DF9F89.60202@canonical.com>
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

QW0gMDQuMDguMjAxNCB1bSAxNjo1OCBzY2hyaWViIE1hYXJ0ZW4gTGFua2hvcnN0Ogo+IG9wIDA0
LTA4LTE0IDE2OjQ1LCBDaHJpc3RpYW4gS8O2bmlnIHNjaHJlZWY6Cj4+IEFtIDA0LjA4LjIwMTQg
dW0gMTY6NDAgc2NocmllYiBNYWFydGVuIExhbmtob3JzdDoKPj4+IG9wIDA0LTA4LTE0IDE2OjM3
LCBDaHJpc3RpYW4gS8O2bmlnIHNjaHJlZWY6Cj4+Pj4+IEl0J2EgcGFpbiB0byBkZWFsIHdpdGgg
Z3B1IHJlc2V0Lgo+Pj4+IFllYWgsIHdlbGwgdGhhdCdzIG5vdGhpbmcgbmV3Lgo+Pj4+Cj4+Pj4+
IEkndmUgbm93IHRyaWVkIG90aGVyIHNvbHV0aW9ucyBidXQgdGhhdCB3b3VsZCBtZWFuIHJldmVy
dGluZyB0byB0aGUgb2xkIHN0eWxlIGR1cmluZyBncHUgbG9ja3VwIHJlY292ZXJ5LCBhbmQgb25s
eSBydW5uaW5nIHRoZSBkZWxheWVkIHdvcmsgd2hlbiAhbG9ja3VwLgo+Pj4+PiBCdXQgdGhpcyBt
ZWFudCB0aGF0IHRoZSB0aW1lb3V0IHdhcyB1c2VsZXNzIHRvIGFkZC4gSSB0aGluayB0aGUgY2xl
YW5lc3QgaXMga2VlcGluZyB0aGUgdjIgcGF0Y2gsIGJlY2F1c2UgcG90ZW50aWFsbHkgYW55IHdh
aXRpbmcgY29kZSBjYW4gYmUgY2FsbGVkIGR1cmluZyBsb2NrdXAgcmVjb3ZlcnkuCj4+Pj4gVGhl
IGxvY2t1cCBjb2RlIGl0c2VsZiBzaG91bGQgbmV2ZXIgY2FsbCBhbnkgd2FpdGluZyBjb2RlIGFu
ZCBWMiBkb2Vzbid0IHNlZW0gdG8gaGFuZGxlIGEgY291cGxlIG9mIGNhc2VzIGNvcnJlY3RseSBl
aXRoZXIuCj4+Pj4KPj4+PiBIb3cgYWJvdXQgbW92aW5nIHRoZSBmZW5jZSB3YWl0aW5nIG91dCBv
ZiB0aGUgcmVzZXQgY29kZT8KPj4+IFdoYXQgY2FzZXMgZGlkIEkgbWlzcyB0aGVuPwo+Pj4KPj4+
IEknbSBjdXJpb3VzIGhvdyB5b3Ugd2FudCB0byBtb3ZlIHRoZSBmZW5jZSB3YWl0aW5nIG91dCBv
ZiByZXNldCwgd2hlbiB0aGVyZSBhcmUgc28gbWFueSBwbGFjZXMgdGhhdCBjb3VsZCBwb3RlbnRp
YWxseSB3YWl0LCBsaWtlIHJhZGVvbl9pYl9nZXQgY2FuIGNhbGwgcmFkZW9uX3NhX2JvX25ldyB3
aGljaCBjYW4gZG8gYSB3YWl0LCBvciByYWRlb25fcmluZ19hbGxvYyB0aGF0IGNhbiB3YWl0IG9u
IHJhZGVvbl9mZW5jZV93YWl0X25leHQsIGV0Yy4KPj4gVGhlIElCIHRlc3QgaXRzZWxmIGRvZXNu
J3QgbmVlZHMgdG8gYmUgcHJvdGVjdGVkIGJ5IHRoZSBleGNsdXNpdmUgbG9jay4gT25seSBldmVy
eXRoaW5nIGJldHdlZW4gcmFkZW9uX3NhdmVfYmlvc19zY3JhdGNoX3JlZ3MgYW5kIHJhZGVvbl9y
aW5nX3Jlc3RvcmUuCj4gSSdtIG5vdCBzdXJlIGFib3V0IHRoYXQsIHdoYXQgZG8geW91IHdhbnQg
dG8gZG8gaWYgdGhlIHJpbmcgdGVzdHMgZmFpbD8gRG8geW91IGhhdmUgdG8gcmV0YWtlIHRoZSBl
eGNsdXNpdmUgbG9jaz8KCkp1c3Qgc2V0IG5lZWRfcmVzZXQgYWdhaW4gYW5kIHJldHVybiAtRUFH
QUlOLCB0aGF0IHNob3VsZCBoYXZlIG1vc3RseSAKdGhlIHNhbWUgZWZmZWN0IGFzIHdoYXQgd2Ug
YXJlIGRvaW5nIHJpZ2h0IG5vdy4KCkNocmlzdGlhbi4KCj4KPiB+TWFhcnRlbgo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
