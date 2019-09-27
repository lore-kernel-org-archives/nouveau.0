From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Is Nouveau really using the io_reserve_lru?
Date: Fri, 27 Sep 2019 14:07:01 -0400
Message-ID: <CAKb7UvjK4rKO10FxRAG_zTp_JanivLR2YjngAErn0zyVdrJXUw@mail.gmail.com>
References: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
 <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNTo0NCBQTSBCZW4gU2tlZ2dzIDxza2VnZ3NiQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI0IFNlcCAyMDE5IGF0IDIyOjE5LCBDaHJpc3RpYW4g
S8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBndXlzLAo+ID4KPiA+IHdoaWxlIHdvcmtpbmcgdGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVu
Y3Rpb25hbGl0eSBJIHN0dW1ibGVkIG92ZXIgdGhlCj4gPiBpb19yZXNlcnZlX2xydS4KPiA+Cj4g
PiBCYXNpYyBpZGVhIGlzIHRoYXQgd2hlbiB0aGlzIGZsYWcgaXMgc2V0IHRoZSBkcml2ZXItPmlv
X21lbV9yZXNlcnZlKCkKPiA+IGNhbGxiYWNrIGNhbiByZXR1cm4gLUVBR0FJTiByZXN1bHRpbmcg
aW4gdW5tYXBwaW5nIG9mIG90aGVyIEJPcy4KPiA+Cj4gPiBCdXQgTm91dmVhdSBkb2Vzbid0IHNl
ZW0gdG8gcmV0dXJuIC1FQUdBSU4gaW4gdGhlIGNhbGwgcGF0aCBvZgo+ID4gaW9fbWVtX3Jlc2Vy
dmUgYW55d2hlcmUuCj4gSSBiZWxpZXZlIHRoaXMgaXMgYSBidWcgaW4gTm91dmVhdS4gIFdlICpz
aG91bGQqIGJlIHJldHVybmluZyAtRUFHQUlOCj4gaWYgd2UgZmFpbCB0byBmaW5kIHNwYWNlIGlu
IEJBUjEgdG8gbWFwIHRoZSBCTyBpbnRvLgoKQ291bGQgdGhpcyBsZWFkIHRvIFNJR0JVUyBpbiB1
c2Vyc3BhY2UsIGVzcCByZWxhdGVkIHRvIHJlc3VtZSBhbmQKc2ltaWxhciBzaXR1YXRpb25zPyBB
IHVzZXIgaGFzIGJlZW4gZXhwZXJpZW5jaW5nIHRoaXMgaW4gYQp0cmlja3ktdG8tcmVwcm9kdWNl
IHNjZW5hcmlvIHdpdGggYSB0b24gb2YgdnJhbSBkZWRpY2F0ZWQgdG8KZnJhbWVidWZmZXJzIGFu
ZCBzbyBvbiAoM3ggNEspLCBhbmQgdGhlIG5vdXZlYXUgZGR4IGZhbGxzIGJhY2sgdG8KbWVtY3B5
IGluIGNlcnRhaW4gY2FzZXMuCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
