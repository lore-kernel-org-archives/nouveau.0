From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:38:22 +0200
Message-ID: <53CF828E.5020201@canonical.com>
References: <20140709093124.11354.3774.stgit@patser>	<53CE6AFA.1060807@vodafone.de>	<CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>	<53CE84AA.9030703@amd.com>	<CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>	<53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>	<53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>	<53CF63C2.7070407@vodafone.de>	<CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>	<53CF6622.6060803@amd.com>	<53CF699D.9070902@canonical.com>	<53CF6B18.5070107@vodafone.de>	<CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>	<53CF7035.2060808@amd.com>	<53CF7191.2090008@canonical.com>	<CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>	<53CF765E.7020802@vodafone.de>	<CAKMK7
 uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>	<53CF8010.9060809@amd.com>
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
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "Deucher, Alexander" <alexander.deucher@amd.com>
List-Id: nouveau.vger.kernel.org

b3AgMjMtMDctMTQgMTE6MzYsIENocmlzdGlhbiBLw7ZuaWcgc2NocmVlZjoKPiBBbSAyMy4wNy4y
MDE0IDExOjMwLCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgSnVsIDIzLCAyMDE0
IGF0IDExOjI3IEFNLCBDaHJpc3RpYW4gS8O2bmlnCj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+Pj4gWW91IHN1Ym1pdCBhIGpvYiB0byB0aGUgaGFyZHdhcmUgYW5kIHRoZW4g
YmxvY2sgdGhlIGpvYiB0byB3YWl0IGZvciByYWRlb24KPj4+IHRvIGJlIGZpbmlzaGVkPyBXZWxs
IHRoYW4gdGhpcyB3b3VsZCBpbmRlZWQgcmVxdWlyZSBhIGhhcmR3YXJlIHJlc2V0LCBidXQKPj4+
IHdvdWxkbid0IHRoYXQgbWFrZSB0aGUgd2hvbGUgcHJvYmxlbSBldmVuIHdvcnNlPwo+Pj4KPj4+
IEkgbWVhbiBjdXJyZW50bHkgd2UgYmxvY2sgb25lIHVzZXJzcGFjZSBwcm9jZXNzIHRvIHdhaXQg
Zm9yIG90aGVyIGhhcmR3YXJlCj4+PiB0byBiZSBmaW5pc2hlZCB3aXRoIGEgYnVmZmVyLCBidXQg
d2hhdCB5b3UgYXJlIGRlc2NyaWJpbmcgaGVyZSBibG9ja3MgdGhlCj4+PiB3aG9sZSBoYXJkd2Fy
ZSB0byB3YWl0IGZvciBvdGhlciBoYXJkd2FyZSB3aGljaCBpbiB0aGUgZW5kIGJsb2NrcyBhbGwK
Pj4+IHVzZXJzcGFjZSBwcm9jZXNzIGFjY2Vzc2luZyB0aGUgaGFyZHdhcmUuCj4+IFRoZXJlIGlz
IG5vdGhpbmcgbmV3IGhlcmUgd2l0aCBwcmltZSAtIGlmIG9uZSBjb250ZXh0IGhhbmdzIHRoZSBn
cHUgaXQKPj4gYmxvY2tzIGV2ZXJ5b25lIGVsc2Ugb24gaTkxNS4KPj4KPj4+IFRhbGtpbmcgYWJv
dXQgYWx0ZXJuYXRpdmUgYXBwcm9hY2hlcyB3b3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGp1c3Qg
b2ZmbG9hZAo+Pj4gdGhlIHdhaXRpbmcgdG8gYSBkaWZmZXJlbnQga2VybmVsIG9yIHVzZXJzcGFj
ZSB0aHJlYWQ/Cj4+IFdlbGwgdGhpcyBpcyBleGFjdGx5IHdoYXQgd2UnbGwgZG8gb25jZSB3ZSBo
YXZlIHRoZSBzY2hlZHVsZXIuIEJ1dAo+PiB0aGlzIGlzIGFuIG9ydGhvZ29uYWwgaXNzdWUgaW1v
Lgo+Cj4gTWhtLCBjb3VsZCBoYXZlIHRoZSBzY2hlZHVsZXIgZmlyc3Q/Cj4KPiBDYXVzZSB0aGF0
IHNvdW5kcyBsaWtlIHJlZHVjaW5nIHRoZSBuZWNlc3NhcnkgZmVuY2UgaW50ZXJmYWNlIHRvIGp1
c3QgYSBmZW5jZS0+d2FpdCBmdW5jdGlvbi4KWW91IHdvdWxkIGFsc28gbG9zZSBiZW5lZml0cyBs
aWtlIGhhdmluZyBhICdwZXJmIHRpbWVjaGFydCcgZm9yIGdwdSdzLgoKfk1hYXJ0ZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
