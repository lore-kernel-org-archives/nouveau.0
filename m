From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nouveau: remove open-coded
 drm_invalid_op()
Date: Fri, 24 May 2019 16:14:07 +0100
Message-ID: <20190524151407.GA8938@arch-x1c3>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <20190522150219.13913-2-emil.l.velikov@gmail.com>
 <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gMjAxOS8wNS8yMywgQmVuIFNrZWdncyB3cm90ZToKPiBPbiBUaHUsIDIzIE1heSAyMDE5IGF0
IDAxOjAzLCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+
Cj4gPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+ID4gQ2M6IG5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IFRoYW5rcyEKPiAKRm9yZ290IHRvIG1lbnRpb24s
IGFueSBvYmplY3Rpb25zIGlmIEkgdGFrZSB0aGlzIHRocm91Z2ggZHJtLW1pc2M/CkknbSBhYm91
dCB0byBzZW5kIGEgbGVuZ3RoeSBzZXJpZXMgd2hpY2ggd2lsbCBjb25mbGljdCB3aXRoIHRoaXMg
cGF0Y2gsCmFsYmVpdCB0cml2aWFsbHkuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
