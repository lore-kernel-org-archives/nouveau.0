From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] nouveau/compiler: fix trivial compiler
 warnings
Date: Wed, 8 Jul 2015 21:53:38 +0200
Message-ID: <559D7FC2.5060500@mni.thm.de>
References: <1436380066-19851-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <CAKb7UvgWcP4765FZFApRPdUY76B1DpOqZyRxz3K5g-n85qq+1w@mail.gmail.com>
 <CACvgo52DmszQ4tA2FfCnXAy9vkUMse=zbgiHnNH23Mq3uR=C2Q@mail.gmail.com>
 <559D7B41.5070802@mni.thm.de>
 <CACvgo53WL88Esa9iDL=so=zj9PpkKVX90ks8zyrYUHj4Ag2oXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACvgo53WL88Esa9iDL=so=zj9PpkKVX90ks8zyrYUHj4Ag2oXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

CgpPbiAwOC4wNy4yMDE1IDIxOjQyLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gT24gOCBKdWx5IDIw
MTUgYXQgMjA6MzQsIFRvYmlhcyBLbGF1c21hbm4KPiA8dG9iaWFzLmpvaGFubmVzLmtsYXVzbWFu
bkBtbmkudGhtLmRlPiB3cm90ZToKPj4gTWggaSdtIG5vdCBhd2FyZSBvZiBtZSBldmVyIGNoYW5n
ZWQgdGhlICJub3V2ZWF1X2NvbXBpbGVyIi4gQnV0IGknbSBoYXBweSB0bwo+PiBzZWUgdGhpcyBt
YWRlIHlvdSBsYXVnaCwgc28gaXQgaGFzIHNvbWV0aGluZyBwb3NpdGl2ZSBhdCBsZWFzdC4uLiA6
Lwo+Pgo+IFN0b3J5IHRpbWU6Cj4gVGhpcyBwYXJ0aWN1bGFyIGNvbXBpbGVyIHdhcm5pbmcgaGFz
IGJlZW4gYnJvdWdodCB1cCAoaW5jbCBoZXJlKSBmb3VyCj4gb3IgZml2ZSB0aW1lcy4gRWFjaCB0
aW1lLCBJbGlhIGZlZWxzIHJlbHVjdGFudCBhYm91dCB0aGUgZml4IGFzIHRoZQo+IChnY2MpIGNv
bXBpbGVyIGdldHMgaXQgd3JvbmcuCj4KPiBQZXJzb25hbGx5IEkgZG8gbm90IHNlZSBhIHByb2Js
ZW0gd2l0aCBleHBsaWNpdGx5IGluaXRpYWxpc2luZyB0aGUKPiB2YXJpYWJsZSBhdCB0aGlzIGlu
c3RhbmNlLCB5ZXQgSSdtIGN1cmlvdXMgZm9yIGhvdyBsb25nIElsaWEgd2lsbCBzYXkKPiAibm8i
IHRvIHRoaXMgKHR5cGUgb2YpIHBhdGNoKGVzKSA6LVAKPgo+IE5vIG9mZmVuY2UsIEkganVzdCBm
aW5kIGl0IGZ1bm55Lgo+IEVtaWwKT2ggaSBkaWQgZXZlbiBhbnN3ZXIgaW4gYSB0aHJlYWQgZm9y
IGEgcGF0Y2ggZnJvbSBNYXJ0aW4gd2hlcmUgaGUgCnByb3Bvc2UgdGhlIHNhbWUgY2hhbmdlIChl
dmVuIHdpdGggdGhlIHNhbWUgcHJlZml4IDpEKS4gSWxpYSBtYXliZSB5b3UgCnNob3VsZCB0YWtl
IHRoaXMgYWZ0ZXIgYWxsLCBhcyBpdCBzZWVtcyB5b3UgYXJlIGhhdW50ZWQgYnkgdGhpcyA6UApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
