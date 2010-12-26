From: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel patch: validate nouveau_channel_get id argument
Date: Sun, 26 Dec 2010 12:07:57 +0100
Message-ID: <AANLkTim2AvpGesxrGv8Fgr6qzwjY7N0pQe1mdKN-QUeA@mail.gmail.com>
References: <AANLkTikRCm19--tRgjAJqcLgb1f_hWcWJpRvgAqGKfQw@mail.gmail.com>
	<87r5d6yngq.fsf@riseup.net>
	<AANLkTi=cy3Mm4U3zk6-6WXBCPJXqyh4Q8SV_UOBQFNbU@mail.gmail.com>
	<AANLkTikQP2DtprBkFr0z1q5vdb=FwDLc5R-Zeuv7ypz1@mail.gmail.com>
	<87sjxlwvjr.fsf@riseup.net>
	<AANLkTin54dTRksN8JfThwS7-zi3Na+j=HdEfyxm=tav1@mail.gmail.com>
	<87oc88x0gx.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87oc88x0gx.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

MjAxMC8xMi8yNiBGcmFuY2lzY28gSmVyZXogPGN1cnJvamVyZXpAcmlzZXVwLm5ldD46Cj4gTWlj
aGVsIEhlcm1pZXIgPG1pY2hlbC5oZXJtaWVyQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4+IEZvciBt
eSBjdWx0dXJlLCB3aHkgZGlkIHlvdSBub3QgY2hhbmdlZCB0aGUgdHlwZSB0byB1aW50MzJfdCBs
aWtlIGluCj4+IG15IG9yaWdpbmFsIHBhdGNoID8KPiBBcyBJIHRvbGQgeW91IGJlZm9yZSwgdGhv
c2UgY2hhbmdlcyB3ZW50IG92ZXIgdGhlIDgwIGNvbHVtbiBsaW1pdCBzbyBJCj4ganVzdCBsZWZ0
IHRoZW0gb3V0LiDCoEkgaG9wZSB5b3UgZG9uJ3QgbWluZCwgdGhlIG1vZGlmaWVkIHBhdGNoIHNo
b3VsZCBkbwo+IHRoZSBzYW1lIHRoaW5nIGFzIHRoZSBvcmlnaW5hbCBvbmUgZm9yIGFsbCBwcmFj
dGljYWwgcHVycG9zZXMuCgpJIGRvbid0IHJlYWxseSBjYXJlIHNpbmNlIGl0IGZpeCB0aGUgaXNz
dWUsIGJ1dCBmb3IgbG9uZyB0ZXJtIEkgdGhpbmsgd2Ugc2hvdWxkCmNoYW5nZSB0aGVzZXMgdG8g
dWludDMyX3QKCj4+IEFsc28gbG9va2luZyBhdCBpbmNsdWRlL2RybS9ub3V2ZWF1X2RybS5oLCBJ
IHNlZSBzb21lIGluY29uc2lzdGFudAo+PiB0eXBlIGZvciBjaGFubmVsIGluIGlvY3RscyBzdHJ1
Y3R1cmVzID8KPj4KPiBSaWdodCwgZXhwbGljaXRseSBzaXplZCBpbnRlZ2VycyBhcmUgdXN1YWxs
eSB0aGUgcHJlZmVycmVkIGNob2ljZSBpbiB0aGUKPiBJT0NUTCBBUEkuCgpDaGFuZ2luZyB0aGVt
IHRvIHVpbnQzMl90IHdvdWxkIHJlcXVpcmUgYW4gUEFUQ0hMRVZFTCsrIGV2ZW4gaWYgdGhlCnZh
bGlkIHZhbHVlcyB3aGVyZSB1aW50MzJfdCA/PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQo=
