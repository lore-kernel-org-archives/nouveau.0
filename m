From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/radeon: remove AGP support
Date: Tue, 12 May 2020 10:16:40 +0200
Message-ID: <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-CA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMjAyMC0wNS0xMSAxMDoxMiBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gT24gTW9uLCBN
YXkgMTEsIDIwMjAgYXQgMToxNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0
enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4KPj4gQUdQIGlzIGRlcHJlY2F0ZWQgZm9yIDEw
KyB5ZWFycyBub3cgYW5kIG5vdCB1c2VkIGFueSBtb3JlIG9uIG1vZGVybiBoYXJkd2FyZS4KPj4K
Pj4gT2xkIGhhcmR3YXJlIHNob3VsZCBjb250aW51ZSB0byB3b3JrIGluIFBDSSBtb2RlLgo+IAo+
IE1pZ2h0IHdhbnQgdG8gY2xhcmlmeSB0aGF0IHRoZXJlIGlzIG5vIGxvc3Mgb2YgZnVuY3Rpb25h
bGl0eSBoZXJlLgo+IFNvbWV0aGluZyBsaWtlOgo+IAo+ICJUaGVyZSBpcyBubyBsb3NzIG9mIGZ1
bmN0aW9uYWxpdHkgaGVyZS4gIEdQVXMgd2lsbCBjb250aW51ZSB0bwo+IGZ1bmN0aW9uLiAgVGhp
cyBqdXN0IGRyb3BzIHRoZSB1c2Ugb2YgdGhlIEFHUCBNTVUgaW4gdGhlIGNoaXBzZXQgaW4KPiBm
YXZvciBvZiB0aGUgTU1VIG9uIHRoZSBkZXZpY2Ugd2hpY2ggaGFzIHByb3ZlbiB0byBiZSBtdWNo
IG1vcmUKPiByZWxpYWJsZS4gIER1ZSB0byBpdHMgdW5yZWxpYWJpbGl0eSwgQUdQIHN1cHBvcnQg
aGFzIGJlZW4gZGlzYWJsZWQgb24KPiBQb3dlclBDIGZvciB5ZWFycyBhbHJlYWR5IHNvIHRoZXJl
IGlzIG5vIGNoYW5nZSBvbiBQb3dlclBDLiIKClRoZXJlJ3MgYSBkaWZmZXJlbmNlIGJldHdlZW4g
c29tZXRoaW5nIGJlaW5nIGRpc2FibGVkIGJ5IGRlZmF1bHQgb3Igbm90CmJlaW5nIGF2YWlsYWJs
ZSBhdCBhbGwuIFdlIG1heSBkZWNpZGUgaXQncyB3b3J0aCBpdCBhbnl3YXksIGJ1dCBsZXQncyBk
bwppdCBiYXNlZCBvbiBmYWN0cy4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
