From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM:
 exception RIP: drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 11:20:01 -0400
Message-ID: <CAKb7UvhtOBOcOcsZXXXa2qVDd6YWQaZrKtMwfPj5V8wk=97DXw@mail.gmail.com>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
 <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
 <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
 <31d327dd-bc3d-cb80-45a9-6a8eb9eb2a9d@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <31d327dd-bc3d-cb80-45a9-6a8eb9eb2a9d-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgMTE6MTkgQU0sIFRvYmlhcyBLbGF1c21hbm4KPHRvYmlh
cy5qb2hhbm5lcy5rbGF1c21hbm5AbW5pLnRobS5kZT4gd3JvdGU6Cj4gVGhlIGNvbnZlcnNpb24g
aXMgYSBuaWNlIGNhdGNoLCBidXQgaSdkIGxpa2UgdG8gaGF2ZSBhIGJpdCBtb3JlIGNvbnRleHQs
IHNlZQo+IGJlbG93IQo+Cj4gV2l0aCBhIGJldHRlciBkZXNjcmlwdGlvbjoKPgo+IFRvYmlhcyBL
bGF1c21hbm4gPHRvYmlhcy5qb2hhbm5lcy5rbGF1c21hbm5AbW5pLnRobS5kZT4KCkkgZG9uJ3Qg
dGhpbmsgaXQgd2FzIG1lYW50IGFzIGEgc2VyaW91cyBwYXRjaC4gV0FSTl9PTl9PTkNFIHNob3Vs
ZAp3b3JrLiBUaGUgZml4IGlzbid0IHRvIHJlbW92ZSBhbGwgaW5zdGFuY2VzIG9mIFdBUk5fT05f
T05DRS4gVGhlIGZpeAppcyB0byBmaXggV0FSTl9PTl9PTkNFLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
