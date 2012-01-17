From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: "enable ctxprog xfer only when we need it to save
 power" introduces big performance regression
Date: Tue, 17 Jan 2012 22:17:38 +0100
Message-ID: <4F15E572.5020003@free.fr>
References: <20111029170801.GA3219@joi.lan> <20111029172923.GA3110@joi.lan>
	<20111029190938.GA3105@joi.lan> <20111109221009.GD3402@joi.lan>
	<4EBB78F4.2020902@ensi-bourges.fr> <20111228213902.GA4275@joi.lan>
	<4EFBAD2B.8080207@ensi-bourges.fr>
	<20111229013850.GA4076@joi.lan> <4F10A18E.1030908@free.fr>
	<1326833749.1536.11.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326833749.1536.11.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

TGUgMTcvMDEvMjAxMiAyMTo1NSwgTHVjYXMgU3RhY2ggYSDDqWNyaXQgOgo+IElzbid0IGl0IHBv
c3NpYmxlIHRoYXQgdGhlIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gc2VlbiB3aXRoIHhmZXIgCj4g
ZGlzYWJsZWQgYnkgZGVmYXVsdCBpcyBjYXVzZWQgYnkgc2xvdyBtZW1vcnkgY2xvY2sgc3BlZWQ/
IE1hcnRpbiwgeW91IAo+IHNhdyBvbmx5IGEgMSUgcGVyZm9ybWFuY2UgZHJvcCBvbiB5b3VyIDg2
MDAgd2hpY2ggaXMgcnVubmluZyB3aXRoIGZ1bGwgCj4gc3BlZWQgYnkgZGVmYXVsdC4gTWFyY2lu
cyBudjkyIGlzIGxpa2VseSBydW5uaW5nIGF0IGEgbXVjaCBsb3dlciBjbG9jayAKPiBzcGVlZC4g
SXQgd291bGQgYmUgbmljZSB0byBrbm93IGlmIHRoZSBwZXJmIHJlZ3Jlc3Npb24gaXMgc3RpbGwg
YXMgYmlnIAo+IHdoZW4gcnVubmluZyB3aXRoIGZ1bGwgc3BlZWQuIFdlIGNvdWxkIHN0b3AgY2Fy
aW5nIGFib3V0IHRoaXMgd2hlbiB0aGUgCj4gcGVyZiByZWdyZXNzaW9uIGlzIG5vdCBvYnNlcnZh
YmxlIGluIHRoZSBoaWdoZXN0IHBlcmYgbGV2ZWwuCldlbGwsIGFjdHVhbGx5LCB0aGUgcGVyZm9y
bWFuY2UgaGl0IHNob3VsZCBiZSBoaWdoZXIgd2hlbiBydW5uaW5nIGF0IGEgCmhpZ2hlc3QgbWVt
b3J5IGNsb2NrIHNpbmNlIHdlIGNvbnRleHQgc3dpdGNoIG1vcmUgb2Z0ZW4gKHRoZXJlIGlzIG5v
IApsb2dpYyBoZXJlLCBqdXN0IGEgcGVyc29uYWwgZXhwZXJpZW5jZSkuCgpBbnl3YXksIEkgdHJp
ZWQgYWdhaW4gbGFzdCB3ZWVrIGVuZCBhdCBldmVyeSBwb3NzaWJsZSBzcGVlZCBhbmQgSSAKaGF2
ZW4ndCBiZWVuIGFibGUgdG8gc3BvdCBhbnkgcGVyZm9ybWFuY2UgaGl0ICphdCBhbGwqLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
