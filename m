From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: nouveau. swiotlb: coherent allocation failed for
 device 0000:01:00.0 size=2097152
Date: Mon, 18 Dec 2017 20:12:12 +0100
Message-ID: <1513624332.7942.8.camel@gmx.de>
References: <1513620418.7113.51.camel@gmx.de>
 <a083d576-215f-eb76-278b-741fc65fb138@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <a083d576-215f-eb76-278b-741fc65fb138-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCAyMDE3LTEyLTE4IGF0IDIwOjAxICswMTAwLCBUb2JpYXMgS2xhdXNtYW5uIHdyb3Rl
Ogo+IE9uIDEyLzE4LzE3IDc6MDYgUE0sIE1pa2UgR2FsYnJhaXRoIHdyb3RlOgo+ID4gR3JlZXRp
bmdzLAo+ID4KPiA+IEtlcm5lbCBib3VuZCB3b3JrbG9hZHMgc2VlbSB0byB0cmlnZ2VyIHRoZSBi
ZWxvdyBmb3Igd2hhdGV2ZXIgcmVhc29uLgo+ID4gIMKgSSBvbmx5IHNlZSB0aGlzIHdoZW4gYmVh
dGluZyB1cCBORlMuIMKgVGhlcmUgd2FzIGEga3dvcmtlciB3YWtldXAKPiA+IGxhdGVuY3kgaXNz
dWUsIGJ1dCB3aXRoIGEgYmFuZGFpZCBhcHBsaWVkIHRvIGZpeCB0aGF0IHVwLCBJIGNhbiBzdGls
bAo+ID4gdHJpZ2dlciB0aGlzLgo+IAo+IAo+IEhpLAo+IAo+IGkgaGF2ZSBzZWVuIHRoaXMgb25l
IGFzIHdlbGwgd2l0aCBteSBzeXN0ZW0sIGJ1dCBpIGNvdWxkIG5vdCBmaW5kIGFuIAo+IGVhc3kg
d2F5IHRvIHRyaWdnZXIgaXQgZm9yIGJpc2VjdGluZyBwdXJwb3NlLiBJZiB5b3UgY2FuIHRyaWdn
ZXIgaXQgCj4gY29udmVuaWVudGx5LCBhIGJpc2VjdCB3b3VsZCBiZSBuaWNlIQoKV29ya2xvYWQg
cGVybWl0dGluZy4gwqBUbyByZXByb2R1Y2UsIG1vdW50IHlvdXIgYm94IE5GUywgY2QgdG8gc29t
ZXdoZXJlCnRoZSBORlMgbW91bnQsIGFuZCBqdXN0IGRvIGJvbm5pZSAtcyA8bWVtb3J5IHNpemU+
LiDCoFRoZXJlLCBtYXliZQp5b3UnbGwgYmVhdCBtZSB0byBpdC4gwqBJIGhvcGUgc28sIEkgaGF2
ZSBtdWx0aXBsZSBrZXJuZWxzIGRvaW5nIHRoZQphbm5veWluZyAiYmFieSBiaXJkcyBpbiBhIG5l
c3QiIHRoaW5nIGF0IG1lIGxpdGVyYWxseSBlbmRsZXNzbHkgOikKCgktTWlrZQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
