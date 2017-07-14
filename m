From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM:
 exception RIP: drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 11:16:39 -0400
Message-ID: <CAKb7UvhStkbUmKQ9z3-k6=UuQFdL=iJd4zbfOZX-BLRsoraYzQ@mail.gmail.com>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
 <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
 <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
 <1500045346.5763.21.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1500045346.5763.21.camel-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgMTE6MTUgQU0sIE1pa2UgR2FsYnJhaXRoIDxlZmF1bHRA
Z214LmRlPiB3cm90ZToKPiBPbiBGcmksIDIwMTctMDctMTQgYXQgMTc6MTAgKzAyMDAsIEthcm9s
IEhlcmJzdCB3cm90ZToKPj4gWWVhaCwgd2Ugc2hvdWxkbid0IGxldCB0aGUgbWFjaGluZSBkaWUu
IEFyZSB0aGVyZSBtb3JlIFdBUk5fT05fT05DRQo+PiB1c2FnZSB3ZSBjb3VsZCBjb252ZXJ0IHRv
IFdBUk5fT05DRT8KPgo+IFNob290aW5nIHRoZSBtZXNzZW5nZXIgaXMgZ2VuZXJhbGx5IGNvbnNp
ZGVyZWQgdW5jb29sIDopCgpUaGF0J3MgbmV2ZXIgc3RvcHBlZCBpdCBmcm9tIGJlaW5nIGEgcG9w
dWxhciBwcmFjdGljZS4uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
