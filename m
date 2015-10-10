From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv50,
 nvc0: don't base decisions on available pushbuf space
Date: Sat, 10 Oct 2015 22:21:26 +0200
Message-ID: <56197346.4030606@gmail.com>
References: <1444468187-13868-1-git-send-email-imirkin@alum.mit.edu>
 <561969F1.9080706@gmail.com>
 <CAKb7UvgWEKVA1TWqU-Bcu=VmunnXot_Sqp11F7XC_mOowVqTUw@mail.gmail.com>
 <56196D35.2040203@gmail.com>
 <CAKb7UvhaZn2tK9ejZ7ard79gHuxoWJRi+hLU=P6+psZSqT-sZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhaZn2tK9ejZ7ard79gHuxoWJRi+hLU=P6+psZSqT-sZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

CgpPbiAxMC8xMC8yMDE1IDA5OjU4IFBNLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBPbiBTYXQsIE9j
dCAxMCwgMjAxNSBhdCAzOjU1IFBNLCBTYW11ZWwgUGl0b2lzZXQKPiA8c2FtdWVsLnBpdG9pc2V0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDEwLzEwLzIwMTUgMDk6NDIgUE0sIElsaWEgTWly
a2luIHdyb3RlOgo+Pj4gT24gU2F0LCBPY3QgMTAsIDIwMTUgYXQgMzo0MSBQTSwgU2FtdWVsIFBp
dG9pc2V0Cj4+PiA8c2FtdWVsLnBpdG9pc2V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gVGhpcyBw
YXRjaCBsb29rcyBmaW5lIGV4Y2VwdCB0aGF0IGl0IHNob3VsZCBiZSBhIGJpdCBtb3JlIG5vcm1h
bGl6ZWQuIEkKPj4+PiBtZWFuLCBzb21ldGltZXMgeW91IGJyZWFrIHdoZW4gUFVTSF9TUEFDRSBm
YWlscywgc29tZXRpbWVzIG5vdC4gU2FtZSBmb3IKPj4+PiBQVVNIX1NQQUNFIGNhbGxzLCBzb21l
dGltZXMgeW91IGFkZCBpdCBzb21ldGltZXMgbm90Lgo+Pj4gTWVoLiBXZSBuZWVkIHRvIGdldCBv
dXIgZXJyb3IgY2hlY2tpbmcgc2l0dWF0aW9uIHN0cmFpZ2h0LCBidXQgdGhpcwo+Pj4gaXNuJ3Qg
dGhlIHBhdGNoIHRvIGRvIGl0IGluLgo+Pgo+PiBZZWFoLCBidXQgdGhpcyBuZWVkcyB0byBiZSBj
bGFyaWZpZWQuCj4gV2hhdCBkb2VzPwoKSSBtZWFuLCB3ZSBzaG91bGQgZWl0aGVyIHVzZSBQVVNI
X1NQQUNFIGV2ZXJ5d2hlcmUgb3Igbm90IGF0IGFsbCwgYW5kIAphbHdheXMgYnJlYWtzIChvciBu
b3QpIHdoZW4gUFVTSF9TUEFDRSBmYWlscy4KVGhhdCdzIHJlYWxseSBhIG1pbm9yIGlzc3VlLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
