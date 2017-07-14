From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [Nouveau] [regression drm/noveau] suspend to ram -> BOOM:
 exception RIP: drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 17:55:41 +0200
Message-ID: <20170714155541.onocqn5o4f7v2mlh@hirez.programming.kicks-ass.net>
References: <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de>
 <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
 <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
 <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
 <31d327dd-bc3d-cb80-45a9-6a8eb9eb2a9d@mni.thm.de>
 <CAKb7UvhtOBOcOcsZXXXa2qVDd6YWQaZrKtMwfPj5V8wk=97DXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvhtOBOcOcsZXXXa2qVDd6YWQaZrKtMwfPj5V8wk=97DXw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Mike Galbraith <efault@gmx.de>, Karol Herbst <karolherbst@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgMTE6MjA6MDFBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgMTE6MTkgQU0sIFRvYmlhcyBLbGF1c21hbm4K
PiA8dG9iaWFzLmpvaGFubmVzLmtsYXVzbWFubkBtbmkudGhtLmRlPiB3cm90ZToKPiA+IFRoZSBj
b252ZXJzaW9uIGlzIGEgbmljZSBjYXRjaCwgYnV0IGknZCBsaWtlIHRvIGhhdmUgYSBiaXQgbW9y
ZSBjb250ZXh0LCBzZWUKPiA+IGJlbG93IQo+ID4KPiA+IFdpdGggYSBiZXR0ZXIgZGVzY3JpcHRp
b246Cj4gPgo+ID4gVG9iaWFzIEtsYXVzbWFubiA8dG9iaWFzLmpvaGFubmVzLmtsYXVzbWFubkBt
bmkudGhtLmRlPgo+IAo+IEkgZG9uJ3QgdGhpbmsgaXQgd2FzIG1lYW50IGFzIGEgc2VyaW91cyBw
YXRjaC4gV0FSTl9PTl9PTkNFIHNob3VsZAo+IHdvcmsuIFRoZSBmaXggaXNuJ3QgdG8gcmVtb3Zl
IGFsbCBpbnN0YW5jZXMgb2YgV0FSTl9PTl9PTkNFLiBUaGUgZml4Cj4gaXMgdG8gZml4IFdBUk5f
T05fT05DRS4KClF1aXRlIHNvLiBDbGVhcmx5IEkgYnVnZ2VyZWQgaXQgZm9yIG1vZHVsZXM7IHRo
YXQgcmVhbGx5IHdhc24ndCB0aGUKcGxhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
