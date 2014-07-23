From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 10:01:56 +0200
Message-ID: <CAKMK7uHVh+gUXzQ+eYeV5rzHDxbkZ_9E3C7_m6=VOUzXRpALXQ@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
 <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>
 <53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>
 <53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
 <53CE8A57.2000803@vodafone.de> <53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com> <53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CF6622.6060803@amd.com>
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

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgOTozNyBBTSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBBbSAyMy4wNy4yMDE0IDA5OjMxLCBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgSnVsIDIzLCAyMDE0IGF0IDk6MjYgQU0sIENocmlz
dGlhbiBLw7ZuaWcKPj4gPGRlYXRoc2ltcGxlQHZvZGFmb25lLmRlPiB3cm90ZToKPj4+Cj4+PiBJ
dCdzIG5vdCBhIGxvY2tpbmcgcHJvYmxlbSBJJ20gdGFsa2luZyBhYm91dCBoZXJlLiBSYWRlb25z
IGxvY2t1cAo+Pj4gaGFuZGxpbmcKPj4+IGtpY2tzIGluIHdoZW4gYW55dGhpbmcgY2FsbHMgaW50
byB0aGUgZHJpdmVyIGZyb20gdGhlIG91dHNpZGUsIGlmIHlvdQo+Pj4gaGF2ZSBhCj4+PiBmZW5j
ZSB3YWl0IGZ1bmN0aW9uIHRoYXQncyBjYWxsZWQgZnJvbSB0aGUgb3V0c2lkZSBidXQgZG9lc24n
dCBoYW5kbGUKPj4+IGxvY2t1cHMgeW91IGVzc2VudGlhbGx5IHJlbHkgb24gc29tZWJvZHkgZWxz
ZSBjYWxsaW5nIGFub3RoZXIgcmFkZW9uCj4+PiBmdW5jdGlvbiBmb3IgdGhlIGxvY2t1cCB0byBi
ZSByZXNvbHZlZC4KPj4KPj4gU28geW91IGRvbid0IGhhdmUgYSB0aW1lciBpbiByYWRlb24gdGhh
dCBwZXJpb2RpY2FsbHkgY2hlY2tzIHdoZXRoZXIKPj4gcHJvZ3Jlc3MgaXMgc3RpbGwgYmVpbmcg
bWFkZT8gVGhhdCdzIHRoZSBhcHByb2FjaCB3ZSdyZSB1c2luZyBpbiBpOTE1LAo+PiB0b2dldGhl
ciB3aXRoIHNvbWUgdHJpY2tzIHRvIGtpY2sgYW55IHN0dWNrIHdhaXRlcnMgc28gdGhhdCB3ZSBj
YW4KPj4gcmVsaWFibHkgc3RlcCBpbiBhbmQgZ3JhYiBsb2NrcyBmb3IgdGhlIHJlc2V0Lgo+Cj4K
PiBXZSB0cmllZCB0aGlzIGFwcHJvYWNoLCBidXQgaXQgZGlkbid0IHdvcmtlZCBhdCBhbGwuCj4K
PiBJIGFscmVhZHkgY29uc2lkZXJlZCB0cnlpbmcgaXQgYWdhaW4gYmVjYXVzZSBvZiB0aGUgdXBj
b21pbmcgZmVuY2UKPiBpbXBsZW1lbnRhdGlvbiwgYnV0IHJlY29uc2lkZXJpbmcgdGhhdCB3aGVu
IGEgZHJpdmVyIGlzIGZvcmNlZCB0byBjaGFuZ2UKPiBpdCdzIGhhbmRsaW5nIGJlY2F1c2Ugb2Yg
dGhlIGZlbmNlIGltcGxlbWVudGF0aW9uIHRoYXQncyBqdXN0IGFub3RoZXIgaGludAo+IHRoYXQg
dGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIGhlcmUuCgpPdXQgb2YgY3VyaW9zaXR5OiBXaGF0J3Mg
dGhlIGJsb2NrZXIgZm9yIHVzaW5nIGEgdGltZXIvc2NoZWR1bGVkIHdvcmsKdG8gcmVzZXQgcmFk
ZW9uPyBHZXR0aW5nIHRoaXMgcmlnaHQgb24gaTkxNSBoYXMgYmVlbiBmYWlybHkgdHJpY2t5IGFu
ZAp3ZSBub3cgaGF2ZSBhbiBlbGFib3JhdGUgbXVsdGktc3RhZ2Ugc3RhdGUgbWFjaGluZSB0byBn
ZXQgdGhlIGRyaXZlcgp0aHJvdWdoIGEgcmVzZXQuIFNvIGFsd2F5cyBpbnRlcmVzdGVkIGluIGRp
ZmZlcmVudCBzb2x1dGlvbnMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
