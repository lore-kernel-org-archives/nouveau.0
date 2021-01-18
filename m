From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from
 GPU!
Date: Mon, 18 Jan 2021 15:09:45 +0000
Message-ID: <20210118150945.GE4903__40913.7968717673$1610990906$gmane$org@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <YAWhDRkSOHbJ+2Le-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
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

T24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gRnJpLCBKYW4g
MTUsIDIwMjEgYXQgMDY6Mjc6MTVQTSArMDAwMCwgWmFjayBSdXNpbiB3cm90ZToKPiA+IAo+ID4g
PiBPbiBKYW4gMTUsIDIwMjEsIGF0IDEzOjE1LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPiB3cm90ZToKPiA+ID4gCj4gPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZm
b3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNo
IGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiA+IG5pZ2dseSBs
aXR0bGUgd2FybmluZ3MuCj4gPiA+IAo+ID4gPiBMYXN0IHNldCEgIEFsbCBjbGVhbiBhZnRlciB0
aGlzIGZvcjsgQXJtLCBBcm02NCwgUFBDLCBNSVBTIGFuZCB4ODYuCj4gPiAKPiA+IFRoYW5rcyEg
Rm9yIGFsbCB0aGUgdm13Z2Z4IGJpdHM6Cj4gPiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFj
a3JAdm13YXJlLmNvbT4KPiAKPiBPayBJIG1lcmdlZCBldmVyeXRoaW5nIGV4Y2VwdCB2bXdnZngg
KHRoYXQncyBmb3IgWmFjaykgYW5kIGk5MTUvbm91dmVhdQo+ICh0aG9zZSBnZW5lcmFsbHkgZ28g
dGhyb3VnaCBvdGhlciB0cmVlcywgcGxzIGhvbGxlciBpZiB0aGV5J3JlIHN0dWNrKS4KClRoYW5r
cyBEYW5pZWwsIHlvdSdyZSBhIHN1cGVyc3RhciEKClNvIFphY2sgd2lsbCB0YWtlIHRoZSB2bXdn
ZnggcGFydHM/ICBEZXNwaXRlIHByb3ZpZGluZyBhIFItYj8KCj4gTm90ZSB0aGF0IHdlIGhhdmUg
c29tZSBidWlsZCBpc3N1ZSBvbiBzb21lIG9mIHRoZSBjb25maWdzIHNmciB1c2VzLCBzbyBkcm0K
PiB0cmVlcyBhcmUgc3RpbGwgc3R1Y2sgb24gb2xkIHZlcnNpb25zIGluIGxpbnV4LW5leHQuIEhv
cGVmdWxseSBzaG91bGQgZ2V0Cj4gcmVzb2x2ZWQgc29vbiwgdGhlIGJ1Z2ZpeCBpcyBpbiBzb21l
IHN1YnRyZWUgSSd2ZSBoZWFyZC4KCk5vIHdvcnJpZXMuICBUaGFua3MgZm9yIGxldHRpbmcgbWUg
a25vdy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGlu
ZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
