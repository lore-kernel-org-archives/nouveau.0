From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nv50/ir: Propagate third immediate src when
 folding OP_MAD
Date: Sun, 2 Oct 2016 14:44:31 -0400
Message-ID: <CAKb7Uvg+3MS=dj0yt3Kmk4YvzbR_=L3VbU+phvADRBdRnhC-HQ@mail.gmail.com>
References: <20161002175804.24741-1-tobias.johannes.klausmann@mni.thm.de>
 <CAKb7UviVKWWESGNGTQaP_WajAtGurjfm1BhgPDV2Eznfdp+Rjw@mail.gmail.com>
 <329012f6-a064-84c9-8c1e-544f300bba32@mni.thm.de>
 <CAKb7UviCvF=afJf9JitUrRiG7swXvuHzKP-QhscF_g-hkavdhw@mail.gmail.com>
 <c15d220b-1737-6b38-028c-f033f3ab6faa@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c15d220b-1737-6b38-028c-f033f3ab6faa-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gU3VuLCBPY3QgMiwgMjAxNiBhdCAyOjQzIFBNLCBUb2JpYXMgS2xhdXNtYW5uCjx0b2JpYXMu
am9oYW5uZXMua2xhdXNtYW5uQG1uaS50aG0uZGU+IHdyb3RlOgo+Cj4KPiBPbiAwMi4xMC4yMDE2
IDIwOjI2LCBJbGlhIE1pcmtpbiB3cm90ZToKPj4KPj4gVGhhdCdzIHZlcnkgb2RkLiBMb2FkUHJv
cGFnYXRpb24gc2hvdWxkIGhhdmUgcGlja2VkIHRoYXQgdXAgZXZlbiBpbgo+PiBpdHMgY3VycmVu
dCBmb3JtLiBTaG91bGQgdHJ5IHRvIGZpZ3VyZSBvdXQgd2h5IGl0IGRpZG4ndCBhbmQgdGhhdCBp
cwo+PiBsaWtlbHkgdG8gImZpeCIgYSAqbG90KiBtb3JlIHNpdHVhdGlvbnMuCj4KPgo+IEFjdHVh
bGx5IGkgd2FzIGNvbWluZyBmcm9tIGFuLCBnaXZlbiByZWFsbHkgY29uc3RyYWluZWQsIGFkZGl0
aW9uIHRvIHRoZQo+IExvYWRQcm9wYWdhdGlvbiBwYXNzLCB3aGVyZSBpIHdhcyB0b2xkIHRvIGZp
eCBpdCB3aXRoaW4gT1BfTUFEIDovCgpXaHkgZG9lc24ndCBMb2FkUHJvcGFnYXRpb24gaGFuZGxl
IGl0IGFzLWlzPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
