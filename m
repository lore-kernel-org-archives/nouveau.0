From: Imre Deak <imre.deak-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 13/20] drm/i915/dp: Extract
 drm_dp_downstream_read_info()
Date: Mon, 24 Aug 2020 18:46:26 +0300
Message-ID: <20200824154626.GA19658@ideak-desk.fi.intel.com>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-14-lyude@redhat.com>
 <20200819151547.GB46474@art_vandelay>
 <4d74a74aefcd8d0ea048b70252efda18820bc911.camel@redhat.com>
 <20200820223754.GA17451@ideak-desk.fi.intel.com>
 <597b83ace909f97bfefbe15ffbb0370c2101ff0f.camel@redhat.com>
Reply-To: imre.deak-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <597b83ace909f97bfefbe15ffbb0370c2101ff0f.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Gwan-gyeong Mun <gwan-gyeong.mun-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Manasi Navare <manasi.d.navare-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Uma Shankar <uma.shankar-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBBdWcgMjEsIDIwMjAgYXQgMDE6NDM6MzlQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBbLi4uXSAKPiA+IFRoZSB3b3JkaW5nIGlzIGEgYml0IHVuY2xlYXIsIGJ1dCBhcyBJIHVu
ZGVyc3RhbmQgdGhlIFN0YW5kYXJkIG9ubHkKPiA+IGNhbGxzIGZvciB0aGUgYWJvdmU6Cj4gPiAK
PiA+ICIiIgo+ID4gQSBEUCB1cHN0cmVhbSBkZXZpY2Ugc2hhbGwgcmVhZCB0aGUgY2FwYWJpbGl0
eSBmcm9tIERQQ0QgQWRkcmVzc2VzIDAwMDgwaAo+ID4gdGhyb3VnaCAwMDA4M2guIEEgRFAgQnJh
bmNoIGRldmljZSB3aXRoIG11bHRpcGxlIERGUHMgc2hhbGwgcmVwb3J0IHRoZQo+ID4gZGV0YWls
ZWQKPiA+IGNhcGFiaWxpdHkgaW5mb3JtYXRpb24gb2YgdGhlIGxvd2VzdCBERlAgbnVtYmVyIHRv
IHdoaWNoIGEgZG93bnN0cmVhbSBkZXZpY2UKPiA+IGlzIGNvbm5lY3RlZCwgY29uc2lzdGVudCB3
aXRoIHRoZSBEaXNwbGF5SUQgb3IgbGVnYWN5IEVESUQgYWNjZXNzIHJvdXRpbmcKPiA+IHBvbGlj
eQo+ID4gb2YgYW4gU1NULW9ubHkgRFAgQnJhbmNoIGRldmljZSBhcyBkZXNjcmliZWQgaW4gU2Vj
dGlvbiAyLjEuNC4xLgo+ID4gIiIiCj4gCj4gU28tSSBzYXcgdGhpcyB0b28sIGJ1dCBub3RpY2Ug
dGhlIHVzZSBvZiB0aGUgbGFuZ3VhZ2UgIkEgL0RQIEJyYW5jaC8gZGV2aWNlIHdpdGgKPiBtdWx0
aXBsZSBERlBzIHNoYWxsIHJlcG9ydCB0aGUgZGV0YWlsZWTigKYiLiBUaGlzIG1ha2VzIG1lIHRo
aW5rIGl0J3MgaW1wbHlpbmcKPiB0aGF0IHRoaXMgaXMgYSByZXF1aXJlbWVudCBmb3IgTVNUQnMg
YW5kIG5vdCBTU1Qgc2lua3MsIGp1c3QgYSBndWVzcy4KCk5vdCBzdXJlIGVpdGhlci4gVGhlIGFi
b3ZlIGNvdWxkIGFsc28gcmVmZXIgdG8gYW4gU1NUIGJyYW5jaCBkZXZpY2Ugd2l0aAptdWx0aXBs
ZSBERlBzIChmb3IgaW5zdGFuY2UgYSBEUCBSZXBsaWNhdG9yIGJyYW5jaCBkZXZpY2UpLgoKLS1J
bXJlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
