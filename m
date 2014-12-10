From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm: sgdma: free allocated memory if TT init
 fails
Date: Thu, 11 Dec 2014 03:58:10 +0900
Message-ID: <548897C2.8020401@nvidia.com>
References: <1418236637-15053-1-git-send-email-acourbot@nvidia.com>
 <CAKb7UvgOwK469E6z_nEC+UHXVgs5d-6rNFiwiqApO63tbs2P6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgOwK469E6z_nEC+UHXVgs5d-6rNFiwiqApO63tbs2P6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMTIvMTEvMjAxNCAwMzo0NyBBTSwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gV2UgZ2V0IHRoaXMg
cGF0Y2ggZXZlcnkgZmV3IG1vbnRocy4uLiBIb3cgYWJvdXQgb25lIHRoYXQgaW5zdGVhZCBhZGRz
Cj4gYSBjb21tZW50IHdoaWNoIGV4cGxhaW5zIHdoeSB0aGlzIGtmcmVlIGlzbid0IG5lZWRlZCA6
KSBbSSdtIGxlYXZpbmcKPiB0aGUgcmVhc29uIHRvIHRoZSByZWFkZXIsIHdoaWNoIHdpbGwgZm9y
Y2UgeW91IHRvIGdsYW5jZSBhdCB0aGUgdHRtCj4gY29kZS5dCgp0dG1fZG1hX3R0X2luaXQgLT4g
dHRtX3R0X2Rlc3Ryb3kgLT4gbm91dmVhdV9zZ2RtYV9kZXN0cm95IC0+IGtmcmVlCgpVcnJrLgoK
SSdtIGRlZmluaXRlbHkgbm90IGEgZmFuIG9mIHRoaW5ncyBoYXBwZW5pbmcgdGhpcyB3YXksIGJ1
dCBsZXQgaXQgYmUuCgpJbmRlZWQgYSBjb21tZW50IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBoZXJl
LCBsZXQgbWUgcHJlcCBhIHBhdGNoIGZvciAKdGhpcyBpbnN0ZWFkLi4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
