From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 18:10:27 +0200
Message-ID: <20170714161027.5htn5jlswvfgphzw@hirez.programming.kicks-ass.net>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de>
 <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de>
 <20170714155047.2zs3ps7cmnyvvwgb@hirez.programming.kicks-ass.net>
 <1500047898.5763.25.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1500047898.5763.25.camel@gmx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Galbraith <efault@gmx.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, jeyu@kernel.org
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgMDU6NTg6MThQTSArMDIwMCwgTWlrZSBHYWxicmFpdGgg
d3JvdGU6Cj4gT24gRnJpLCAyMDE3LTA3LTE0IGF0IDE3OjUwICswMjAwLCBQZXRlciBaaWpsc3Ry
YSB3cm90ZToKCj4gPiBVcmdoLCBpcyBmb3Igc29tZSBteXN0ZXJpb3VzIHJlYXNvbiB0aGUgX19i
dWdfdGFibGUgc2VjdGlvbiBvZiBtb2R1bGVzCj4gPiBlbmRpbmcgdXAgaW4gUk8gbWVtb3J5Pwo+
ID4gCj4gPiBJIGZvcmV2ZXIgZ2V0IGxvc3QgaW4gdGhhdCBsaW5rIG1hZ2ljIDovCj4gCj4gKzEK
PiAKPiBkcm0ua28KPiDCoDIwIF9fYnVnX3RhYmxlwqDCoMKgMDAwMDA2MzDCoMKgMDAwMDAwMDAw
MDAwMDAwMMKgwqAwMDAwMDAwMDAwMDAwMDAwwqDCoDAwMDRiZmYzwqDCoDIqKjAKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBDT05URU5UUywgQUxMT0MsIExPQUQsIFJFTE9D
LCBSRUFET05MWSwgREFUQQo+IHZtbGludXgKPiAgMTUgX19idWdfdGFibGUgICAwMDAwYmE4NCAg
ZmZmZmZmZmY4MWFmMjZjMCAgMDAwMDAwMDAwMWFmMjZjMCAgMDBjZjI2YzAgIDIqKjAKPiAgICAg
ICAgICAgICAgICAgICBDT05URU5UUywgQUxMT0MsIExPQUQsIFJFQURPTkxZLCBEQVRBCj4gCj4g
RGFuZ2VkIGlmIEkga25vdy4uLiB1bSB1bSBSRUxPQyBidXNpbmVzcyBtdWNrcyB0aGluZ3MgdXA/
CgpBcmdoLCBpdCBzaG91bGRuJ3QgYmUgUkVBRE9OTFkgZm9yIHZtbGludXggZWl0aGVyLCBidXQg
YXBwYXJlbnRseSB0aGF0CmlzIHdvcmtpbmcgZm9yIG15c3RlcmlvdXMgcmVhc29ucy4KClNvbWUg
YXJjaGl0ZWN0dXJlcyB3ZXJlIGluIGZhY3QgY29tcGxhaW5pbmcgdGhhdCBJIGJyb2tlIHRoYXQs
IGFuZCBoZW5jZQpwYXRjaDoKCmI1ZWZmZDM4MTVjYyAoImRlYnVnOiBGaXggX19idWdfdGFibGVb
XSBpbiBhcmNoIGxpbmtlciBzY3JpcHRzIikKCkkgdGhpbmsgd2UgbmVlZCBwcm9mZXNzaW9uYWwg
aGVscCB3aXRoIHRoaXMgbGlua2luZyBzdHVmZiwgYnV0IHdobyB0bwphc2s/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
