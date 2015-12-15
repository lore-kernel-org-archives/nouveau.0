From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events (v4)
Date: Tue, 15 Dec 2015 11:21:46 +0000
Message-ID: <CACvgo52MEzy-VovQa0UPrMq+ZsB6pzDA++FcRw_A-=YSMC8i2A@mail.gmail.com>
References: <1447173451-27890-1-git-send-email-thierry.reding@gmail.com>
 <20151110164139.GA27962@ulmo> <566FF56C.8000803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <566FF56C.8000803-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, russianneuromancer-k+OT61UuxXo@public.gmane.org, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "# 3.13+" <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ikey Doherty <ikey-3z5XHjlC/y4j9eliCJ546QC/G2K4zDHf@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMTUgRGVjZW1iZXIgMjAxNSBhdCAxMToxMSwgcG9tYSA8cG9taWRvcmFiZWxpc2ltYUBnbWFp
bC5jb20+IHdyb3RlOgoKPgo+IEFwcGFyZW50bHkgbm90IHJlYWNoZWQgQHN0YWJsZSAoc3RhYmxl
OiA0LjMuMyAyMDE1LTEyLTE1KSwKPiBzbyBoZXJlJ3Mgb25lIG1vcmUgdGltZS4KPgpJdCBoYXMg
cmVhY2hlZCA0LjQtcmNYIGFuZCB3aWxsIGdldCBwaWNrZWQgYnkgdGhlIHN0YWJsZSBtYWludGFp
bmVyCihHcmVnPykgaW4gZHVlIHRpbWUuIE1lYW53aGlsZSB5b3UgY2FuIGFzayB5b3VyIGRpc3Ry
byBtYWludGFpbmVycyB0bwphcHBseSBpdCBsb2NhbGx5IHVudGlsIHdlIGdldCBhbiBvZmZpY2lh
bCByZWxlYXNlIHRoYXQgaW5jbHVkZXMgaXQuCgotRW1pbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQo=
