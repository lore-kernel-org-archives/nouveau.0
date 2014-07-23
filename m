From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 12:13:05 +0200
Message-ID: <53CF8AB1.2000009@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com>	<53CF699D.9070902@canonical.com>
 <53CF6B18.5070107@vodafone.de>
 <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
 <53CF7035.2060808@amd.com>	<53CF7191.2090008@canonical.com>
 <CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>
 <53CF765E.7020802@vodafone.de>
 <CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>
 <53CF8010.9060809@amd.com>
 <CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g@mail.gmail.com>
 <53CF822E.7050601@amd.com>
 <CAKMK7uG85KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
 <CAKMK7uHEgdU+Uz-OnRGvT_wFjOXHpZmgZcrORsBrST_MY5_ADA@mail.gmail .com>
 <53CF84C7.2020507@vodafone.de> <53CF8693.1040006@canonical.com >
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53CF8693.1040006-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, =?UTF-8?B?Q2hyaXM=?= =?UTF-8?B?dGlhbiBLw7ZuaWc=?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW0gMjMuMDcuMjAxNCAxMTo1NSwgc2NocmllYiBNYWFydGVuIExhbmtob3JzdDoKPiBvcCAyMy0w
Ny0xNCAxMTo0NywgQ2hyaXN0aWFuIEvDtm5pZyBzY2hyZWVmOgo+PiBBbSAyMy4wNy4yMDE0IDEx
OjQ0LCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBXZWQsIEp1bCAyMywgMjAxNCBhdCAx
MTozOSBBTSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4+
Pj4gVGhlIHNjaGVkdWxlciBuZWVkcyB0byBrZWVwIHRyYWNrIG9mIGEgbG90IG9mIGZlbmNlcywg
c28gSSB0aGluayB3ZSdsbAo+Pj4+IGhhdmUgdG8gcmVnaXN0ZXIgY2FsbGJhY2tzLCBub3QgYSBz
aW1wbGUgd2FpdCBmdW5jdGlvbi4gV2UgbXVzdCBrZWVwCj4+Pj4gdHJhY2sgb2YgYWxsIHRoZSBu
b24taTkxNSBmZW5jZXMgZm9yIGFsbCBvdXN0YW5kaW5nIGJhdGNoZXMuIEFsc28sIHRoZQo+Pj4+
IHNjaGVkdWxlciBkb2Vzbid0IGVsaW1pbmF0ZSB0aGUgaHcgcXVldWUsIG9ubHkga2VlcCBpdCBt
dWNoIHNsb3dlciBzbwo+Pj4+IHRoYXQgd2UgY2FuIHNuZWFrIGluIGhpZ2hlciBwcmlvcml0eSB0
aGluZ3MuCj4+Pj4KPj4+PiBSZWFsbHksIHNjaGVkdWxlciBvciBub3QgaXMgb3J0aG9nb25hbC4K
Pj4+IEFsc28gc2VlIG15IG90aGVyIGNvbW1lbnQgYWJvdXQgaW50ZXJhY3Rpb25zIGJldHdlZW4g
d2FpdF9mZW5jZSBhbmQKPj4+IHRoZSBpOTE1IHJlc2V0IGxvZ2ljLiBXZSBjYW4ndCBhY3R1YWxs
eSB1c2UgaXQgZnJvbSB3aXRoaW4gdGhlCj4+PiBzY2hlZHVsZXIgY29kZSBzaW5jZSB0aGF0IHdv
dWxkIGRlYWRsb2NrLgo+PiBZZWFoLCBJIHNlZS4gWW91IHdvdWxkIG5lZWQgc29tZSB3YXkgdG8g
YWJvcnQgdGhlIHdhaXRpbmcgb24gb3RoZXIgZGV2aWNlcyBmZW5jZXMgaW4gY2FzZSBvZiBhIGxv
Y2t1cC4KPj4KPj4gV2hhdCBhYm91dCBhbiB1c2Vyc3BhY2UgdGhyZWFkIHRvIG9mZmxvYWQgd2Fp
dGluZyBhbmQgY29tbWFuZCBzdWJtaXNzaW9uIHRvPwo+IFlvdSB3b3VsZCBzdGlsbCBuZWVkIGVu
YWJsZV9zaWduYWxpbmcsIGVsc2UgcG9sbGluZyBvbiB0aGUgZG1hLWJ1ZiB3b3VsZG4ndCB3b3Jr
LiA7LSkKPiBDYW4ndCB3YWl0IHN5bmNocm9ub3VzbHkgd2l0aCBtdWx0aXBsZSBzaGFyZWQgZmVu
Y2VzLCBuZWVkIHRvIHBvbGwgZm9yIHRoYXQuCgpObyB5b3UgZG9uJ3QuIEp1c3QgbWFrZSBhIGxp
c3Qgb2YgZmVuY2VzIHlvdSBuZWVkIHRvIHdhaXQgZm9yIGFuZCB3YWl0IApmb3IgZWFjaCBhZnRl
ciBhbm90aGVyLiBCdXQgaGF2aW5nIGFuIHRocmVhZCBmb3IgZWFjaCBjb21tYW5kIHN1Ym1pc3Np
b24gCmNvbnRleHQgZG9lc24ndCBzb3VuZHMgbGlrZSB0aGUgYmVzdCBzb2x1dGlvbiBhbnl3YXku
Cgo+IEFuZCB0aGUgZG1hLWJ1ZiB3b3VsZCBzdGlsbCBoYXZlIGZlbmNlcyBiZWxvbmdpbmcgdG8g
Ym90aCBkcml2ZXJzLCBhbmQgaXQgd291bGQgc3RpbGwgY2FsbCBmcm9tIG91dHNpZGUgdGhlIGRy
aXZlci4KCkNhbGxpbmcgZnJvbSBvdXRzaWRlIHRoZSBkcml2ZXIgaXMgZmluZSBhcyBsb25nIGFz
IHRoZSBkcml2ZXIgY2FuIGRvIApldmVyeXRoaW5nIG5lY2Vzc2FyeSB0byBjb21wbGV0ZSBpdCdz
IHdvcmsgYW5kIGlzbid0IGZvcmNlZCBpbnRvIGFueSAKdWdseSBoYWNrcyBhbmQgdGhpbmdzIHRo
YXQgYXJlIG5vdCAxMDAlIHJlbGlhYmxlLgoKU28gSSBkb24ndCBzZWUgbXVjaCBvdGhlciBhcHBy
b2FjaCBhcyBpbnRlZ3JhdGluZyByZWNvdmVyeSBjb2RlIGZvciBub3QgCmZpcmluZyBpbnRlcnJ1
cHRzIGFuZCBzb21lIGtpbmQgb2YgbG9ja3VwIGhhbmRsaW5nIGludG8gdGhlIGZlbmNlIGNvZGUg
CmFzIHdlbGwuCgpDaHJpc3RpYW4uCgo+Cj4gfk1hYXJ0ZW4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
