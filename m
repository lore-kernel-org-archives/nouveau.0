From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:39:13 +0200
Message-ID: <CAKMK7uG85KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CF822E.7050601@amd.com>
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

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgMTE6MzYgQU0sIENocmlzdGlhbiBLw7ZuaWcKPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMjMuMDcuMjAxNCAxMTozMCwgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOgo+Cj4+IE9uIFdlZCwgSnVsIDIzLCAyMDE0IGF0IDExOjI3IEFNLCBD
aHJpc3RpYW4gS8O2bmlnCj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4K
Pj4+IFlvdSBzdWJtaXQgYSBqb2IgdG8gdGhlIGhhcmR3YXJlIGFuZCB0aGVuIGJsb2NrIHRoZSBq
b2IgdG8gd2FpdCBmb3IKPj4+IHJhZGVvbgo+Pj4gdG8gYmUgZmluaXNoZWQ/IFdlbGwgdGhhbiB0
aGlzIHdvdWxkIGluZGVlZCByZXF1aXJlIGEgaGFyZHdhcmUgcmVzZXQsIGJ1dAo+Pj4gd291bGRu
J3QgdGhhdCBtYWtlIHRoZSB3aG9sZSBwcm9ibGVtIGV2ZW4gd29yc2U/Cj4+Pgo+Pj4gSSBtZWFu
IGN1cnJlbnRseSB3ZSBibG9jayBvbmUgdXNlcnNwYWNlIHByb2Nlc3MgdG8gd2FpdCBmb3Igb3Ro
ZXIKPj4+IGhhcmR3YXJlCj4+PiB0byBiZSBmaW5pc2hlZCB3aXRoIGEgYnVmZmVyLCBidXQgd2hh
dCB5b3UgYXJlIGRlc2NyaWJpbmcgaGVyZSBibG9ja3MgdGhlCj4+PiB3aG9sZSBoYXJkd2FyZSB0
byB3YWl0IGZvciBvdGhlciBoYXJkd2FyZSB3aGljaCBpbiB0aGUgZW5kIGJsb2NrcyBhbGwKPj4+
IHVzZXJzcGFjZSBwcm9jZXNzIGFjY2Vzc2luZyB0aGUgaGFyZHdhcmUuCj4+Cj4+IFRoZXJlIGlz
IG5vdGhpbmcgbmV3IGhlcmUgd2l0aCBwcmltZSAtIGlmIG9uZSBjb250ZXh0IGhhbmdzIHRoZSBn
cHUgaXQKPj4gYmxvY2tzIGV2ZXJ5b25lIGVsc2Ugb24gaTkxNS4KPj4KPj4+IFRhbGtpbmcgYWJv
dXQgYWx0ZXJuYXRpdmUgYXBwcm9hY2hlcyB3b3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGp1c3QK
Pj4+IG9mZmxvYWQKPj4+IHRoZSB3YWl0aW5nIHRvIGEgZGlmZmVyZW50IGtlcm5lbCBvciB1c2Vy
c3BhY2UgdGhyZWFkPwo+Pgo+PiBXZWxsIHRoaXMgaXMgZXhhY3RseSB3aGF0IHdlJ2xsIGRvIG9u
Y2Ugd2UgaGF2ZSB0aGUgc2NoZWR1bGVyLiBCdXQKPj4gdGhpcyBpcyBhbiBvcnRob2dvbmFsIGlz
c3VlIGltby4KPgo+Cj4gTWhtLCBjb3VsZCBoYXZlIHRoZSBzY2hlZHVsZXIgZmlyc3Q/Cj4KPiBD
YXVzZSB0aGF0IHNvdW5kcyBsaWtlIHJlZHVjaW5nIHRoZSBuZWNlc3NhcnkgZmVuY2UgaW50ZXJm
YWNlIHRvIGp1c3QgYQo+IGZlbmNlLT53YWl0IGZ1bmN0aW9uLgoKVGhlIHNjaGVkdWxlciBuZWVk
cyB0byBrZWVwIHRyYWNrIG9mIGEgbG90IG9mIGZlbmNlcywgc28gSSB0aGluayB3ZSdsbApoYXZl
IHRvIHJlZ2lzdGVyIGNhbGxiYWNrcywgbm90IGEgc2ltcGxlIHdhaXQgZnVuY3Rpb24uIFdlIG11
c3Qga2VlcAp0cmFjayBvZiBhbGwgdGhlIG5vbi1pOTE1IGZlbmNlcyBmb3IgYWxsIG91c3RhbmRp
bmcgYmF0Y2hlcy4gQWxzbywgdGhlCnNjaGVkdWxlciBkb2Vzbid0IGVsaW1pbmF0ZSB0aGUgaHcg
cXVldWUsIG9ubHkga2VlcCBpdCBtdWNoIHNsb3dlciBzbwp0aGF0IHdlIGNhbiBzbmVhayBpbiBo
aWdoZXIgcHJpb3JpdHkgdGhpbmdzLgoKUmVhbGx5LCBzY2hlZHVsZXIgb3Igbm90IGlzIG9ydGhv
Z29uYWwuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
