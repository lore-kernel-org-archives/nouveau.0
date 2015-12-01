From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: NV50 compute support questions
Date: Tue, 1 Dec 2015 09:19:25 +0100
Message-ID: <565D580D.1050908@redhat.com>
References: <564EF7CA.4090809@redhat.com> <564F452A.1010206@gmail.com>
 <5655C92E.5010605@redhat.com> <5656C5F1.2000406@gmail.com>
 <5656F958.1030201@redhat.com> <56570087.80800@gmail.com>
 <565C4EAD.8030508@redhat.com>
 <CAKb7UvjviUPdMCMrmPCuKy65WkyTz7ehNKoxa0myFbQftcc5mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjviUPdMCMrmPCuKy65WkyTz7ehNKoxa0myFbQftcc5mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

SGksCgpPbiAzMC0xMS0xNSAyMDowMywgSWxpYSBNaXJraW4gd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MzAsIDIwMTUgYXQgODoyNyBBTSwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyNi0xMS0xNSAxMzo1MiwgU2FtdWVsIFBpdG9pc2V0IHdy
b3RlOgo+Pgo+PiA8c25pcD4KPj4KPj4+PiBJIGRvIG5vdCBoYXZlIGEgR0sxMDYsIEkndmUgYSBH
SzIwOCwgYW5kIElJUkMgdGhhdCBvbmUgaXMga25vd24gdG8gbm90Cj4+Pj4gd29yaywKPj4+PiBJ
IGd1ZXNzIEkgY2FuIGdpdmUgaXQgYSB0cnkuCj4+Pgo+Pj4KPj4+IENvbXB1dGUgc3VwcG9ydCBp
cyBub3Qgc3VwcG9ydGVkIG9uIEdLMTEwKywgeWVhaC4uLgo+Pj4KPj4+IElmIHlvdSBwcm92aWRl
IG1lIGEgTU1UIHRyYWNlIG9mLCBmb3IgZXhhbXBsZSwgdmVjdG9yQWRkIGZyb20gdGhlIENVREEK
Pj4+IHNhbXBsZXMgSSBjb3VsZCBoYXZlIGEgbG9vay4KPj4KPj4KPj4gT2ssIGhlcmUgaXMgYSBN
TVQgdHJhY2Ugb2YgdmVjdG9yQWRkOgo+Pgo+PiBodHRwczovL2ZlZG9yYXBlb3BsZS5vcmcvfmp3
cmRlZ29lZGUvdmVjdG9yQWRkLmxvZy5nego+Cj4gWW91IGRvbid0IGhhdmUgcGVybWlzc2lvbiB0
byBhY2Nlc3MgL35qd3JkZWdvZWRlL3ZlY3RvckFkZC5sb2cuZ3ogb24KPiB0aGlzIHNlcnZlci4K
Pgo+IFVuZm9ydHVuYXRlbHkgdmFsZ3JpbmQgY3JlYXRlcyBmaWxlcyB3aXRoIG9nLXJ3eCwgYW5k
IHRoZSB2YXJpb3VzCj4gdG9vbHMgbGlrZSBnemlwIGFuZCBzY3AgbWFpbnRhaW4gdGhvc2UgcGVy
bWlzc2lvbnMuCgpVZ2gsIEkgZGlkIG5vdCBrbm93IHRoYXQsIEknbGwgdHJ5IHRvIHJlbWVtYmVy
IHRoYXQgZm9yIHRoZSBuZXh0IHRpbWUuCgo+IFNvIHlvdSBoYXZlIHRvIG1hbnVhbGx5IGZpeCBp
dC4KCkZpeGVkLgoKUmVnYXJkcywKCkhhbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
