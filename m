From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] gr/gf100: wait on bottom half of FE's
	pipeline
Date: Wed, 10 Jun 2015 14:25:50 +0900
Message-ID: <CAAVeFuLH8mbXSfJN88XdmFpEket=D5NHRNa2i4wcCq-mnbiTnw@mail.gmail.com>
References: <1433753637-24706-1-git-send-email-acourbot@nvidia.com>
 <1433753637-24706-5-git-send-email-acourbot@nvidia.com>
 <CAKb7UvgC+eV1ot9CeZhCuBw79pK4v=-xja_AOMncfRjn=DsZ1g@mail.gmail.com>
 <CAAVeFuJQiNmjWzOdzY9rR2EJ_CX8dgM5DAG1-OOwbKXe2nLPAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJQiNmjWzOdzY9rR2EJ_CX8dgM5DAG1-OOwbKXe2nLPAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKdW4gOCwgMjAxNSBhdCAxMDo0MyBQTSwgQWxleGFuZHJlIENvdXJib3QgPGdudXJv
dUBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDgsIDIwMTUgYXQgODowNCBQTSwgSWxp
YSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PiB3cm90ZToKPj4gQSBuYWl2ZSBxdWVzdGlv
biBmcm9tIHNvbWVvbmUgd2hvIGtub3dzIG5vdGhpbmcgb2YgaWNtZCBvciBidW5kbGVzLi4uIFdv
dWxkCj4+IGl0IGJlIGJldHRlciB0byB3YWl0IGZvciBib3RoIGJpdHMgdG8gYmVjb21lIDAgKEku
ZS4gMHg2KT8KPgo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBhIG1ldGhvZCByZWFjaGluZyB0
aGUgYm90dG9tIGhhbGYgaW1wbGllcyBpdAo+IGhhcyBwYXNzZWQgdG8gdXBwZXIgaGFsZiAod2hh
dGV2ZXIgdGhlc2UgaGFsZnMgYXJlLCBJIG5lZWQgdG8gZGlnIGludG8KPiB0aGUgZG9jIHRvIGNv
bXBsZXRlbHkgZmlndXJlIGl0IG91dCksIGFuZCB0aHVzIHRoYXQgd2hpbGUgd2FpdGluZyBmb3IK
PiBib3RoIGJpdHMgd291bGQgZG8gbm8gaGFybSwgaXQgd291bGQgbm90IGRvIGFueSBnb29kIGVp
dGhlci4KPgo+IFdhaXRpbmcgb24gdGhlIGJvdHRvbSBoYWxmIGlzIHdoYXQgZG93bnN0cmVhbSBk
b2VzLCBzbyBJIHRoaW5rIHRoaXMKPiBiZWhhdmlvciBpcyBzYWZlIHRvIGFwcGx5IHRvIE5vdXZl
YXUuCgpBZnRlciBjaGVja2luZywgdGhpcyBzZWVtcyB0byBiZSBjb3JyZWN0LiBVcHBlciBoYWxm
IG9mIHRoZSBmcm9udC1lbmQKbWV0aG9kIHBpcGVsaW5lIGNvcnJlc3BvbmRzIHRvIHRoZSBkZWNv
ZGUgc3RhZ2UsIGJvdHRvbSBoYWxmIHRvCnZhbGlkYXRlIGFuZCBlbWl0LiBTbyB3ZSBuZWVkIHRv
IHdhaXQgb24gdGhlIGJvdHRvbSBoYWxmIHRvIGJlIHN1cmUKbWV0aG9kcyBhcmUgZW1pdHRlZC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
