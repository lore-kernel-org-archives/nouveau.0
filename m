From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 12:52:50 +0200
Message-ID: <CAKMK7uEgGzKb3Vsnz0FCgFCcSM39QntEisg0JMg=HOvnwLCZgw@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <53CE8A57.2000803@vodafone.de> <53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com> <53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com> <53CF699D.9070902@canonical.com>
 <53CF6B18.5070107@vodafone.de>
 <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
 <53CF7035.2060808@amd.com> <53CF7191.2090008@canonical.com>
 <CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>
 <53CF765E.7020802@vodafone.de>
 <CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>
 <53CF8010.9060809@amd.com>
 <CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g@mail.gmail.com>
 <53CF822E.7050601@amd.com>
 <CAKMK7uG85KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
 <53CF84C7.2020507@vodafone.de> <53CF8693.1040006@canonical.com>
 <53CF8AB1.2000009@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CF8AB1.2000009@amd.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgMTI6MTMgUE0sIENocmlzdGlhbiBLw7ZuaWcKPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPj4gQW5kIHRoZSBkbWEtYnVmIHdvdWxkIHN0
aWxsIGhhdmUgZmVuY2VzIGJlbG9uZ2luZyB0byBib3RoIGRyaXZlcnMsIGFuZCBpdAo+PiB3b3Vs
ZCBzdGlsbCBjYWxsIGZyb20gb3V0c2lkZSB0aGUgZHJpdmVyLgo+Cj4KPiBDYWxsaW5nIGZyb20g
b3V0c2lkZSB0aGUgZHJpdmVyIGlzIGZpbmUgYXMgbG9uZyBhcyB0aGUgZHJpdmVyIGNhbiBkbwo+
IGV2ZXJ5dGhpbmcgbmVjZXNzYXJ5IHRvIGNvbXBsZXRlIGl0J3Mgd29yayBhbmQgaXNuJ3QgZm9y
Y2VkIGludG8gYW55IHVnbHkKPiBoYWNrcyBhbmQgdGhpbmdzIHRoYXQgYXJlIG5vdCAxMDAlIHJl
bGlhYmxlLgo+Cj4gU28gSSBkb24ndCBzZWUgbXVjaCBvdGhlciBhcHByb2FjaCBhcyBpbnRlZ3Jh
dGluZyByZWNvdmVyeSBjb2RlIGZvciBub3QKPiBmaXJpbmcgaW50ZXJydXB0cyBhbmQgc29tZSBr
aW5kIG9mIGxvY2t1cCBoYW5kbGluZyBpbnRvIHRoZSBmZW5jZSBjb2RlIGFzCj4gd2VsbC4KClRo
YXQgYXBwcm9hY2ggZG9lc24ndCByZWFsbHkgd29yayBhdCB0aGF0IHdlbGwgc2luY2UgZXZlcnkg
ZHJpdmVyIGhhcwppdCdzIG93biByZXNldCBzZW1hbnRpY3MuIEFuZCB3ZSdyZSB0cnlpbmcgdG8g
bW92ZSBhd2F5IGZyb20gZ2xvYmFsCnJlc2V0IHRvIGZpbmUtZ3JhaW5lZCByZXNldC4gU28gc3Rv
cC10aGUtd29ybGQgcmVzZXQgaXMgb3V0IG9mCmZhc2hpb24sIGF0IGxlYXN0IGZvciBpOTE1LiBB
cyB5b3Ugc2FpZCwgcmVzZXQgaXMgbm9ybWFsIGluIGdwdXMgYW5kCndlJ3JlIHRyeWluZyB0byBt
YWtlIHJlc2V0IGxlc3MgaW52YXNpdmUuIEkgcmVhbGx5IGRvbid0IHNlZSBhIHBvaW50CmluIGlt
cG9zaW5nIGEgcmVzZXQgc2NoZW1lIHVwb24gYWxsIGRyaXZlcnMgYW5kIEkgdGhpbmsgeW91IGhh
dmUgYWJvdXQKYXMgbXVjaCBtb3RpdmF0aW9uIHRvIGNvbnZlcnQgcmFkZW9uIHRvIHRoZSBzY2hl
bWUgdXNlZCBieSBpOTE1IGFzCkknbGwgaGF2ZSBmb3IgY29udmVydGluZyB0byB0aGUgb25lIHVz
ZWQgYnkgcmFkZW9uLiBJZiBpdCB3b3VsZCBmaXQgYXQKYWxsLgoKSSBndWVzcyBmb3IgcmFkZW9u
IHdlIGp1c3QgaGF2ZSB0byBhZGQgdG9ucyBvZiBpbnN1bGF0aW9uIGJ5IHB1bnRpbmcKYWxsIGNh
bGxiYWNrcyB0byB3b3JrIGl0ZW1zIHNvIHRoYXQgcmFkZW9uIGNhbiBkbyB3aGF0ZXZlciBpdCB3
YW50cy4KUGx1cyBzdGFydCBhIGRlbGF5ZWRfd29yayBiYXNlZCBmYWxsYmFjayB3aGVuIC0+ZW5h
YmxlX3NpZ25hbGxpbmcgaXMKY2FsbGVkIHRvIG1ha2Ugc3VyZSB3ZSB3b3JrIG9uIHBsYXRmb3Jt
cyB0aGF0IGxhY2sgaW50ZXJydXB0cy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
