From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] platform: specify the IOMMU physical
 translation bit
Date: Mon, 20 Apr 2015 09:35:33 -0700
Message-ID: <55352AD5.804@nvidia.com>
References: <1429182379-31964-1-git-send-email-vinceh@nvidia.com>
 <1429182379-31964-2-git-send-email-vinceh@nvidia.com>
 <CAAVeFuL10UidtE4_Y2mYEYpWjDqXn-FQF3zJQv2eQDqg_QTJ1Q@mail.gmail.com>
 <55312257.8000606@nvidia.com>
 <CAAVeFuKSY9AvtmjkVY7CApMex3Gq5L5cQ=suaERY5-gtAYai6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuKSY9AvtmjkVY7CApMex3Gq5L5cQ=suaERY5-gtAYai6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ck9uIDA0LzIwLzIwMTUgMTI6MzcgQU0sIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IEkgZG9u
J3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG9uIHRoaXMgLSB0aGUgYWR2YW50YWdlIG9mIGEgYml0
IG1hc2sKPiBvdmVyIGEgYml0IGluZGV4IGlzIHRoYXQgaXQgYXQgbGVhc3QgZ2l2ZXMgdXMgdGhl
IG9wdGlvbiBvZiBub3QgaGF2aW5nCj4gYSBNTVUgdHJhbnNsYXRpb24gYml0IGF0IGFsbCAobWFz
ayA9PSAwKSB3aGVyZWFzIGEgYml0IGluZGV4IG9mIDAgd2lsbAo+IHNldC91bnNldCB0aGUgZmly
c3QgYml0Lgo+Cj4gTm90IHRoYXQgd2UgbmVlZCB0aGlzIGZvciBub3csIGJ1dCBrZWVwaW5nIHRo
YXQgcG9zc2liaWxpdHkgb3Blbgo+IGRvZXNuJ3Qgc291bmQgYmFkIGZvciB0aGUgZnV0dXJlIChu
b3RoaW5nIGd1YXJhbnRlZXMgdGhlIEdQVSB3aWxsCj4gYWx3YXlzIGJlIGJlaGluZCB0aGUgSU9N
TVUpLgoKV2Ugc2hvdWxkIG5vdCByZWx5IG9ubHkgb24gZ2xvYmFsbHkgZW5hYmxpbmcgLyBkaXNh
YmxpbmcgSU9NTVUuIFRoZSBtYXNrIAp5b3UgZGVzY3JpYmUgaXMgZ2xvYmFsLiBXZSdsbCB3YW50
IHRvICBieXBhc3MgSU9NTVUsIGJ1dCB3ZSdsbCB3YW50IHRvIApkbyB0aGF0IGluIHRoZSBtYXBw
aW5nIGNvZGUgcGF0aCBwZXIgYnVmZmVyLiBWUFIgaXMgYW4gZXhhbXBsZTogVlBSIApidWZmZXJz
IHdvdWxkIHNvbWV0aW1lcyBiZSB0b3VjaGVkIGJ5IEdQVSwgYW5kIEdQVSBuZWVkcyB0byBieXBh
c3MgCklPTU1VLiBCdXQgaW50ZXJsZWF2ZWQgd2l0aCB0aGF0IEdQVSBpcyBhbHNvIHVzaW5nIG5v
cm1hbCBidWZmZXJzIHdpdGggCklPTU1VIHRyYW5zbGF0aW9uLgoKT2YgY291cnNlLCBzb21ldGlt
ZXMgd2Ugd2FudCB0byBieXBhc3MgSU9NTVUgZ2xvYmFsbHkuIFNvIGl0J3MgZ29vZCB0byAKaGF2
ZSBhbHNvIGEgbWVjaGFuaXNtIHRvIGRpc2FibGUgSU9NTVUgZm9yIHRoZSB3aG9sZSBHUFUuCgpU
ZXJqZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
