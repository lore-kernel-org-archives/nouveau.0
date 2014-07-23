From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 10:20:05 +0200
Message-ID: <53CF7035.2060808@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>	<20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>	<53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>	<53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
 <53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com>	<53CF699D.9070902@canonical.com>
 <53CF6B18.5070107@vodafone.de>
 <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5p?= =?UTF-8?B?Zw==?= <deathsimple@vodafone.de>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

QW0gMjMuMDcuMjAxNCAxMDowNywgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIzLCAyMDE0IGF0IDk6NTggQU0sIENocmlzdGlhbiBLw7ZuaWcKPiA8ZGVhdGhzaW1wbGVAdm9k
YWZvbmUuZGU+IHdyb3RlOgo+PiBKdXN0IGltYWdpbmUgYW4gYXBwbGljYXRpb24gdXNpbmcgcHJp
bWUgaXMgbG9ja2luZyB1cCBSYWRlb24gYW5kIGJlY2F1c2Ugb2YKPj4gdGhhdCBnZXRzIGtpbGxl
ZCBieSB0aGUgdXNlci4gTm90aGluZyBlbHNlIGluIHRoZSBzeXN0ZW0gd291bGQgdXNlIHRoZQo+
PiBSYWRlb24gaGFyZHdhcmUgYW55IG1vcmUgYW5kIHNvIHJhZGVvbiBnZXRzIG9ubHkgY2FsbGVk
IGJ5IGFub3RoZXIgZHJpdmVyCj4+IHdhaXRpbmcgcGF0aWVudGx5IGZvciByYWRlb24gdG8gZmlu
aXNoIHJlbmRlcmluZyB3aGljaCBuZXZlciBoYXBwZW5zIGJlY2F1c2UKPj4gdGhlIHdob2xlIHRo
aW5nIGlzIGxvY2tlZCB1cCBhbmQgd2UgZG9uJ3QgZ2V0IGEgY2hhbmNlIHRvIHJlY292ZXIuCj4g
QnV0IGlzbid0IHRoYXQgcG9zc2libGUgYWxyZWFkeSB3aXRob3V0IGZlbmNlcz8gWCBoYW5ncyBy
YWRlb24sIHVzZXIKPiBjcmFzaGVzIFggZm9yIHVucmVsYXRlZCByZWFzb25zIGJlZm9yZSByYWRl
b24gd2lsbCBub3RpY2UgdGhlIGhhbmcuCj4gVGhlbiBubyBvbmUgdXNlcyByYWRlb24gYW55IGxv
bmdlciBhbmQgdGhlIGhhbmcgc3RheXMgdW5kZXRlY3RlZC4KClllYWgsIGVzcGVjaWFsbHkgd2l0
aCBtdWx0aW1lZGlhIGFwcGxpY2F0aW9uLiBCdXQgSSBkb24ndCByZWFsbHkgY2FyZSAKYWJvdXQg
dGhpcyBwcm9ibGVtIGJlY2F1c2UgdGhlIG5leHQgdGltZSBhbiBhcHBsaWNhdGlvbiB0cmllcyB0
byB1c2UgdGhlIApibG9jayBpbiBxdWVzdGlvbiB3ZSBhY3R1YWxseSBkbyB0aGUgcmVzZXQgYW5k
IGV2ZXJ5dGhpbmcgaXMgZmluZS4KCkluIHlvdXIgZXhhbXBsZSB3ZSB3b3VsZCBkbyB0aGUgcmVz
ZXQgd2hlbiB0aGUgbmV4dCBYIHNlcnZlciBzdGFydHMsIApiZWZvcmUgdGhhdCBwb2ludCBub2Jv
ZHkgd291bGQgY2FyZSBiZWNhdXNlIG5vYm9keSB1c2VzIHRoZSBoYXJkd2FyZS4KCkFuIGFkZGl0
aW9uYWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQgcmVzZXRzIGFyZSBzb21ldGhpbmcgcGVyZmVjdCBu
b3JtYWwgCmZvciByYWRlb24uIEZvciBleGFtcGxlIFVWRCBjYW4gImNyYXNoIiB3aGVuIHlvdSBm
ZWVkIGl0IHdpdGggaW52YWxpZCAKYml0c3RyZWFtIGRhdGEsIChvayBhY3R1YWxseSBpdCBzZW5k
IGFuIGludGVycnVwdCBhbmQgc3RvcHMgYW55IApwcm9jZXNzaW5nIGZvciB0aGUgZHJpdmVyIHRv
IGludmVzdGlnYXRlKS4gVG8gY29udGludWUgcHJvY2Vzc2luZyB5b3UgCm5lZWQgdG8gZ28gdGhy
b3VnaCBhIHJhdGhlciBjb21wbGljYXRlZCByZXNldCBwcm9jZWR1cmUuCgpDaHJpc3RpYW4uCgo+
IC1EYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
