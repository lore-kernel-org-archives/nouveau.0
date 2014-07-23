From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 14:36:08 +0200
Message-ID: <53CFAC38.9050501@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <53CF58FB.8070609@canonical.com>	<53CF5B9F.1050800@amd.com>
 <53CF5EFE.6070307@canonical.com>	<53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com>	<53CF699D.9070902@canonical.com>
 <53CF6B18.5070107@vodafone.de>
 <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
 <53CF7035.2060808@amd.com>	<53CF7191.2090008@canonical.com>
 <CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>
 <53CF765E.7020802@vodafone.de>
 <CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>
 <53CF8010.9060809@amd.com>
 <CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g@mail.gmail.com>
 <53CF822E.7050601@amd.com>
 <CAKMK7uG85KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
 <53CF84C7.2020507@vodafone.de>	<53CF8693.1040006@canonical.com>
 <53CF8AB1.2000009@amd.com>
 <CAKMK7uEgGzKb3Vsnz0FCgFCcSM39QntEisg0JMg=HOvnwLCZgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uEgGzKb3Vsnz0FCgFCcSM39QntEisg0JMg=HOvnwLCZgw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

QW0gMjMuMDcuMjAxNCAxMjo1Miwgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIzLCAyMDE0IGF0IDEyOjEzIFBNLCBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4+PiBBbmQgdGhlIGRtYS1idWYgd291bGQgc3RpbGwgaGF2ZSBm
ZW5jZXMgYmVsb25naW5nIHRvIGJvdGggZHJpdmVycywgYW5kIGl0Cj4+PiB3b3VsZCBzdGlsbCBj
YWxsIGZyb20gb3V0c2lkZSB0aGUgZHJpdmVyLgo+Pgo+PiBDYWxsaW5nIGZyb20gb3V0c2lkZSB0
aGUgZHJpdmVyIGlzIGZpbmUgYXMgbG9uZyBhcyB0aGUgZHJpdmVyIGNhbiBkbwo+PiBldmVyeXRo
aW5nIG5lY2Vzc2FyeSB0byBjb21wbGV0ZSBpdCdzIHdvcmsgYW5kIGlzbid0IGZvcmNlZCBpbnRv
IGFueSB1Z2x5Cj4+IGhhY2tzIGFuZCB0aGluZ3MgdGhhdCBhcmUgbm90IDEwMCUgcmVsaWFibGUu
Cj4+Cj4+IFNvIEkgZG9uJ3Qgc2VlIG11Y2ggb3RoZXIgYXBwcm9hY2ggYXMgaW50ZWdyYXRpbmcg
cmVjb3ZlcnkgY29kZSBmb3Igbm90Cj4+IGZpcmluZyBpbnRlcnJ1cHRzIGFuZCBzb21lIGtpbmQg
b2YgbG9ja3VwIGhhbmRsaW5nIGludG8gdGhlIGZlbmNlIGNvZGUgYXMKPj4gd2VsbC4KPiBUaGF0
IGFwcHJvYWNoIGRvZXNuJ3QgcmVhbGx5IHdvcmsgYXQgdGhhdCB3ZWxsIHNpbmNlIGV2ZXJ5IGRy
aXZlciBoYXMKPiBpdCdzIG93biByZXNldCBzZW1hbnRpY3MuIEFuZCB3ZSdyZSB0cnlpbmcgdG8g
bW92ZSBhd2F5IGZyb20gZ2xvYmFsCj4gcmVzZXQgdG8gZmluZS1ncmFpbmVkIHJlc2V0LiBTbyBz
dG9wLXRoZS13b3JsZCByZXNldCBpcyBvdXQgb2YKPiBmYXNoaW9uLCBhdCBsZWFzdCBmb3IgaTkx
NS4gQXMgeW91IHNhaWQsIHJlc2V0IGlzIG5vcm1hbCBpbiBncHVzIGFuZAo+IHdlJ3JlIHRyeWlu
ZyB0byBtYWtlIHJlc2V0IGxlc3MgaW52YXNpdmUuIEkgcmVhbGx5IGRvbid0IHNlZSBhIHBvaW50
Cj4gaW4gaW1wb3NpbmcgYSByZXNldCBzY2hlbWUgdXBvbiBhbGwgZHJpdmVycyBhbmQgSSB0aGlu
ayB5b3UgaGF2ZSBhYm91dAo+IGFzIG11Y2ggbW90aXZhdGlvbiB0byBjb252ZXJ0IHJhZGVvbiB0
byB0aGUgc2NoZW1lIHVzZWQgYnkgaTkxNSBhcwo+IEknbGwgaGF2ZSBmb3IgY29udmVydGluZyB0
byB0aGUgb25lIHVzZWQgYnkgcmFkZW9uLiBJZiBpdCB3b3VsZCBmaXQgYXQKPiBhbGwuCk9oIG15
ISBObywgSSBkaWRuJ3Qgd2FudGVkIHRvIHN1Z2dlc3QgYW55IGdsb2JhbCByZXNldCBpbmZyYXN0
cnVjdHVyZS4KCk15IGlkZWEgd2FzIG1vcmUgdGhhdCB0aGUgZmVuY2UgZnJhbWV3b3JrIHByb3Zp
ZGVzIGEgCmZlbmNlLT5wcm9jZXNzX3NpZ25hbGluZyBjYWxsYmFjayB0aGF0IGlzIHBlcmlvZGlj
YWxseSBjYWxsZWQgYWZ0ZXIgCmVuYWJsZV9zaWduYWxpbmcgaXMgY2FsbGVkIHRvIHRyaWdnZXIg
bWFudWFsIHNpZ25hbCBwcm9jZXNzaW5nIGluIHRoZSAKZHJpdmVyLgoKVGhpcyB3b3VsZCBib3Ro
IGJlIHN1aXRhYmxlIGFzIGEgZmFsbGJhY2sgaW4gY2FzZSBvZiBub3Qgd29ya2luZyAKaW50ZXJy
dXB0cyBhcyB3ZWxsIGFzIGEgY2hhbmNlIGZvciBhbnkgZHJpdmVyIHRvIGRvIG5lY2Vzc2FyeSBs
b2NrdXAgCmhhbmRsaW5nLgoKQ2hyaXN0aWFuLgoKPiBJIGd1ZXNzIGZvciByYWRlb24gd2UganVz
dCBoYXZlIHRvIGFkZCB0b25zIG9mIGluc3VsYXRpb24gYnkgcHVudGluZwo+IGFsbCBjYWxsYmFj
a3MgdG8gd29yayBpdGVtcyBzbyB0aGF0IHJhZGVvbiBjYW4gZG8gd2hhdGV2ZXIgaXQgd2FudHMu
Cj4gUGx1cyBzdGFydCBhIGRlbGF5ZWRfd29yayBiYXNlZCBmYWxsYmFjayB3aGVuIC0+ZW5hYmxl
X3NpZ25hbGxpbmcgaXMKPiBjYWxsZWQgdG8gbWFrZSBzdXJlIHdlIHdvcmsgb24gcGxhdGZvcm1z
IHRoYXQgbGFjayBpbnRlcnJ1cHRzLgo+IC1EYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
