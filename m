From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nv50,
 nvc0: don't base decisions on available pushbuf space
Date: Sat, 10 Oct 2015 16:17:38 -0400
Message-ID: <CAKb7Uvh0iBztSNw-vH1d5bamKX4YHR=rhkwX-9W5o-VedCNjYQ@mail.gmail.com>
References: <1444468187-13868-1-git-send-email-imirkin@alum.mit.edu>
 <561969F1.9080706@gmail.com>
 <CAKb7UvgWEKVA1TWqU-Bcu=VmunnXot_Sqp11F7XC_mOowVqTUw@mail.gmail.com>
 <56196D35.2040203@gmail.com>
 <CAKb7UvhaZn2tK9ejZ7ard79gHuxoWJRi+hLU=P6+psZSqT-sZA@mail.gmail.com>
 <56197346.4030606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56197346.4030606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

T24gU2F0LCBPY3QgMTAsIDIwMTUgYXQgNDoyMSBQTSwgU2FtdWVsIFBpdG9pc2V0CjxzYW11ZWwu
cGl0b2lzZXRAZ21haWwuY29tPiB3cm90ZToKPgo+Cj4gT24gMTAvMTAvMjAxNSAwOTo1OCBQTSwg
SWxpYSBNaXJraW4gd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgT2N0IDEwLCAyMDE1IGF0IDM6NTUgUE0s
IFNhbXVlbCBQaXRvaXNldAo+PiA8c2FtdWVsLnBpdG9pc2V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4KPj4+IE9uIDEwLzEwLzIwMTUgMDk6NDIgUE0sIElsaWEgTWlya2luIHdyb3RlOgo+Pj4+
Cj4+Pj4gT24gU2F0LCBPY3QgMTAsIDIwMTUgYXQgMzo0MSBQTSwgU2FtdWVsIFBpdG9pc2V0Cj4+
Pj4gPHNhbXVlbC5waXRvaXNldEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBUaGlzIHBh
dGNoIGxvb2tzIGZpbmUgZXhjZXB0IHRoYXQgaXQgc2hvdWxkIGJlIGEgYml0IG1vcmUgbm9ybWFs
aXplZC4gSQo+Pj4+PiBtZWFuLCBzb21ldGltZXMgeW91IGJyZWFrIHdoZW4gUFVTSF9TUEFDRSBm
YWlscywgc29tZXRpbWVzIG5vdC4gU2FtZQo+Pj4+PiBmb3IKPj4+Pj4gUFVTSF9TUEFDRSBjYWxs
cywgc29tZXRpbWVzIHlvdSBhZGQgaXQgc29tZXRpbWVzIG5vdC4KPj4+Pgo+Pj4+IE1laC4gV2Ug
bmVlZCB0byBnZXQgb3VyIGVycm9yIGNoZWNraW5nIHNpdHVhdGlvbiBzdHJhaWdodCwgYnV0IHRo
aXMKPj4+PiBpc24ndCB0aGUgcGF0Y2ggdG8gZG8gaXQgaW4uCj4+Pgo+Pj4KPj4+IFllYWgsIGJ1
dCB0aGlzIG5lZWRzIHRvIGJlIGNsYXJpZmllZC4KPj4KPj4gV2hhdCBkb2VzPwo+Cj4KPiBJIG1l
YW4sIHdlIHNob3VsZCBlaXRoZXIgdXNlIFBVU0hfU1BBQ0UgZXZlcnl3aGVyZSBvciBub3QgYXQg
YWxsLCBhbmQgYWx3YXlzCj4gYnJlYWtzIChvciBub3QpIHdoZW4gUFVTSF9TUEFDRSBmYWlscy4K
PiBUaGF0J3MgcmVhbGx5IGEgbWlub3IgaXNzdWUuCgpJdCdzIGFjdHVhbGx5IGEgbWFqb3IgaXNz
dWUuIEVycm9yLWhhbmRsaW5nIGlzIHByYWN0aWNhbGx5Cm5vbi1leGlzdGVudC4gVGhlcmUgYXJl
IGEgY291cGxlIG9mIHNwb3RzIGhlcmUgYW5kIHRoZXJlLCBidXQgaXQKZG9lc24ndCByZWFsbHkg
c2NhbGUgdXAuIEkgZ3Vlc3MgSSAoc2VtaS0pYWNjaWRlbnRhbGx5IHJlbW92ZWQgYQpjb3VwbGUg
b2Ygc3BvdHMgdGhhdCBlcnJvciBjaGVja2VkLCBidXQsIGFnYWluLCBtZWguIERvaW5nIHRoaXMg
Zm9yCnJlYWwgd2lsbCByZXF1aXJlIHNvbWUgY2FyZWZ1bCB0aG91Z2h0LgoKICAtaWxpYQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
