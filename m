From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/nouveau: add a LED driver for the
	NVIDIA logo
Date: Wed, 24 Aug 2016 14:38:23 +0200
Message-ID: <CAEXux-aS1gapz1CLTnS59azKXtwFHwtikAPEny3B4AzqYv15hw@mail.gmail.com>
References: <1462319465-29090-1-git-send-email-martin.peres@free.fr>
 <20160822234257.6523-1-martin.peres@free.fr>
 <CACvgo53YUjHyE=xqYHFENG7=pOsMSpQ+x-bNszd5ENNz305t5g@mail.gmail.com>
 <3ebd3427-7b8c-00bb-acce-6624fe8b8718@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3ebd3427-7b8c-00bb-acce-6624fe8b8718-GANU6spQydw@public.gmane.org>
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
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9Db2RpbmdTdHlsZQoKIkNo
YXB0ZXIgMjA6IENvbmRpdGlvbmFsIENvbXBpbGF0aW9uIiA7KQoKMjAxNi0wOC0yNCAxNDoxMSBH
TVQrMDI6MDAgTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAZnJlZS5mcj46Cj4gT24gMjMvMDgv
MTYgMTc6NDMsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4KPj4gT24gMjMgQXVndXN0IDIwMTYgYXQg
MDA6NDIsIE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGZyZWUuZnI+IHdyb3RlOgo+Pj4KPj4+
IHYyOgo+Pj4gICAtIGd1YXJkIExFRCBmcmFtZXdvcmsgY2FsbHMgd2l0aCBpZmRlZiBDT05GSUdf
TEVEU19DTEFTUwo+Pj4KPj4gSUlSQyBrZXJuZWwgaGFzIHRoZSB0ZW5kZW5jeSBvZiB1c2luZyBz
dGF0aWMgaW5saW5lcyBpbiB0aGUgaGVhZGVycwo+PiB3aGVuIENPTkZJR19mb28gaXMgbm90IHNl
dC4gV29ydGggdXNpbmcgdGhhdCBhbmQgcmVtb3ZpbmcgdGhlIGlmZGVmCj4+IGZyb20gdGhlIHNv
dXJjZSBmaWxlID8KPgo+Cj4gT2gsIHlvdSBtZWFuLCByZS1kZWZpbmluZyB0aGUgZnVuY3Rpb25z
IEkgdXNlIGJ1dCBtYWtlIHRoZW0gZG8gbm90aGluZy4KPgo+IEhvd2V2ZXIsIEkgc2hvdWxkIGRv
IGl0IGluIHRoZSBzb3VyY2UgZmlsZSBhbmQgbm90IGluIHRoZSBoZWFkZXIgc2luY2UgSSBkbwo+
IG5vdCB3YW50IHRvIGV4cG9ydCB0aGVzZSBzeW1ib2xzIG91dHNpZGUgb2YgdGhlIG9iamVjdC4K
Pgo+IERvIHlvdSBoYXZlIGFuIGV4YW1wbGUgdG8gc2hhcmU/IEFueXdheSwgdGhpcyBzZWVtcyBs
aWtlIGEgZ29vZAo+IGNhbmRpZGF0ZSB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBpZmRlZnMuIFRo
YW5rcyEKPgo+IE1hcnRpbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
