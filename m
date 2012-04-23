From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [Nouveau] [PATCH 4/5] drm/nv50: let applications hanging on vm
	flush to be killed
Date: Mon, 23 Apr 2012 19:30:46 +0200
Message-ID: <20120423173046.GC2886@joi.lan>
References: <1335133112-8008-4-git-send-email-marcin.slusarz@gmail.com>
	<4F958CE5.50904@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <4F958CE5.50904@free.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Martin Peres <martin.peres@free.fr>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBBcHIgMjMsIDIwMTIgYXQgMDc6MDk6NTdQTSArMDIwMCwgTWFydGluIFBlcmVzIHdy
b3RlOgo+IExlIDIzLzA0LzIwMTIgMDA6MTgsIE1hcmNpbiBTbHVzYXJ6IGEgw6ljcml0IDoKPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmNpbiBTbHVzYXJ6PG1hcmNpbi5zbHVzYXJ6QGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2dyYXBoLmMgfCAgICA1
ICsrKysrCj4gPiAgIDEgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2dy
YXBoLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2dyYXBoLmMKPiA+IGluZGV4IDY4
OTk1NDcuLmE2MTg1M2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
djUwX2dyYXBoLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZ3JhcGgu
Ywo+ID4gQEAgLTQzNSw2ICs0MzUsMTEgQEAgbnY4NF9ncmFwaF90bGJfZmx1c2goc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgaW50IGVuZ2luZSkKPiA+ICAgCQkJaWYgKCh0bXAmICA3KSA9PSAxKQo+
ID4gICAJCQkJaWRsZSA9IGZhbHNlOwo+ID4gICAJCX0KPiA+ICsKPiA+ICsJCWlmIChmYXRhbF9z
aWduYWxfcGVuZGluZyhjdXJyZW50KSkgewo+ID4gKwkJCXJldCA9IC1FUkVTVEFSVFNZUzsKPiA+
ICsJCQlicmVhazsKPiA+ICsJCX0KPiA+ICAgCX0gd2hpbGUgKCFpZGxlJiYgICEodGltZW91dCA9
IHB0aW1lci0+cmVhZChkZXYpIC0gc3RhcnQ+ICAyMDAwMDAwMDAwKSk7Cj4gPgo+ID4gICAJaWYg
KHRpbWVvdXQpIHsKPiBHb29kLCBidXQgd2hvIHNob3VsZCBzZW5kIHRoZSBraWxsIHNpZ25hbCBp
biB0aGUgZmlyc3QgcGxhY2U/Cj4gCj4gU2hvdWxkbid0IG5vdXZlYXUgZHJtIHRlcm1pbmF0ZSB0
aGUgcHJvY2VzcyhlcykgYXNzb2NpYXRlZCB3aXRoIHRoZSAKPiBjaGFubmVsIHRoYXQgZ2VuZXJh
dGVkIHRoZSBsb2NrdXAgPwoKV2VsbCwgdGhpcyBwYXRjaCBpcyBub3QgbmVjZXNzYXJ5IGZvciBn
cHUgcmVzZXQgLSBpdCdzIGp1c3QgImxldCdzIGJlIG5pY2UiIGNoYW5nZS4KQ3VycmVudGx5IGFw
cGxpY2F0aW9uIGlzIHVua2lsbGFibGUgd2hlbiBoYW5naW5nIG9uIHZtIGZsdXNoIAoKTWFyY2lu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
