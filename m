From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nv50,
 nvc0: don't base decisions on available pushbuf space
Date: Sat, 10 Oct 2015 15:58:25 -0400
Message-ID: <CAKb7UvhaZn2tK9ejZ7ard79gHuxoWJRi+hLU=P6+psZSqT-sZA@mail.gmail.com>
References: <1444468187-13868-1-git-send-email-imirkin@alum.mit.edu>
 <561969F1.9080706@gmail.com>
 <CAKb7UvgWEKVA1TWqU-Bcu=VmunnXot_Sqp11F7XC_mOowVqTUw@mail.gmail.com>
 <56196D35.2040203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56196D35.2040203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gU2F0LCBPY3QgMTAsIDIwMTUgYXQgMzo1NSBQTSwgU2FtdWVsIFBpdG9pc2V0CjxzYW11ZWwu
cGl0b2lzZXRAZ21haWwuY29tPiB3cm90ZToKPgo+Cj4gT24gMTAvMTAvMjAxNSAwOTo0MiBQTSwg
SWxpYSBNaXJraW4gd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgT2N0IDEwLCAyMDE1IGF0IDM6NDEgUE0s
IFNhbXVlbCBQaXRvaXNldAo+PiA8c2FtdWVsLnBpdG9pc2V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4gVGhpcyBwYXRjaCBsb29rcyBmaW5lIGV4Y2VwdCB0aGF0IGl0IHNob3VsZCBiZSBhIGJp
dCBtb3JlIG5vcm1hbGl6ZWQuIEkKPj4+IG1lYW4sIHNvbWV0aW1lcyB5b3UgYnJlYWsgd2hlbiBQ
VVNIX1NQQUNFIGZhaWxzLCBzb21ldGltZXMgbm90LiBTYW1lIGZvcgo+Pj4gUFVTSF9TUEFDRSBj
YWxscywgc29tZXRpbWVzIHlvdSBhZGQgaXQgc29tZXRpbWVzIG5vdC4KPj4KPj4gTWVoLiBXZSBu
ZWVkIHRvIGdldCBvdXIgZXJyb3IgY2hlY2tpbmcgc2l0dWF0aW9uIHN0cmFpZ2h0LCBidXQgdGhp
cwo+PiBpc24ndCB0aGUgcGF0Y2ggdG8gZG8gaXQgaW4uCj4KPgo+IFllYWgsIGJ1dCB0aGlzIG5l
ZWRzIHRvIGJlIGNsYXJpZmllZC4KCldoYXQgZG9lcz8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXUK
