From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 2/2] nouveau: Do not add most bo's to the
 global bo list.
Date: Wed, 25 Feb 2015 12:05:00 -0500
Message-ID: <CAKb7UvgnB-Tvy1EFF-8ERfOFUBGCzBbPjL0Yv1TZAWRm1Be0wg@mail.gmail.com>
References: <1424768511-25156-1-git-send-email-maarten.lankhorst@ubuntu.com>
 <1424768511-25156-2-git-send-email-maarten.lankhorst@ubuntu.com>
 <CACvgo53DRfa9JkweCRVB9va7oD5RoKVM9KFkXk99rQwO=vxi0g@mail.gmail.com>
 <54EDE354.6030700@ubuntu.com>
 <CAEk2Stmr7k+Tq_JH+9iuo8iz+NouhJ8tG3RaX9vJA-FHzewBAw@mail.gmail.com>
 <54EDE51B.1070000@ubuntu.com>
 <CAEk2Stk1x86MM0x6FLFutgBGC+0ksG+VKFLoEH=z+zLGKvYyRg@mail.gmail.com>
 <54EDED9B.3000303@ubuntu.com>
 <CAEk2StmOwhMecfkNsVj7j3PbmnazNQ7CAPMs-VNvv-QtrSEmCQ@mail.gmail.com>
 <CAKb7UvhinRCVezUKwVpJR2V4hwTs+8mgQZBvEtHE0MVp7PYc9A@mail.gmail.com>
 <CAEk2St=hxYL7QTnC=7=EnAyD8Bw4KJER4Dd+9pYKYckM5m+4Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEk2St=hxYL7QTnC=7=EnAyD8Bw4KJER4Dd+9pYKYckM5m+4Jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBGZWIgMjUsIDIwMTUgYXQgMTE6NTkgQU0sIFBhdHJpY2sgQmFnZ2V0dAo8YmFnZ2V0
dC5wYXRyaWNrQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IElmIGNvZGUgbGlrZQo+Pgo+PiB4ID0gKmE7
Cj4+IHB0aHJlYWRfbXV0ZXhfbG9jayBvciB1bmxvY2sgb3IgX19tZW1vcnlfYmFycmllcigpCj4+
IHkgPSAqYTsKPj4KPj4gZG9lc24ndCBjYXVzZSBhIHRvIGdldCBsb2FkZWQgdHdpY2UsIHRoZW4g
dGhlIGNvbXBpbGVyJ3MgaW4gc2VyaW91cwo+PiB0cm91YmxlLiBCYXNpY2FsbHkgZnVuY3Rpb25z
IGxpa2UgcHRocmVhZF9tdXRleF9sb2NrIGltcGx5IHRoYXQgYWxsCj4+IG1lbW9yeSBpcyBjaGFu
Z2VkIHRvIHRoZSBjb21waWxlciwgYW5kIHRodXMgbmVlZCB0byBiZSByZWxvYWRlZC4KPj4KPiBX
ZWxsLCBJJ3ZlIHNhaWQgYmVmb3JlIGFuZCBJIG1pZ2h0IGJlIGFsb25lLCBidXQgSSBkaXNhZ3Jl
ZSB3aXRoIHlvdS4gVGhlCj4gY29tcGlsZXIgaXMgdW5kZXIgbm8gcmVxdWlyZW1lbnQgdG8gcmVs
b2FkICgqYSkgYmVjYXVzZSBhIGxvY2sgd2FzIGNoYW5nZWQuCj4gSXQgZG9lcywgYnV0IGl0IGRv
ZXNuJ3QgaGF2ZSB0by4gSXQncyBmaW5lIGlmIHlvdSBndXlzIGRvbid0IHdhbnQgdG8gY2hhbmdl
Cj4gaXQuIEl0IG1heSBuZXZlciBiZSBhIHByb2JsZW0gd2l0aCBnY2MuCj4KPiBUaGlzIGlzIHRo
ZSBkZWZpbml0aW9uIG9mIHB0aHJlYWRfbXV0ZXhfbG9jaygpIGluIGdsaWJjLiBUaGVyZSBhcmVu
J3QgYW55Cj4gbWFnaWMgaGludHMgdGhhdCB0aGlzIGludmFsaWRhdGVzIG1lbW9yeToKPgo+IGV4
dGVybiBpbnQgcHRocmVhZF9tdXRleF9sb2NrIChwdGhyZWFkX211dGV4X3QgKl9fbXV0ZXgpCj4g
X19USFJPV05MIF9fbm9ubnVsbCAoKDEpKTsKPgo+IFRIT1dOTCBpcyBhdHRyaWJ1dGUoKG5vdGhy
b3cpKS4KCkhtLCB0aGlzIGlzIGFjdHVhbGx5IGEgbGl0dGxlIHdvcnJ5aW5nLiBNYWFydGVuLCB0
aG91Z2h0cz8gSSB3b3VsZApoYXZlIGFzc3VtZWQgdGhlcmUnZCBiZSBhIF9fYXR0cmlidXRlX18o
KHNvbWVfbWFnaWNfdGhpbmcpKSBpbiB0aGVyZS4KCiAgLWlsaWEKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
