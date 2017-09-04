From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: v4.12 backport request: 13a86519202
 (drm/nouveau/i2c/gf119-: add support for address-only transactions)
Date: Mon, 4 Sep 2017 13:19:18 +0200
Message-ID: <20170904111918.GA9450@kroah.com>
References: <CAKb7UviPvnF_VuffWJW3HAXN66Jv4617On2-cC8qqho0suop6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UviPvnF_VuffWJW3HAXN66Jv4617On2-cC8qqho0suop6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gU3VuLCBTZXAgMDMsIDIwMTcgYXQgMTE6NDY6NTdBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gQ29tbWl0IGRmOGRjOTdjZDE3IChkcm0vbm91dmVhdS9rbXMvbnY1MDogdXNlIGRybSBj
b3JlIGkyYy1vdmVyLWF1eAo+IGFsZ29yaXRobSkgc3dpdGNoZWQgdGhpbmdzIG92ZXIgdG8gdGhl
IGRybSBhbGdvLiBVbmZvcnR1bmF0ZWx5IGl0Cj4gZ2VuZXJhdGVzIGFkZHJlc3Mtb25seSB0cmFu
c2FjdGlvbnMuIFByaW9yIHRvIEdGMTE5LCB0aGUgaGFyZHdhcmUgaGFkCj4gbm8gc3VwcG9ydCBm
b3Igc3VjaCB0aGluZ3MsIGFuZCBHRjExOSsgdGhlIG5vdXZlYXUgY29kZSBkaWQgbm90IGhhbmRs
ZQo+IHRoZXNlIHByb3Blcmx5Lgo+IAo+IFRoZSByZXN1bHQgb2YgdGhpcyBidWcgaXMgdGhhdCBF
RElEIGRvZXNuJ3QgbWFrZSBpdCBvdmVyIGZvciBEUCAoYW5kCj4gZURQKSBzY3JlZW5zLCB3aGlj
aCBpbiB0dXJuIHdyZWFrcyBhbGwgc29ydHMgb2YgaGF2b2MuIFRoZXJlIGhhdmUgYmVlbgo+IGxv
dHMgb2YgcmVwb3J0cyBvbiBJUkMsIGEgZmV3IG9uIG1haWxpbmcgbGlzdHMsIGFuZCBhbHNvOgo+
IAo+IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjUyOAo+
IAo+IENvbW1pdCAxM2E4NjUxOTIwMiAoZHJtL25vdXZlYXUvaTJjL2dmMTE5LTogYWRkIHN1cHBv
cnQgZm9yCj4gYWRkcmVzcy1vbmx5IHRyYW5zYWN0aW9ucykgZml4ZXMgdGhlIG5vdXZlYXUgc3Vw
cG9ydCBmb3Igc3VjaAo+IHRyYW5zYWN0aW9ucyBvbiBHRjExOSsgYW5kIGZsaXBzIHRoaW5ncyBi
YWNrIG92ZXIgdG8gdGhlIGN1c3RvbSBhbGdvCj4gZm9yIGVhcmxpZXIgY2hpcHMuIFBsZWFzZSBp
bmNsdWRlIGludG8gdGhlIG5leHQgdjQuMTIueCByZWxlYXNlOgoKTm93IHF1ZXVlZCB1cCwgdGhh
bmtzLgoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
