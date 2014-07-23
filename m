From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 09:37:06 +0200
Message-ID: <53CF6622.6060803@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>	<20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>	<53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>	<53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
 <53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5p?= =?UTF-8?B?Zw==?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW0gMjMuMDcuMjAxNCAwOTozMSwgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIzLCAyMDE0IGF0IDk6MjYgQU0sIENocmlzdGlhbiBLw7ZuaWcKPiA8ZGVhdGhzaW1wbGVAdm9k
YWZvbmUuZGU+IHdyb3RlOgo+PiBJdCdzIG5vdCBhIGxvY2tpbmcgcHJvYmxlbSBJJ20gdGFsa2lu
ZyBhYm91dCBoZXJlLiBSYWRlb25zIGxvY2t1cCBoYW5kbGluZwo+PiBraWNrcyBpbiB3aGVuIGFu
eXRoaW5nIGNhbGxzIGludG8gdGhlIGRyaXZlciBmcm9tIHRoZSBvdXRzaWRlLCBpZiB5b3UgaGF2
ZSBhCj4+IGZlbmNlIHdhaXQgZnVuY3Rpb24gdGhhdCdzIGNhbGxlZCBmcm9tIHRoZSBvdXRzaWRl
IGJ1dCBkb2Vzbid0IGhhbmRsZQo+PiBsb2NrdXBzIHlvdSBlc3NlbnRpYWxseSByZWx5IG9uIHNv
bWVib2R5IGVsc2UgY2FsbGluZyBhbm90aGVyIHJhZGVvbgo+PiBmdW5jdGlvbiBmb3IgdGhlIGxv
Y2t1cCB0byBiZSByZXNvbHZlZC4KPiBTbyB5b3UgZG9uJ3QgaGF2ZSBhIHRpbWVyIGluIHJhZGVv
biB0aGF0IHBlcmlvZGljYWxseSBjaGVja3Mgd2hldGhlcgo+IHByb2dyZXNzIGlzIHN0aWxsIGJl
aW5nIG1hZGU/IFRoYXQncyB0aGUgYXBwcm9hY2ggd2UncmUgdXNpbmcgaW4gaTkxNSwKPiB0b2dl
dGhlciB3aXRoIHNvbWUgdHJpY2tzIHRvIGtpY2sgYW55IHN0dWNrIHdhaXRlcnMgc28gdGhhdCB3
ZSBjYW4KPiByZWxpYWJseSBzdGVwIGluIGFuZCBncmFiIGxvY2tzIGZvciB0aGUgcmVzZXQuCgpX
ZSB0cmllZCB0aGlzIGFwcHJvYWNoLCBidXQgaXQgZGlkbid0IHdvcmtlZCBhdCBhbGwuCgpJIGFs
cmVhZHkgY29uc2lkZXJlZCB0cnlpbmcgaXQgYWdhaW4gYmVjYXVzZSBvZiB0aGUgdXBjb21pbmcg
ZmVuY2UgCmltcGxlbWVudGF0aW9uLCBidXQgcmVjb25zaWRlcmluZyB0aGF0IHdoZW4gYSBkcml2
ZXIgaXMgZm9yY2VkIHRvIGNoYW5nZSAKaXQncyBoYW5kbGluZyBiZWNhdXNlIG9mIHRoZSBmZW5j
ZSBpbXBsZW1lbnRhdGlvbiB0aGF0J3MganVzdCBhbm90aGVyIApoaW50IHRoYXQgdGhlcmUgaXMg
c29tZXRoaW5nIHdyb25nIGhlcmUuCgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
