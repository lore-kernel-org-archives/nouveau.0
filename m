From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/secboot/acr: Remove VLA usage
Date: Mon, 25 Jun 2018 14:47:18 -0700
Message-ID: <CAGXu5jKuK687hg6JkToiRaMpOV=rOLJgkcNU51ZXnSzqKvojhg@mail.gmail.com>
References: <20180524172436.GA17738@beast>
 <CACO55ttzvFZqUjXNut5n0ENR9e2+N2WfWnKnjfaWgNesspQ9UA@mail.gmail.com>
 <CAGXu5jL3GyJxd9EJ=gKb+SY98t2h2Q4VMt0b0fYt8KBBuP2_9Q@mail.gmail.com>
 <CACO55tuUROCr14Eq-Yn_OcD21QBjfa33b0Oj4oAthEz5NHHhrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tuUROCr14Eq-Yn_OcD21QBjfa33b0Oj4oAthEz5NHHhrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdW4gMjIsIDIwMTggYXQgMjo0MCBQTSwgS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+IFlvdXIgcGF0Y2ggaXMgZmluZSBhcyBpdCBpcyB0aG91Z2gsIGJl
Y2F1c2UgaXQgZG9lc24ndCBhZGQgYSBuZXcKPiBpc3N1ZSwgaXQganVzdCBzaG93ZWQgdXMgdGhl
cmUgaXMgYSBwb3RlbnRpYWwgb25lLiBXZSBzaG91bGQga2VlcCB0aGF0Cj4gaW4gbWluZCBhbmQg
c2VlIGhvdyB3ZSB3YW50IHRvIGZpeCB0aGF0IHVwLiBJIGNhbiBpbWFnaW5lIHRoYXQgdGhpcwo+
IG1pZ2h0IGNhdXNlIHNvbWUgaXNzdWVzIGluIHNvbWUgcGxhY2VzLCBtYXliZSBpdCBpcyB0b3Rh
bGx5IGZpbmUuCgpPa2F5LCB0aGFua3MhIFdobyBjYW4gdGFrZSB0aGUgcGF0Y2ggaW50byB0aGVp
ciB0cmVlPwoKLUtlZXMKCi0tIApLZWVzIENvb2sKUGl4ZWwgU2VjdXJpdHkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
