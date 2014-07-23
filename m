From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 10:07:09 +0200
Message-ID: <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
 <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>
 <53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>
 <53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
 <53CE8A57.2000803@vodafone.de> <53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com> <53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com> <53CF699D.9070902@canonical.com>
 <53CF6B18.5070107@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53CF6B18.5070107-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgOTo1OCBBTSwgQ2hyaXN0aWFuIEvDtm5pZwo8ZGVhdGhz
aW1wbGVAdm9kYWZvbmUuZGU+IHdyb3RlOgo+IEp1c3QgaW1hZ2luZSBhbiBhcHBsaWNhdGlvbiB1
c2luZyBwcmltZSBpcyBsb2NraW5nIHVwIFJhZGVvbiBhbmQgYmVjYXVzZSBvZgo+IHRoYXQgZ2V0
cyBraWxsZWQgYnkgdGhlIHVzZXIuIE5vdGhpbmcgZWxzZSBpbiB0aGUgc3lzdGVtIHdvdWxkIHVz
ZSB0aGUKPiBSYWRlb24gaGFyZHdhcmUgYW55IG1vcmUgYW5kIHNvIHJhZGVvbiBnZXRzIG9ubHkg
Y2FsbGVkIGJ5IGFub3RoZXIgZHJpdmVyCj4gd2FpdGluZyBwYXRpZW50bHkgZm9yIHJhZGVvbiB0
byBmaW5pc2ggcmVuZGVyaW5nIHdoaWNoIG5ldmVyIGhhcHBlbnMgYmVjYXVzZQo+IHRoZSB3aG9s
ZSB0aGluZyBpcyBsb2NrZWQgdXAgYW5kIHdlIGRvbid0IGdldCBhIGNoYW5jZSB0byByZWNvdmVy
LgoKQnV0IGlzbid0IHRoYXQgcG9zc2libGUgYWxyZWFkeSB3aXRob3V0IGZlbmNlcz8gWCBoYW5n
cyByYWRlb24sIHVzZXIKY3Jhc2hlcyBYIGZvciB1bnJlbGF0ZWQgcmVhc29ucyBiZWZvcmUgcmFk
ZW9uIHdpbGwgbm90aWNlIHRoZSBoYW5nLgpUaGVuIG5vIG9uZSB1c2VzIHJhZGVvbiBhbnkgbG9u
Z2VyIGFuZCB0aGUgaGFuZyBzdGF5cyB1bmRldGVjdGVkLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
