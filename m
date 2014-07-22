From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence implementation for
 fences
Date: Tue, 22 Jul 2014 17:19:56 +0200
Message-ID: <CAKMK7uESXrDtCov8whOTsffg6eZdibF4qaTFaCubM=mnhN=gNQ@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
 <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>
 <53CE56ED.4040109@vodafone.de> <53CE6FB0.90500@canonical.com>
 <53CE7410.3090603@amd.com> <53CE74B5.3000201@canonical.com>
 <53CE77B4.6020801@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CE77B4.6020801@amd.com>
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

T24gVHVlLCBKdWwgMjIsIDIwMTQgYXQgNDozOSBQTSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBBbSAyMi4wNy4yMDE0IDE2OjI3LCBzY2hyaWVi
IE1hYXJ0ZW4gTGFua2hvcnN0Ogo+Cj4+IG9wIDIyLTA3LTE0IDE2OjI0LCBDaHJpc3RpYW4gS8O2
bmlnIHNjaHJlZWY6Cj4+Pj4KPj4+PiBObywgeW91IHJlYWxseSBzaG91bGRuJ3QgYmUgZG9pbmcg
bXVjaCBpbiB0aGUgY2hlY2sgYW55d2F5LCBpdCdzIG1lYW50Cj4+Pj4gdG8gYmUgYSBsaWdodHdl
aWdodCBjaGVjay4gSWYgeW91J3JlIG5vdCByZWFkeSB5ZXQgYmVjYXVzZSBvZiBhIGxvY2t1cAo+
Pj4+IHNpbXBseSByZXR1cm4gbm90IHNpZ25hbGVkIHlldC4KPj4+Cj4+PiBJdCdzIG5vdCBvbmx5
IHRoZSBsb2NrdXAgY2FzZSBmcm9tIHJhZGVvbiBJIGhhdmUgaW4gbWluZCBoZXJlLiBGb3IKPj4+
IHVzZXJzcGFjZSBxdWV1ZXMgaXQgbWlnaHQgYmUgbmVjZXNzYXJ5IHRvIGNhbGwgY29weV9mcm9t
X3VzZXIgdG8gZmlndXJlIG91dAo+Pj4gaWYgYSBmZW5jZSBpcyBzaWduYWxlZCBvciBub3QuCj4+
Pgo+Pj4gUmV0dXJuaW5nIGZhbHNlIGFsbCB0aGUgdGltZSBpcyBwcm9iYWJseSBub3QgYSBnb29k
IGlkZWEgZWl0aGVyLgo+Pgo+PiBIYXZpbmcgdXNlcnNwYWNlIGltcGxlbWVudCBhIGZlbmNlIHNv
dW5kcyBsaWtlIGFuIGF3ZnVsIGlkZWEsIHdoeSB3b3VsZAo+PiB5b3Ugd2FudCB0byBkbyB0aGF0
Pwo+Cj4KPiBNYXJrZXRpbmcgbW92ZXMgaW4gbXlzdGVyaW91cyB3YXlzLiBEb24ndCBhc2sgbWUs
IGJ1dCB0aGF0IHRoZSBkaXJlY3Rpb24gaXQKPiBjdXJyZW50bHkgbW92ZXMgd2l0aCB1c2Vyc3Bh
Y2UgcXVldWVzIGFuZCBJT01NVSBldGMuLi4KCkZlbmNlLWJhc2VkIHN5bmNpbmcgYmV0d2VlbiB1
c2Vyc3BhY2UgcXVldWVzIHN1Ym1pdHRlZCBzdHVmZiB0aHJvdWdoCmRvb3JiZWxscyBhbmQgYW55
dGhpbmcgc3VibWl0dGVkIGJ5IHRoZSBnZW5lcmFsIHNpbXBseSB3b250IHdvcmsuCldoaWNoIGlz
IHdoeSBJIHRoaW5rIHRoZSBkb29yYmVsbCBpcyBhIHN0dXBpZCBpbnRlcmZhY2Ugc2luY2UgSSBq
dXN0CmRvbid0IHNlZSBjYW1lcmFzIGFuZCB2NGwgZGV2aWNlcyBpbXBsZW1lbnRpbmcgYWxsIHRo
YXQgY29tcGxleGl0eSB0bwpnZXQgYSBwdXJlIHVzZXJzcGFjZSBzaWRlIHN5bmMgc29sdXRpb24u
CgpCdXQgdGhhdCdzIGEgZGlmZmVyZW50IHByb2JsZW0gcmVhbGx5LCBhbmQgSSBndWVzcyBtYXJr
ZXRpbmcgd2lsbApldmVudHVhbGx5IGZpZ3VyZSB0aGlzIG9uZSBvdXQsIHRvby4KLURhbmllbAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0
MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
