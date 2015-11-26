From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm 08/13] nouveau: make use of nouveau_drm::fd
 instead of nouveau_device::fd
Date: Thu, 26 Nov 2015 21:06:08 +0000
Message-ID: <CACvgo51nyJtd8hiSOgGHGf-8sr9MwxJw00sip9oo3Dj74hsB-Q@mail.gmail.com>
References: <1448522050-4873-1-git-send-email-skeggsb@gmail.com>
 <1448522050-4873-8-git-send-email-skeggsb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1448522050-4873-8-git-send-email-skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMjYgTm92ZW1iZXIgMjAxNSBhdCAwNzoxNCwgQmVuIFNrZWdncyA8c2tlZ2dzYkBnbWFpbC5j
b20+IHdyb3RlOgo+IEZyb206IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPgo+IFRo
ZSBsYXR0ZXIgaXMgZGVwcmVjYXRlZCwgYW5kIHdpbGwgbm90IGJlIHZhbGlkIGZvciBuZXdlciBj
bGllbnRzLgo+Ck1lbnRpb24gKG9yIHNwbGl0KSB0aGUgcmVtb3ZhbCBvZiBub3V2ZWF1X29iamVj
dF9maW5kID8gQWZhaWNzIGl0IGhhcwpuZXZlciBiZWVuIHVzZWQgaW4gbWVzYSArIGRkeC4KCi1F
bWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
