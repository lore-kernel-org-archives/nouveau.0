From: Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [Mesa-dev] [RFC 0/9] Add precise/invariant semantics
	to TGSI
Date: Tue, 13 Jun 2017 02:33:50 +0200
Message-ID: <6ffa13fd-c90b-bda6-b243-13c4857346f7@vmware.com>
References: <20170611184239.7204-1-karolherbst@gmail.com>
 <6f999a01-c3db-0a38-a04c-bbb138eef46b@gmail.com>
 <8a99cdc6-c415-1423-dd1b-13a09f902288@vmware.com>
 <CAKb7UviKiLbRG+z4paq8=-6epuWtKSxty2DHw6SQ1LZ+ULQgmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviKiLbRG+z4paq8=-6epuWtKSxty2DHw6SQ1LZ+ULQgmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?Q?Nicolai_H=c3=a4hnle?= <nhaehnle-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW0gMTMuMDYuMjAxNyB1bSAwMjowNSBzY2hyaWViIElsaWEgTWlya2luOgo+IE9uIE1vbiwgSnVu
IDEyLCAyMDE3IGF0IDc6NTcgUE0sIFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUu
Y29tPiB3cm90ZToKPj4gRldJVyBzdXJlbHkgb24gbnY1MCB5b3UgY291bGQga2VlcCBhIHNpbmds
ZSBtYWQgaW5zdHJ1Y3Rpb24gZm9yIHVtYWQKPj4gKHNhZCBtYXliZSB0b28/KS4gKEknbSBhY3R1
YWxseSB3b25kZXJpbmcgaWYgdGhlIGh3IHJlYWxseSBjYW4ndCBkbwo+PiB1bmZ1c2VkIGZsb2F0
IG11bHRpcGx5K2FkZCBhcyBhIHNpbmdsZSBpbnN0cnVjdGlvbiBidXQgSSBrbm93IG5leHQgdG8K
Pj4gbm90aGluZyBhYm91dCBudmlkaWEgaHcuLi4pCj4gCj4gVGhlIGNvbXBpbGVyIHNob3VsZCBy
ZWFzc29jaWF0ZSBhIG11bCArIGFkZCBpbnRvIGEgbWFkIHdoZXJlIHBvc3NpYmxlLgo+IEluIGFj
dHVhbGl0eSwgSU1BRCBpcyBhY3R1YWxseSBzdXBlci1zbG93Li4uIGFsbGVnZWRseSBzbG93ZXIg
dGhhbgo+IElNVUwgKyBJQURELiBOb3Qgc3VyZSB3aHkuIE1heHdlbGwgYWRkZWQgYSBYTUFEIG9w
ZXJhdGlvbiB3aGljaCBpcwo+IGZhc3RlciBidXQgd2UgaGF2ZW4ndCBmaWd1cmVkIG91dCBob3cg
dG8gb3BlcmF0ZSBpdCB5ZXQuIEknbSBub3QgYXdhcmUKPiBvZiBhIG11bGFkZCB2ZXJzaW9uIG9m
IGZtYSBvbiBmZXJtaSBhbmQgbmV3ZXIgKEdMIDQuMCkuIFRoZSB0ZXNsYQo+IHNlcmllcyBkb2Vz
IGhhdmUgYSBmbG9hdGluZyBwb2ludCBtdWwrYWRkIChidXQgbm8gZm1hKS4KPiAKCkludGVyZXN0
aW5nLiByYWRlb25zIHNlZW0gdG8gYWx3YXlzIGhhdmUgYSB1bmZ1c2VkIG1hZC4gcHJlLWdjbiBw
YXJ0cwphcHBhcmVudGx5IG9ubHkgaGF2ZSBhIDMyYml0IGZtYSB3aXRoIHBhcnRzIHN1cHBvcnRp
bmcgZG91YmxlIHByZWNpc2lvbi4KVGhlIHNhbWUgcmVzdHJpY3Rpb24gaXMgc3RhdGVkIGZvciBn
Y24gcGFydHMgaW4gdGhlIGlzYSBkb2NzLCB3aGljaApvYnZpb3VzbHkgZG9lc24ndCBtYWtlIHNl
bnNlLCBidXQgSSBoYXZlIG5vIGlkZWEgaWYgdGhlIGZtYSBpcyBmdWxsIHNwZWVkLi4uCgpSb2xh
bmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
