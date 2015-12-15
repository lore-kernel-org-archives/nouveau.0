From: Greg KH <greg@kroah.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix pre-nv50 pageflip events (v4)
Date: Tue, 15 Dec 2015 09:04:37 -0800
Message-ID: <20151215170437.GE18302@kroah.com>
References: <1447173451-27890-1-git-send-email-thierry.reding@gmail.com>
 <20151110164139.GA27962@ulmo> <566FF56C.8000803@gmail.com>
 <CACvgo52MEzy-VovQa0UPrMq+ZsB6pzDA++FcRw_A-=YSMC8i2A@mail.gmail.com>
 <56702B39.5040903@gmail.com>
 <CACvgo53PUcP43isv85p2DVO5YtgBajm7_n5Thsg1Y7zzf+zsMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CACvgo53PUcP43isv85p2DVO5YtgBajm7_n5Thsg1Y7zzf+zsMQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: russianneuromancer@ya.ru, ML dri-devel <dri-devel@lists.freedesktop.org>, "# 3.13+" <stable@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>, Ikey Doherty <ikey@solus-project.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBEZWMgMTUsIDIwMTUgYXQgMDM6MTc6MjFQTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIDE1IERlY2VtYmVyIDIwMTUgYXQgMTU6MDEsIHBvbWEgPHBvbWlkb3JhYmVsaXNp
bWFAZ21haWwuY29tPiB3cm90ZToKPiA+IE9uIDE1LjEyLjIwMTUgMTI6MjEsIEVtaWwgVmVsaWtv
diB3cm90ZToKPiA+PiBPbiAxNSBEZWNlbWJlciAyMDE1IGF0IDExOjExLCBwb21hIDxwb21pZG9y
YWJlbGlzaW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pj4KPiA+Pj4gQXBwYXJlbnRseSBu
b3QgcmVhY2hlZCBAc3RhYmxlIChzdGFibGU6IDQuMy4zIDIwMTUtMTItMTUpLAo+ID4+PiBzbyBo
ZXJlJ3Mgb25lIG1vcmUgdGltZS4KPiA+Pj4KPiA+PiBJdCBoYXMgcmVhY2hlZCA0LjQtcmNYIGFu
ZCB3aWxsIGdldCBwaWNrZWQgYnkgdGhlIHN0YWJsZSBtYWludGFpbmVyCj4gPj4gKEdyZWc/KSBp
biBkdWUgdGltZS4gTWVhbndoaWxlIHlvdSBjYW4gYXNrIHlvdXIgZGlzdHJvIG1haW50YWluZXJz
IHRvCj4gPj4gYXBwbHkgaXQgbG9jYWxseSB1bnRpbCB3ZSBnZXQgYW4gb2ZmaWNpYWwgcmVsZWFz
ZSB0aGF0IGluY2x1ZGVzIGl0Lgo+ID4+Cj4gPj4gLUVtaWwKPiA+Pgo+ID4KPiA+IEl0IGlzIGFs
bCBidXQgdW5rbm93biA7KQo+ID4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVn
LmNnaT9pZD0xMjgxMzY4Cj4gPgo+ID4gRW1pbCwgdGhlIHBvaW50IGlzIC0gaWYgaXQgaGFzIC1u
b3QtIHJlYWNoZWQgc3RhYmxlQHZnZXIua2VybmVsLm9yZywgaG93IGNhbiBpdCBiZSBhcHBsaWVk
LCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gPgo+IFRoZSBzYW1lIHdheSBtYW55IG90aGVycyBkbyA/
IEknZCBpbWFnaW5lIHRoZXJlIGlzIGEgdG9vbC9zY3JpcHQgd2hpY2gKPiBwYXJzZXMgdGhyb3Vn
aCB0aGUgZGV2ZWxvcG1lbnQgdHJlZSwgd2hpY2ggd291bGQgZXhwbGFpbiB3aHkgKG1hbnk/KQo+
IHBlb3BsZSBleHBsaWNpdGx5IHN1cHByZXNzIGdpdCBmcm9tIHNlbmRpbmcgYW4gZW1haWwgeWV0
IHRoaW5ncyBzdGlsbAo+IHdvcmsuIFRoZXJlIGlzIGV4dHJhIGluZm9ybWF0aW9uIGluIHRoZSBk
b2N1bWVudGF0aW9uIFsxXSBpZiB5b3UncmUKPiBpbnRlcmVzdGVkLgoKWWVzLCB0aGlzIGlzIGlu
IHRoZSBxdWV1ZSwgYWxvbmcgd2l0aCAyNzYgb3RoZXIgcGF0Y2hlcyB0aGF0IEkgbmVlZCB0bwph
cHBseSBhcyB3ZWxsLiAgVGhlIGJhY2tsb2cgaXMgbGFyZ2UgdGhpcyB0aW1lIG9mIHllYXIsIHNv
cnJ5LgoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
