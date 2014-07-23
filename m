From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:52:57 +0200
Message-ID: <CAKMK7uG1pOxiXN1NLkNBLOEJM45ZLarJCyLe6VWSu2vS0V0Oow@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
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
 <CAKMK7uG85KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
 <CAKMK7uHEgdU+Uz-OnRGvT_wFjOXHpZmgZcrORsBrST_MY5_ADA@mail.gmail.com>
 <53CF84C7.2020507@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53CF84C7.2020507-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgMTE6NDcgQU0sIENocmlzdGlhbiBLw7ZuaWcKPGRlYXRo
c2ltcGxlQHZvZGFmb25lLmRlPiB3cm90ZToKPiBBbSAyMy4wNy4yMDE0IDExOjQ0LCBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgSnVsIDIzLCAyMDE0IGF0IDExOjM5IEFNLCBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+PiB3cm90ZToKPj4+Cj4+PiBUaGUg
c2NoZWR1bGVyIG5lZWRzIHRvIGtlZXAgdHJhY2sgb2YgYSBsb3Qgb2YgZmVuY2VzLCBzbyBJIHRo
aW5rIHdlJ2xsCj4+PiBoYXZlIHRvIHJlZ2lzdGVyIGNhbGxiYWNrcywgbm90IGEgc2ltcGxlIHdh
aXQgZnVuY3Rpb24uIFdlIG11c3Qga2VlcAo+Pj4gdHJhY2sgb2YgYWxsIHRoZSBub24taTkxNSBm
ZW5jZXMgZm9yIGFsbCBvdXN0YW5kaW5nIGJhdGNoZXMuIEFsc28sIHRoZQo+Pj4gc2NoZWR1bGVy
IGRvZXNuJ3QgZWxpbWluYXRlIHRoZSBodyBxdWV1ZSwgb25seSBrZWVwIGl0IG11Y2ggc2xvd2Vy
IHNvCj4+PiB0aGF0IHdlIGNhbiBzbmVhayBpbiBoaWdoZXIgcHJpb3JpdHkgdGhpbmdzLgo+Pj4K
Pj4+IFJlYWxseSwgc2NoZWR1bGVyIG9yIG5vdCBpcyBvcnRob2dvbmFsLgo+Pgo+PiBBbHNvIHNl
ZSBteSBvdGhlciBjb21tZW50IGFib3V0IGludGVyYWN0aW9ucyBiZXR3ZWVuIHdhaXRfZmVuY2Ug
YW5kCj4+IHRoZSBpOTE1IHJlc2V0IGxvZ2ljLiBXZSBjYW4ndCBhY3R1YWxseSB1c2UgaXQgZnJv
bSB3aXRoaW4gdGhlCj4+IHNjaGVkdWxlciBjb2RlIHNpbmNlIHRoYXQgd291bGQgZGVhZGxvY2su
Cj4KPgo+IFllYWgsIEkgc2VlLiBZb3Ugd291bGQgbmVlZCBzb21lIHdheSB0byBhYm9ydCB0aGUg
d2FpdGluZyBvbiBvdGhlciBkZXZpY2VzCj4gZmVuY2VzIGluIGNhc2Ugb2YgYSBsb2NrdXAuCj4K
PiBXaGF0IGFib3V0IGFuIHVzZXJzcGFjZSB0aHJlYWQgdG8gb2ZmbG9hZCB3YWl0aW5nIGFuZCBj
b21tYW5kIHN1Ym1pc3Npb24gdG8/CgpUaGF0J3Mgd2hhdCB5b3VyIGFuZHJvaWQgZ3V5cyBjdXJy
ZW50bHkgZG8uIFRoZXkgaGF0ZSBpdC4gQW5kIGdvb2dsZQpleHBsaWNpdGx5IGNyZWF0ZWQgdGhl
aXIgc3luY3B0cyBzdHVmZiB0byBtb3ZlIGFsbCB0aGF0IGludG8gdGhlCmtlcm5lbC4gVGhhdCBv
bmUgZG9lcyBleHBsaWNpdCBmZW5jaW5nLCBidXQgdGhlIGVuZCByZXN1bHQgaXMgc3RpbGwKdGhh
dCB5b3UgaGF2ZSBmZW5jZXMgYXMgZGVwcyBiZXR3ZWVuIGRpZmZlcmVudCBkcml2ZXJzLgoKVGhl
IG90aGVyIHByb2JsZW0gaXMgdGhhdCBkcmkvcHJpbWUgaXMgcnVubmluZyB1bmRlciBhbiBpbXBs
aWNpdGx5CnN5bmMnZWQgbW9kZWwsIHNvIHRoZXJlJ3Mgbm8gY2xlYXIgcG9pbnQvcmVzcG9uc2li
aWxpdHkgZm9yIHdobyB3b3VsZAphY3R1YWxseSBkbyB0aGUgd2FpdGluZy4gWW91J2xsIGVuZCB1
cCB3aXRoIHN5bmNocm9ub3VzIGJlaGF2aW91cgpzaW5jZSB0aGUgcmVuZGVyIHNvb25lciBvciBs
YXRlciBuZWVkcyB0byBwZXJmZWN0bHkgYWxpZ24gd2l0aApjbGllbnQvY29tcG9zaXRvciBpcGMu
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
