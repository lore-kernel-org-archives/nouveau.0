From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:39:51 +0200
Message-ID: <53CF82E7.2040102@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
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
 <53CF7035.2060808@amd.com>	<53CF7191.2090008@canonical.com>
 <CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>
 <53CF765E.7020802@vodafone.de>
 <CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>
 <53CF8010.9060809@amd.com>
 <CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g@mail.gmail.com>
 <53CF822E.7050601@amd.com> <53CF828E.5020201@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53CF828E.5020201-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW0gMjMuMDcuMjAxNCAxMTozOCwgc2NocmllYiBNYWFydGVuIExhbmtob3JzdDoKPiBvcCAyMy0w
Ny0xNCAxMTozNiwgQ2hyaXN0aWFuIEvDtm5pZyBzY2hyZWVmOgo+PiBBbSAyMy4wNy4yMDE0IDEx
OjMwLCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBXZWQsIEp1bCAyMywgMjAxNCBhdCAx
MToyNyBBTSwgQ2hyaXN0aWFuIEvDtm5pZwo+Pj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
d3JvdGU6Cj4+Pj4gWW91IHN1Ym1pdCBhIGpvYiB0byB0aGUgaGFyZHdhcmUgYW5kIHRoZW4gYmxv
Y2sgdGhlIGpvYiB0byB3YWl0IGZvciByYWRlb24KPj4+PiB0byBiZSBmaW5pc2hlZD8gV2VsbCB0
aGFuIHRoaXMgd291bGQgaW5kZWVkIHJlcXVpcmUgYSBoYXJkd2FyZSByZXNldCwgYnV0Cj4+Pj4g
d291bGRuJ3QgdGhhdCBtYWtlIHRoZSB3aG9sZSBwcm9ibGVtIGV2ZW4gd29yc2U/Cj4+Pj4KPj4+
PiBJIG1lYW4gY3VycmVudGx5IHdlIGJsb2NrIG9uZSB1c2Vyc3BhY2UgcHJvY2VzcyB0byB3YWl0
IGZvciBvdGhlciBoYXJkd2FyZQo+Pj4+IHRvIGJlIGZpbmlzaGVkIHdpdGggYSBidWZmZXIsIGJ1
dCB3aGF0IHlvdSBhcmUgZGVzY3JpYmluZyBoZXJlIGJsb2NrcyB0aGUKPj4+PiB3aG9sZSBoYXJk
d2FyZSB0byB3YWl0IGZvciBvdGhlciBoYXJkd2FyZSB3aGljaCBpbiB0aGUgZW5kIGJsb2NrcyBh
bGwKPj4+PiB1c2Vyc3BhY2UgcHJvY2VzcyBhY2Nlc3NpbmcgdGhlIGhhcmR3YXJlLgo+Pj4gVGhl
cmUgaXMgbm90aGluZyBuZXcgaGVyZSB3aXRoIHByaW1lIC0gaWYgb25lIGNvbnRleHQgaGFuZ3Mg
dGhlIGdwdSBpdAo+Pj4gYmxvY2tzIGV2ZXJ5b25lIGVsc2Ugb24gaTkxNS4KPj4+Cj4+Pj4gVGFs
a2luZyBhYm91dCBhbHRlcm5hdGl2ZSBhcHByb2FjaGVzIHdvdWxkbid0IGl0IGJlIHNpbXBsZXIg
dG8ganVzdCBvZmZsb2FkCj4+Pj4gdGhlIHdhaXRpbmcgdG8gYSBkaWZmZXJlbnQga2VybmVsIG9y
IHVzZXJzcGFjZSB0aHJlYWQ/Cj4+PiBXZWxsIHRoaXMgaXMgZXhhY3RseSB3aGF0IHdlJ2xsIGRv
IG9uY2Ugd2UgaGF2ZSB0aGUgc2NoZWR1bGVyLiBCdXQKPj4+IHRoaXMgaXMgYW4gb3J0aG9nb25h
bCBpc3N1ZSBpbW8uCj4+IE1obSwgY291bGQgaGF2ZSB0aGUgc2NoZWR1bGVyIGZpcnN0Pwo+Pgo+
PiBDYXVzZSB0aGF0IHNvdW5kcyBsaWtlIHJlZHVjaW5nIHRoZSBuZWNlc3NhcnkgZmVuY2UgaW50
ZXJmYWNlIHRvIGp1c3QgYSBmZW5jZS0+d2FpdCBmdW5jdGlvbi4KPiBZb3Ugd291bGQgYWxzbyBs
b3NlIGJlbmVmaXRzIGxpa2UgaGF2aW5nIGEgJ3BlcmYgdGltZWNoYXJ0JyBmb3IgZ3B1J3MuCgpJ
IGNhbiBsaXZlIHdpdGggdGhhdCwgd2hlbiBpdCByZWR1Y2VzIHRoZSBjb21wbGV4aXR5IG9mIHRo
ZSBmZW5jZSBpbnRlcmZhY2UuCgpDaHJpc3RpYW4uCgo+Cj4gfk1hYXJ0ZW4KPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
