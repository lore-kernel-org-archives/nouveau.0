From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nouveau: remove open-coded
 drm_invalid_op()
Date: Mon, 27 May 2019 16:03:22 +1000
Message-ID: <CACAvsv6nqEODiWPwx0w_PSZSb_n59_JZBpuyKHtx16r8KJf5AA@mail.gmail.com>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <20190522150219.13913-2-emil.l.velikov@gmail.com>
 <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
 <20190524151407.GA8938@arch-x1c3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190524151407.GA8938@arch-x1c3>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gU2F0LCAyNSBNYXkgMjAxOSBhdCAwMToxNSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS8wNS8yMywgQmVuIFNrZWdncyB3cm90ZToK
PiA+IE9uIFRodSwgMjMgTWF5IDIwMTkgYXQgMDE6MDMsIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZl
bGlrb3ZAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+ID4KPiA+ID4gQ2M6IEJlbiBTa2VnZ3MgPGJz
a2VnZ3NAcmVkaGF0LmNvbT4KPiA+ID4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9y
YS5jb20+Cj4gPiBUaGFua3MhCj4gPgo+IEZvcmdvdCB0byBtZW50aW9uLCBhbnkgb2JqZWN0aW9u
cyBpZiBJIHRha2UgdGhpcyB0aHJvdWdoIGRybS1taXNjPwo+IEknbSBhYm91dCB0byBzZW5kIGEg
bGVuZ3RoeSBzZXJpZXMgd2hpY2ggd2lsbCBjb25mbGljdCB3aXRoIHRoaXMgcGF0Y2gsCj4gYWxi
ZWl0IHRyaXZpYWxseS4KR28gZm9yIGl0LgoKPgo+IFRoYW5rcwo+IEVtaWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
