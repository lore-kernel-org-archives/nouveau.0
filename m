From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 5/7] drm/nouveau: utilize subconnector
 property for DP
Date: Wed, 28 Aug 2019 17:54:04 +0300
Message-ID: <20190828145404.GE7482@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-6-oleg.vasilev@intel.com>
 <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
 <20190828143821.GD7482@intel.com>
 <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Oleg Vasilev <oleg.vasilev-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6NDc6MDhBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6MzggQU0gVmlsbGUgU3lyasOkbMOkCj4g
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEF1
ZyAyNiwgMjAxOSBhdCAwOTozNjo1MEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+ID4g
VGhpcyBzaG91bGQgcHJvYmFibHkgYmUgZml4ZWQgdG8gYWNjb3VudCBmb3IgdGhlIHNjZW5hcmlv
IHdoZXJlIGFuCj4gPiA+IEhETUkgY29ubmVjdG9yIGlzIHBsdWdnZWQgZGlyZWN0bHkgaW50byB0
aGUgRFArKyBwb3J0LiBJIGRvbid0IHRoaW5rCj4gPiA+IHRoZSBkcC5zdWJjb25uZWN0b3IgcHJv
cGVydHkgd2lsbCBiZSB2YWxpZCBpbiB0aGF0IGNhc2UuCj4gPiA+IChVbmZvcnR1bmF0ZWx5IEkg
ZG9uJ3QgcmVtZW1iZXIgaG93IG9uZSBkZXRlY3RzIHRoYXQgcGFydGljdWxhcgo+ID4gPiBzaXR1
YXRpb24uKQo+ID4KPiA+IE9uZSBtYXkgb3IgbWF5IG5vdCBiZSBhYmxlIHRvIGRldGVjdCBpdCB2
ZXJ5IHdlbGwuIEkndmUgc2VlbiBkb25nbGVzCj4gPiB0aGF0IGF1dG9tYWdpY2FsbHkgY2hhbmdl
IHRoZSBERlAgdHlwZSBmcm9tIERQKysgdG8gRFAvSERNSSBkZXBlbmRpbmcKPiA+IG9uIHdoYXQn
cyBwbHVnZ2VkIGluLCBhbmQgSSd2ZSBhbHNvIHNlZW4gZG9uZ2xlcyB0aGF0IGxlYXZlIHRoZSBE
RlAKPiA+IHR5cGUgdG8gRFArKy4KPiAKPiBXZWxsLCBvdXIgaW50ZXJuYWwgbG9naWMgY2VydGFp
bmx5IGtub3dzIGlmIGl0J3MgZHJpdmluZyBEUCBvciBUTURTLiBJCj4ganVzdCBkb24ndCByZW1l
bWJlciBob3cgaXQga25vd3MgdGhpcy4KCllvdSdsbCBiZSBkcml2aW5nIERQIGluIHRoaXMgY2Fz
ZS4gVGhlIERGUCB3aWxsIGJlIHRoZSBvbmUgZHJpdmluZwpEUCBvciBUTURTIGRlcGVuZGluZyBv
biB3aGF0J3MgcGx1Z2dlZCBpbi4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
