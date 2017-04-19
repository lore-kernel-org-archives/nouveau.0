From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] nouveau_hwmon: Add nouveau_hwmon_ops
 structure with .is_visible/.read_string
Date: Wed, 19 Apr 2017 14:19:37 -0400
Message-ID: <CAKb7UvjOrkCZLLZ+1P4uR_+Cwm701a=cWys51sPKcwgSuOYAtw@mail.gmail.com>
References: <1492415272-20378-1-git-send-email-osalvador.vilardaga@gmail.com>
 <1492415272-20378-3-git-send-email-osalvador.vilardaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1492415272-20378-3-git-send-email-osalvador.vilardaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Oscar Salvador <osalvador.vilardaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBBcHIgMTcsIDIwMTcgYXQgMzo0NyBBTSwgT3NjYXIgU2FsdmFkb3IKPG9zYWx2YWRv
ci52aWxhcmRhZ2FAZ21haWwuY29tPiB3cm90ZToKPiArc3RhdGljIGNoYXIgKmlucHV0X2xhYmVs
ID0gIkdQVSBjb3JlIjsKClRoaXMgbmVlZHMgdG8gYmUgc3RhdGljIGNvbnN0IGNoYXIgaW5wdXRf
bGFiZWxbXSA9ICJHUFUgY29yZSI7CgpvciBhdCBsZWFzdCBzdGF0aWMgY29uc3QgY2hhciAqY29u
c3QgaW5wdXRfbGFiZWwgPSAiR1BVIGNvcmUiOwoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
