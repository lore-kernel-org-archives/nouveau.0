From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] map big page by platform IOMMU
Date: Fri, 17 Apr 2015 15:42:13 +0800
Message-ID: <5530B955.1040104@nvidia.com>
References: <1429182379-31964-1-git-send-email-vinceh@nvidia.com>
 <CAAVeFuJLRo1XYum3FZBhO5=5u63KLUY_tr0wk=TPxWutvCdL8A@mail.gmail.com>
 <5530B7D3.60700@nvidia.com>
 <CAAVeFuLdr7h29G6_1XGV8kTag=m4Spe_R9Aog38eRs9gAbgdVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuLdr7h29G6_1XGV8kTag=m4Spe_R9Aog38eRs9gAbgdVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ck9uIDA0LzE3LzIwMTUgMDM6MzcgUE0sIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IE9uIEZy
aSwgQXByIDE3LCAyMDE1IGF0IDQ6MzUgUE0sIFZpbmNlIEhzdSA8dmluY2VoQG52aWRpYS5jb20+
IHdyb3RlOgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBUaGlzIGVtYWlsIG1lc3Nh
Z2UgaXMgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGFuZCBt
YXkKPj4gY29udGFpbgo+PiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uICBBbnkgdW5hdXRob3Jp
emVkIHJldmlldywgdXNlLCBkaXNjbG9zdXJlIG9yCj4+IGRpc3RyaWJ1dGlvbgo+PiBpcyBwcm9o
aWJpdGVkLiAgSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNv
bnRhY3QgdGhlCj4+IHNlbmRlciBieQo+PiByZXBseSBlbWFpbCBhbmQgZGVzdHJveSBhbGwgY29w
aWVzIG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdlLgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IFVucmVsYXRlZDogSSBhc2tlZCBJVCB0byBhZGQgdGhlIE5vdXZlYXUgTUwgdG8gb3VyIGNv
cHlyaWdodCBmb290ZXIKPiB3aGl0ZWxpc3QuIFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZSBn
dXlzLCBwbGVhc2UgYmVhciB3aXRoIHVzLgpUZXJqZSB0b2xkIG1lIEkgY2FuIHJlbW92ZSB0aGlz
IGJ5IHNvbWUgc2V0dGluZywgYnV0IEkgaGF2ZW4ndCB0cmllZCAKdGhhdC4gU29ycnkuCgpUaGFu
a3MsClZpbmNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
