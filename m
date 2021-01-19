From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from
 GPU!
Date: Tue, 19 Jan 2021 08:29:27 +0000
Message-ID: <20210119082927.GJ4903__11876.461554651$1611053377$gmane$org@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <YAXDgmWMR9s4OgxN-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Zack Rusin <zackr-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Eddie Dong <eddie.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Faith <faith-jCdQPDEk3idBDgjK7y7TUQ@public.gmane.org>, Gareth Hughes <gareth-jCdQPDEk3idBDgjK7y7TUQ@public.gmane.org>, "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jackie Li <yaodong.li-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jan Safrata <jan.nikitenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jesse Barnes <jesse.barnes-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, jim liu <jim.liu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Keith Packard <keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org>, Kevin Tian <kevin.tian@intel>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gTW9uLCBKYW4g
MTgsIDIwMjEgYXQgMDM6MDk6NDVQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gTW9u
LCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IAo+ID4gPiBPbiBGcmksIEph
biAxNSwgMjAyMSBhdCAwNjoyNzoxNVBNICswMDAwLCBaYWNrIFJ1c2luIHdyb3RlOgo+ID4gPiA+
IAo+ID4gPiA+ID4gT24gSmFuIDE1LCAyMDIxLCBhdCAxMzoxNSwgTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgc2V0IGlzIHBh
cnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiA+ID4g
PiBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRs
ZWQgd2l0aAo+ID4gPiA+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gTGFzdCBzZXQhICBBbGwgY2xlYW4gYWZ0ZXIgdGhpcyBmb3I7IEFybSwgQXJtNjQsIFBQ
QywgTUlQUyBhbmQgeDg2Lgo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcyEgRm9yIGFsbCB0aGUgdm13
Z2Z4IGJpdHM6Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5j
b20+Cj4gPiA+IAo+ID4gPiBPayBJIG1lcmdlZCBldmVyeXRoaW5nIGV4Y2VwdCB2bXdnZnggKHRo
YXQncyBmb3IgWmFjaykgYW5kIGk5MTUvbm91dmVhdQo+ID4gPiAodGhvc2UgZ2VuZXJhbGx5IGdv
IHRocm91Z2ggb3RoZXIgdHJlZXMsIHBscyBob2xsZXIgaWYgdGhleSdyZSBzdHVjaykuCj4gPiAK
PiA+IFRoYW5rcyBEYW5pZWwsIHlvdSdyZSBhIHN1cGVyc3RhciEKPiA+IAo+ID4gU28gWmFjayB3
aWxsIHRha2UgdGhlIHZtd2dmeCBwYXJ0cz8gIERlc3BpdGUgcHJvdmlkaW5nIGEgUi1iPwo+IAo+
IEkgb25seSBtZXJnZSBzdHVmZiB0aGF0J3MgZGVmYWN0byBhYmFuZG9uZWQgYWxyZWFkeS4gRXZl
cnl0aGluZyBlbHNlIEkgdHJ5Cj4gdG8gb2ZmbG9hZCB0byB3aG9tZXZlciBhY3R1YWxseSBjYXJl
cyA6LSkKClVuZGVyc3Rvb2QuICBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KCkhvcGVmdWxs
eSBaYWNrIGFjdHVhbGx5IGNhcmVzLiA6RAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
