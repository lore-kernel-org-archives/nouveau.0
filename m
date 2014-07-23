From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 10:25:53 +0200
Message-ID: <53CF7191.2090008@canonical.com>
References: <20140709093124.11354.3774.stgit@patser>	<20140709122953.11354.46381.stgit@patser>	<CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>	<53CE2421.5040906@amd.com>	<20140722114607.GL15237@phenom.ffwll.local>	<20140722115737.GN15237@phenom.ffwll.local>	<53CE56ED.4040109@vodafone.de>	<20140722132652.GO15237@phenom.ffwll.local>	<53CE6AFA.1060807@vodafone.de>	<CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>	<53CE84AA.9030703@amd.com>	<CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>	<53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>	<53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>	<53CF63C2.7070407@vodafone.de>	<CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>	<53CF6622.6060803@amd.com>
 	<53CF699D.9070902@canonical.com>	<53CF6B18.5070107@vodafone.de>
 <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
 <53CF7035.2060808@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53CF7035.2060808-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

b3AgMjMtMDctMTQgMTA6MjAsIENocmlzdGlhbiBLw7ZuaWcgc2NocmVlZjoKPiBBbSAyMy4wNy4y
MDE0IDEwOjA3LCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgSnVsIDIzLCAyMDE0
IGF0IDk6NTggQU0sIENocmlzdGlhbiBLw7ZuaWcKPj4gPGRlYXRoc2ltcGxlQHZvZGFmb25lLmRl
PiB3cm90ZToKPj4+IEp1c3QgaW1hZ2luZSBhbiBhcHBsaWNhdGlvbiB1c2luZyBwcmltZSBpcyBs
b2NraW5nIHVwIFJhZGVvbiBhbmQgYmVjYXVzZSBvZgo+Pj4gdGhhdCBnZXRzIGtpbGxlZCBieSB0
aGUgdXNlci4gTm90aGluZyBlbHNlIGluIHRoZSBzeXN0ZW0gd291bGQgdXNlIHRoZQo+Pj4gUmFk
ZW9uIGhhcmR3YXJlIGFueSBtb3JlIGFuZCBzbyByYWRlb24gZ2V0cyBvbmx5IGNhbGxlZCBieSBh
bm90aGVyIGRyaXZlcgo+Pj4gd2FpdGluZyBwYXRpZW50bHkgZm9yIHJhZGVvbiB0byBmaW5pc2gg
cmVuZGVyaW5nIHdoaWNoIG5ldmVyIGhhcHBlbnMgYmVjYXVzZQo+Pj4gdGhlIHdob2xlIHRoaW5n
IGlzIGxvY2tlZCB1cCBhbmQgd2UgZG9uJ3QgZ2V0IGEgY2hhbmNlIHRvIHJlY292ZXIuCj4+IEJ1
dCBpc24ndCB0aGF0IHBvc3NpYmxlIGFscmVhZHkgd2l0aG91dCBmZW5jZXM/IFggaGFuZ3MgcmFk
ZW9uLCB1c2VyCj4+IGNyYXNoZXMgWCBmb3IgdW5yZWxhdGVkIHJlYXNvbnMgYmVmb3JlIHJhZGVv
biB3aWxsIG5vdGljZSB0aGUgaGFuZy4KPj4gVGhlbiBubyBvbmUgdXNlcyByYWRlb24gYW55IGxv
bmdlciBhbmQgdGhlIGhhbmcgc3RheXMgdW5kZXRlY3RlZC4KPgo+IFllYWgsIGVzcGVjaWFsbHkg
d2l0aCBtdWx0aW1lZGlhIGFwcGxpY2F0aW9uLiBCdXQgSSBkb24ndCByZWFsbHkgY2FyZSBhYm91
dCB0aGlzIHByb2JsZW0gYmVjYXVzZSB0aGUgbmV4dCB0aW1lIGFuIGFwcGxpY2F0aW9uIHRyaWVz
IHRvIHVzZSB0aGUgYmxvY2sgaW4gcXVlc3Rpb24gd2UgYWN0dWFsbHkgZG8gdGhlIHJlc2V0IGFu
ZCBldmVyeXRoaW5nIGlzIGZpbmUuCj4KPiBJbiB5b3VyIGV4YW1wbGUgd2Ugd291bGQgZG8gdGhl
IHJlc2V0IHdoZW4gdGhlIG5leHQgWCBzZXJ2ZXIgc3RhcnRzLCBiZWZvcmUgdGhhdCBwb2ludCBu
b2JvZHkgd291bGQgY2FyZSBiZWNhdXNlIG5vYm9keSB1c2VzIHRoZSBoYXJkd2FyZS4KPgo+IEFu
IGFkZGl0aW9uYWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQgcmVzZXRzIGFyZSBzb21ldGhpbmcgcGVy
ZmVjdCBub3JtYWwgZm9yIHJhZGVvbi4gRm9yIGV4YW1wbGUgVVZEIGNhbiAiY3Jhc2giIHdoZW4g
eW91IGZlZWQgaXQgd2l0aCBpbnZhbGlkIGJpdHN0cmVhbSBkYXRhLCAob2sgYWN0dWFsbHkgaXQg
c2VuZCBhbiBpbnRlcnJ1cHQgYW5kIHN0b3BzIGFueSBwcm9jZXNzaW5nIGZvciB0aGUgZHJpdmVy
IHRvIGludmVzdGlnYXRlKS4gVG8gY29udGludWUgcHJvY2Vzc2luZyB5b3UgbmVlZCB0byBnbyB0
aHJvdWdoIGEgcmF0aGVyIGNvbXBsaWNhdGVkIHJlc2V0IHByb2NlZHVyZS4KSW4gdGhpcyBjYXNl
IGlmIHRoZSBzeW5jIHdhcyB0byBpOTE1IHRoZSBpOTE1IGxvY2t1cCBwcm9jZWR1cmUgd291bGQg
dGFrZSBjYXJlIG9mIGl0c2VsZi4gSXQgd291bGRuJ3QgZml4IHJhZGVvbiwgYnV0IGl0IHdvdWxk
IGF0IGxlYXN0IHVuYmxvY2sgeW91ciBpbnRlbCBjYXJkIGFnYWluLiBJIGhhdmVuJ3Qgc3BlY2lm
aWNhbGx5IGFkZGVkIGEgc3BlY2lhbCBjYXNlIHRvIGF0dGVtcHQgdG8gdW5ibG9jayBleHRlcm5h
bCBmZW5jZXMsIGJ1dCBJJ3ZlIGNvbnNpZGVyZWQgaXQuIDotKQoKfk1hYXJ0ZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
