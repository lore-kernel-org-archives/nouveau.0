From: Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add Option "DRI3" to allow to disable DRI3
 under EXA.
Date: Sun, 26 Jul 2015 16:11:50 +0300
Message-ID: <20150726161150.4745d4cf@farn>
References: <1435635043-3738-1-git-send-email-mario.kleiner.de@gmail.com>
 <CAKb7UvhOcQ1-y2q3_8RZzvLewhsZ3A1OHC=vo3uBSwX3XTR0Eg@mail.gmail.com>
 <CACvgo53NaCJ6r+1LdJEG78Zyi+SBfMu2y1Mkm2HCKUo7Co5zQw@mail.gmail.com>
 <CAKb7Uvj-7AeG8EQ58cZZhF1O7HU=E_VkKO8wi7LpitoNBmCjGg@mail.gmail.com>
 <CACvgo50R5kPGVAwDYTUSCkY-Cfh=HENFDT8OdT=nNKLG85=S9Q@mail.gmail.com>
 <CAKb7UvhuYJxLk1zPQbdTgG_HQcbo0Zt_TnpHf7gD2apk+RYCdA@mail.gmail.com>
 <55A48575.5060100@gmail.com>
 <CAKb7Uvi7pCT-rkFxfpsmw-P0UhF86ZrEdtmJDc3kU+REz7oZ3Q@mail.gmail.com>
 <55A55C40.4000207@gmail.com>
 <CAPM=9ty34G39nceFnarvs0qOoJiyqjcsgXD0FdB4Ye_O1D+EhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9ty34G39nceFnarvs0qOoJiyqjcsgXD0FdB4Ye_O1D+EhQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gU2F0LCAxOCBKdWwgMjAxNSAyMTowOTo0NiArMTAwMApEYXZlIEFpcmxpZSA8YWlybGllZEBn
bWFpbC5jb20+IHdyb3RlOgoKPiA+IEhtLCBhIHRvdGFsIHJlbW92YWwgd291bGQgYXQgbGVhc3Qg
bWFrZSBtZSBhbmQgbXkgdXNlcnMgcmF0aGVyIHVuaGFwcHkgYXRtLiwKPiA+IGFzIHdpdGhvdXQg
Z2xhbW9yIG5vIGh3IGFjY2VsIGF0IGFsbCBvbiA+PSBtYXh3ZWxsLiBtb2Rlc2V0dGluZyBhbmQg
bm91dmVhdQo+ID4gYXJlIG5vdCBvbiBwYXIgZmVhdHVyZS13aXNlIGF0bS4gRS5nLiwgbW9kZXNl
dHRpbmcgYXMgb2YgdGhlIG5leHQgeG9yZyAxLjE4Cj4gPiBzZXJ2ZXIgb25seSBwcm92aWRlcyBw
YWdlZmxpcHBpbmcgdmlhIGRyaTMvcHJlc2VudCBhbmQgd2l0aG91dCBwYWdlZmxpcHBpbmcKPiA+
IGl0IGlzIGdhbWUgb3ZlciBmb3IgbWFueSBvZiBteSB1c2UgY2FzZXMgb24gbm91dmVhdS1rbXMu
IEFsc28gbW9kZXNldHRpbmcKPiA+IGN1cnJlbnRseSBjb21wbGV0ZWx5IGxhY2tzIFphcGhvZEhl
YWRzIHN1cHBvcnQuIFdpdGhvdXQgWmFwaG9kSGVhZHMgaSBjYW4ndAo+ID4gaGF2ZSBhIHBhZ2Ut
ZmxpcHBlZCBmdWxsc2NyZWVuIHdpbmRvdyBvbiBvbmUgc3Vic2V0IG9mIG91dHB1dHMgYW5kIGEg
cmVndWxhcgo+ID4gZGVza3RvcCBvbiBhbm90aGVyIHN1YnNldCwgc29tZXRoaW5nIHRoYXQgaXMg
bmVlZGVkIGZvcgo+ID4gbmV1cm9zY2llbmNlL21lZGljYWwvdnIgYXBwbGljYXRpb25zLgo+IAo+
IFNvIHdoYXQgd291bGQgeW91IHdhbnQgaW4gbW9kZXNldHRpbmcgdG8gYmUgb24gcGFyPwo+IAo+
IERSSTIgcGFnZWZsaXBwaW5nPwo+IHphcGhvZCBoZWFkcz8KPiAKPiBhbnl0aGluZyBlbHNlPyBJ
IHdvdWxkIGxpa2UgZm9yIEYyMyB0byBzaGlwIGEgbW9kZXNldHRpbmcgd2hpY2ggSSBjYW4KPiBy
ZXBsYWNlIGludGVsL25vdXZlYXUvYXRpIHdpdGguCgpIaSwKCkZZSSwgaXQgc2VlbXMgdGhlIE9j
dWx1cyBSaWZ0IGFsc28gcHJlZmVycyBhIFphcGhvZEhlYWRzIHNldHVwLgpodHRwOi8vYmxvZy5l
bWFyY3Mub3JnL2Jsb2cvb2N1bHVzLXJpZnQtZGlyZWN0LW1vZGUtb24tbGludXgvCgoKVGhhbmtz
LApwcQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
