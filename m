From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] device/tegra: fix uninitialized IRQ number
Date: Wed, 27 Jan 2016 09:13:36 +0900
Message-ID: <CAAVeFu+U3maa=o_T+=aG-D1snzLZJcUMSW+BaTT=RWBwfq0OpQ@mail.gmail.com>
References: <1453715064-14160-1-git-send-email-acourbot@nvidia.com>
 <1453715064-14160-2-git-send-email-acourbot@nvidia.com>
 <1453841046.2816.9.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1453841046.2816.9.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKYW4gMjcsIDIwMTYgYXQgNTo0NCBBTSwgTHVjYXMgU3RhY2ggPGRldkBseW54ZXll
LmRlPiB3cm90ZToKPiBBbSBNb250YWcsIGRlbiAyNS4wMS4yMDE2LCAxODo0NCArMDkwMCBzY2hy
aWViIEFsZXhhbmRyZSBDb3VyYm90Ogo+PiBudmttX2RldmljZV90ZWdyYV9uZXcgaW5pdGlhbGl6
ZXMgdGhlIGlycSBtZW1iZXIgb2YgdGhlIFRlZ3JhIGRldmljZQo+PiB0byAtMSBpbiBvcmRlciB0
byBzaWduYWwgdGhhdCBpdCBpcyB1bmluaXRpYWxpemVkLiBIb3dldmVyLAo+PiBudmttX2Rldmlj
ZV90ZWdyYV9maW5pIHRlc3RzIGl0IGFnYWluc3QgMCB0byBjaGVjayB3aGV0aGVyIGFuIElSUSBo
YXMKPj4gYmVlbiBhbGxvY2F0ZWQgb3Igbm90LiBUaGlzIGxlYWRzIHRvIGZyZWVfaXJxIGJlaW5n
IGNhbGxlZCBvbiAtMQo+PiBkdXJpbmcKPj4gZGV2aWNlIGluaXRpYWxpemF0aW9uLgo+Pgo+IFRo
ZSBjb252ZW50aW9uIGluIG90aGVyIHBhcnRzIG9mIHRoZSBMaW51eCBrZXJuZWwgaXMgdGhhdCBJ
UlEgbnVtYmVyIDAKPiBtZWFucyB1bmFsbG9jYXRlZC9pbnZhbGlkIElSUS4gU28gSSB0aGluayBp
dCBpcyB0aGUgaW5pdGlhbGl6YXRpb24gdG8KPiAtMSB0aGF0IHNob3VsZCBiZSBmaXhlZCBpbnN0
ZWFkLgoKVWgsIHRoYXQgc291bmRzIHVuc2FmZS4gVGhhbmtzIGZvciBzcG90dGluZyB0aGlzLCB3
aWxsIHJlc2VuZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
