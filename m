From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 09:31:51 +0200
Message-ID: <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CF63C2.7070407@vodafone.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple@vodafone.de>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgOToyNiBBTSwgQ2hyaXN0aWFuIEvDtm5pZwo8ZGVhdGhz
aW1wbGVAdm9kYWZvbmUuZGU+IHdyb3RlOgo+IEl0J3Mgbm90IGEgbG9ja2luZyBwcm9ibGVtIEkn
bSB0YWxraW5nIGFib3V0IGhlcmUuIFJhZGVvbnMgbG9ja3VwIGhhbmRsaW5nCj4ga2lja3MgaW4g
d2hlbiBhbnl0aGluZyBjYWxscyBpbnRvIHRoZSBkcml2ZXIgZnJvbSB0aGUgb3V0c2lkZSwgaWYg
eW91IGhhdmUgYQo+IGZlbmNlIHdhaXQgZnVuY3Rpb24gdGhhdCdzIGNhbGxlZCBmcm9tIHRoZSBv
dXRzaWRlIGJ1dCBkb2Vzbid0IGhhbmRsZQo+IGxvY2t1cHMgeW91IGVzc2VudGlhbGx5IHJlbHkg
b24gc29tZWJvZHkgZWxzZSBjYWxsaW5nIGFub3RoZXIgcmFkZW9uCj4gZnVuY3Rpb24gZm9yIHRo
ZSBsb2NrdXAgdG8gYmUgcmVzb2x2ZWQuCgpTbyB5b3UgZG9uJ3QgaGF2ZSBhIHRpbWVyIGluIHJh
ZGVvbiB0aGF0IHBlcmlvZGljYWxseSBjaGVja3Mgd2hldGhlcgpwcm9ncmVzcyBpcyBzdGlsbCBi
ZWluZyBtYWRlPyBUaGF0J3MgdGhlIGFwcHJvYWNoIHdlJ3JlIHVzaW5nIGluIGk5MTUsCnRvZ2V0
aGVyIHdpdGggc29tZSB0cmlja3MgdG8ga2ljayBhbnkgc3R1Y2sgd2FpdGVycyBzbyB0aGF0IHdl
IGNhbgpyZWxpYWJseSBzdGVwIGluIGFuZCBncmFiIGxvY2tzIGZvciB0aGUgcmVzZXQuCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
