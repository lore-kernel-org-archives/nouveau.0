From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/nouveau/led: abort early if the
 device does not have GPIOs
Date: Fri, 16 Sep 2016 16:42:51 +0900
Message-ID: <CAAVeFu+0DsfhYWkX5F+oLJSVyRq5Sg015J=f0SXe=YSEkRvB0A@mail.gmail.com>
References: <20160916073444.8952-1-martin.peres@free.fr>
 <20160916073444.8952-3-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160916073444.8952-3-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBTZXAgMTYsIDIwMTYgYXQgNDozNCBQTSwgTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVy
ZXNAZnJlZS5mcj4gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogTWFydGluIFBlcmVzIDxtYXJ0aW4u
cGVyZXNAZnJlZS5mcj4KClRlc3RlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52
aWRpYS5jb20+CgpGaXhlcyB0aGUgY3Jhc2ggSSB3YXMgc2VlaW5nIG9uIFRlZ3JhLCB0aGFua3Mh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
