From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 14:42:07 +0200
Message-ID: <CAKMK7uG+JuShi56gVkBc=vg+wsPiojixV7shH0ucY5av8HKhVg@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <53CF58FB.8070609@canonical.com> <53CF5B9F.1050800@amd.com>
 <53CF5EFE.6070307@canonical.com> <53CF63C2.7070407@vodafone.de>
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
 <CAKMK7uEgGzKb3Vsnz0FCgFCcSM39QntEisg0JMg=HOvnwLCZgw@mail.gmail.com>
 <53CFAC38.9050501@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CFAC38.9050501@amd.com>
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

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgMjozNiBQTSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBNeSBpZGVhIHdhcyBtb3JlIHRoYXQgdGhlIGZl
bmNlIGZyYW1ld29yayBwcm92aWRlcyBhCj4gZmVuY2UtPnByb2Nlc3Nfc2lnbmFsaW5nIGNhbGxi
YWNrIHRoYXQgaXMgcGVyaW9kaWNhbGx5IGNhbGxlZCBhZnRlcgo+IGVuYWJsZV9zaWduYWxpbmcg
aXMgY2FsbGVkIHRvIHRyaWdnZXIgbWFudWFsIHNpZ25hbCBwcm9jZXNzaW5nIGluIHRoZQo+IGRy
aXZlci4KPgo+IFRoaXMgd291bGQgYm90aCBiZSBzdWl0YWJsZSBhcyBhIGZhbGxiYWNrIGluIGNh
c2Ugb2Ygbm90IHdvcmtpbmcgaW50ZXJydXB0cwo+IGFzIHdlbGwgYXMgYSBjaGFuY2UgZm9yIGFu
eSBkcml2ZXIgdG8gZG8gbmVjZXNzYXJ5IGxvY2t1cCBoYW5kbGluZy4KCkltbyB0aGF0IHNob3Vs
ZCBiZSBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2YgdGhlIGZlbmNlIHByb3ZpZGVyLiBTbwpp
biAtPmVuYWJsZV9zaWduYWxpbmcgcmFkZW9uIG5lZWRzIHRvIGFybSBhIGRlbGF5ZWQgd29yayB0
byByZWd1bGFybHkKY2hlY2sgZmVuY2UgYW5kIHNpZ25hbCB0aGVtIGlmIHRoZSBpcnEgZmFpbGVk
LiBJZiBpdCdzIGEgY29tbW9uIG5lZWQKd2UgbWlnaHQgcHJvdmlkZSBzb21lIHNoYXJlZCBjb2Rl
IGZvciB0aGlzIChlLmcuIGEgc3RydWN0CnVucmVsaWFibGVfZmVuY2Ugb3Igc28pLiBCdXQgdGhp
cyBzaG91bGRuJ3QgYmUgbWFuZGF0b3J5IHNpbmNlIG5vdCBhbGwKZ3B1cyBhcmUgYnJva2VuIGxp
a2UgdGhhdC4KCkFuZCBpZiB3ZSBmb3JjZSBvdGhlciBkcml2ZXJzIHRvIGNhcmUgZm9yIHRoaXMg
c3BlY2lhbCBjYXNlIHRoYXQgaW1vCmxlYWtzIHRoZSBhYnN0cmFjdGlvbiBvdXQgb2YgcmFkZW9u
IChvciBhbnkgb3RoZXIgZHJpdmVyIHdpdGgKdW5yZWxpYWJsZSBpbnRlcnJ1cHRzKS4KLURhbmll
bAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
KzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
