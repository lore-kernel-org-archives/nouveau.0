From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:36:46 +0200
Message-ID: <53CF822E.7050601@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <53CE6AFA.1060807@vodafone.de>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW0gMjMuMDcuMjAxNCAxMTozMCwgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIzLCAyMDE0IGF0IDExOjI3IEFNLCBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4+IFlvdSBzdWJtaXQgYSBqb2IgdG8gdGhlIGhhcmR3YXJlIGFu
ZCB0aGVuIGJsb2NrIHRoZSBqb2IgdG8gd2FpdCBmb3IgcmFkZW9uCj4+IHRvIGJlIGZpbmlzaGVk
PyBXZWxsIHRoYW4gdGhpcyB3b3VsZCBpbmRlZWQgcmVxdWlyZSBhIGhhcmR3YXJlIHJlc2V0LCBi
dXQKPj4gd291bGRuJ3QgdGhhdCBtYWtlIHRoZSB3aG9sZSBwcm9ibGVtIGV2ZW4gd29yc2U/Cj4+
Cj4+IEkgbWVhbiBjdXJyZW50bHkgd2UgYmxvY2sgb25lIHVzZXJzcGFjZSBwcm9jZXNzIHRvIHdh
aXQgZm9yIG90aGVyIGhhcmR3YXJlCj4+IHRvIGJlIGZpbmlzaGVkIHdpdGggYSBidWZmZXIsIGJ1
dCB3aGF0IHlvdSBhcmUgZGVzY3JpYmluZyBoZXJlIGJsb2NrcyB0aGUKPj4gd2hvbGUgaGFyZHdh
cmUgdG8gd2FpdCBmb3Igb3RoZXIgaGFyZHdhcmUgd2hpY2ggaW4gdGhlIGVuZCBibG9ja3MgYWxs
Cj4+IHVzZXJzcGFjZSBwcm9jZXNzIGFjY2Vzc2luZyB0aGUgaGFyZHdhcmUuCj4gVGhlcmUgaXMg
bm90aGluZyBuZXcgaGVyZSB3aXRoIHByaW1lIC0gaWYgb25lIGNvbnRleHQgaGFuZ3MgdGhlIGdw
dSBpdAo+IGJsb2NrcyBldmVyeW9uZSBlbHNlIG9uIGk5MTUuCj4KPj4gVGFsa2luZyBhYm91dCBh
bHRlcm5hdGl2ZSBhcHByb2FjaGVzIHdvdWxkbid0IGl0IGJlIHNpbXBsZXIgdG8ganVzdCBvZmZs
b2FkCj4+IHRoZSB3YWl0aW5nIHRvIGEgZGlmZmVyZW50IGtlcm5lbCBvciB1c2Vyc3BhY2UgdGhy
ZWFkPwo+IFdlbGwgdGhpcyBpcyBleGFjdGx5IHdoYXQgd2UnbGwgZG8gb25jZSB3ZSBoYXZlIHRo
ZSBzY2hlZHVsZXIuIEJ1dAo+IHRoaXMgaXMgYW4gb3J0aG9nb25hbCBpc3N1ZSBpbW8uCgpNaG0s
IGNvdWxkIGhhdmUgdGhlIHNjaGVkdWxlciBmaXJzdD8KCkNhdXNlIHRoYXQgc291bmRzIGxpa2Ug
cmVkdWNpbmcgdGhlIG5lY2Vzc2FyeSBmZW5jZSBpbnRlcmZhY2UgdG8ganVzdCBhIApmZW5jZS0+
d2FpdCBmdW5jdGlvbi4KCkNocmlzdGlhbi4KCj4gLURhbmllbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
