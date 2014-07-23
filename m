From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:55:31 +0200
Message-ID: <53CF8693.1040006@canonical.com>
References: <20140709093124.11354.3774.stgit@patser>	<53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>	<53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>	<53CF63C2.7070407@vodafone.de>	<CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>	<53CF6622.6060803@amd.com>	<53CF699D.9070902@canonical.com>	<53CF6B18.5070107@vodafone.de>	<CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>	<53CF7035.2060808@amd.com>	<53CF7191.2090008@canonical.com>	<CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>	<53CF765E.7020802@vodafone.de>	<CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>	<53CF8010.9060809@amd.com>	<CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g@mail.gmail.com>	<53CF822E.7050601@amd.com>	<CAKMK7uG85
 KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
 <CAKMK7uHEgdU+Uz-OnRGvT_wFjOXHpZmgZcrORsBrST_MY5_ADA@mail.gmail .com>
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
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

b3AgMjMtMDctMTQgMTE6NDcsIENocmlzdGlhbiBLw7ZuaWcgc2NocmVlZjoKPiBBbSAyMy4wNy4y
MDE0IDExOjQ0LCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgSnVsIDIzLCAyMDE0
IGF0IDExOjM5IEFNLCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90
ZToKPj4+IFRoZSBzY2hlZHVsZXIgbmVlZHMgdG8ga2VlcCB0cmFjayBvZiBhIGxvdCBvZiBmZW5j
ZXMsIHNvIEkgdGhpbmsgd2UnbGwKPj4+IGhhdmUgdG8gcmVnaXN0ZXIgY2FsbGJhY2tzLCBub3Qg
YSBzaW1wbGUgd2FpdCBmdW5jdGlvbi4gV2UgbXVzdCBrZWVwCj4+PiB0cmFjayBvZiBhbGwgdGhl
IG5vbi1pOTE1IGZlbmNlcyBmb3IgYWxsIG91c3RhbmRpbmcgYmF0Y2hlcy4gQWxzbywgdGhlCj4+
PiBzY2hlZHVsZXIgZG9lc24ndCBlbGltaW5hdGUgdGhlIGh3IHF1ZXVlLCBvbmx5IGtlZXAgaXQg
bXVjaCBzbG93ZXIgc28KPj4+IHRoYXQgd2UgY2FuIHNuZWFrIGluIGhpZ2hlciBwcmlvcml0eSB0
aGluZ3MuCj4+Pgo+Pj4gUmVhbGx5LCBzY2hlZHVsZXIgb3Igbm90IGlzIG9ydGhvZ29uYWwuCj4+
IEFsc28gc2VlIG15IG90aGVyIGNvbW1lbnQgYWJvdXQgaW50ZXJhY3Rpb25zIGJldHdlZW4gd2Fp
dF9mZW5jZSBhbmQKPj4gdGhlIGk5MTUgcmVzZXQgbG9naWMuIFdlIGNhbid0IGFjdHVhbGx5IHVz
ZSBpdCBmcm9tIHdpdGhpbiB0aGUKPj4gc2NoZWR1bGVyIGNvZGUgc2luY2UgdGhhdCB3b3VsZCBk
ZWFkbG9jay4KPgo+IFllYWgsIEkgc2VlLiBZb3Ugd291bGQgbmVlZCBzb21lIHdheSB0byBhYm9y
dCB0aGUgd2FpdGluZyBvbiBvdGhlciBkZXZpY2VzIGZlbmNlcyBpbiBjYXNlIG9mIGEgbG9ja3Vw
Lgo+Cj4gV2hhdCBhYm91dCBhbiB1c2Vyc3BhY2UgdGhyZWFkIHRvIG9mZmxvYWQgd2FpdGluZyBh
bmQgY29tbWFuZCBzdWJtaXNzaW9uIHRvPwpZb3Ugd291bGQgc3RpbGwgbmVlZCBlbmFibGVfc2ln
bmFsaW5nLCBlbHNlIHBvbGxpbmcgb24gdGhlIGRtYS1idWYgd291bGRuJ3Qgd29yay4gOy0pCkNh
bid0IHdhaXQgc3luY2hyb25vdXNseSB3aXRoIG11bHRpcGxlIHNoYXJlZCBmZW5jZXMsIG5lZWQg
dG8gcG9sbCBmb3IgdGhhdC4KQW5kIHRoZSBkbWEtYnVmIHdvdWxkIHN0aWxsIGhhdmUgZmVuY2Vz
IGJlbG9uZ2luZyB0byBib3RoIGRyaXZlcnMsIGFuZCBpdCB3b3VsZCBzdGlsbCBjYWxsIGZyb20g
b3V0c2lkZSB0aGUgZHJpdmVyLgoKfk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
