From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Mon, 21 Oct 2019 14:00:46 +0200
Message-ID: <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
References: <20191016144449.24646-1-kherbst@redhat.com>
 <20191021114017.GY2819@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191021114017.GY2819@lahna.fi.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mika Westerberg <mika.westerberg@intel.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTo0MCBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gSGkgS2Fyb2wsCj4KPiBTb3JyeSBmb3IgY29t
bWVudGluZyBsYXRlLCBJIGp1c3QgY2FtZSBiYWNrIGZyb20gdmFjYXRpb24uCj4KPiBPbiBXZWQs
IE9jdCAxNiwgMjAxOSBhdCAwNDo0NDo0OVBNICswMjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4g
PiBGaXhlcyBzdGF0ZSB0cmFuc2l0aW9ucyBvZiBOdmlkaWEgUGFzY2FsIEdQVXMgZnJvbSBEM2Nv
bGQgaW50byBoaWdoZXIgZGV2aWNlCj4gPiBzdGF0ZXMuCj4gPgo+ID4gdjI6IGNvbnZlcnQgdG8g
cGNpX2RldiBxdWlyawo+ID4gICAgIHB1dCBhIHByb3BlciB0ZWNobmljYWwgZXhwbGFuYXRpb24g
b2YgdGhlIGlzc3VlIGFzIGEgaW4tY29kZSBjb21tZW50Cj4gPiB2MzogZGlzYWJsZSBpdCBvbmx5
IGZvciBjZXJ0YWluIGNvbWJpbmF0aW9ucyBvZiBpbnRlbCBhbmQgbnZpZGlhIGhhcmR3YXJlCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4g
PiBDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiA+IENjOiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gQ2M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3
eXNvY2tpLm5ldD4KPiA+IENjOiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BpbnRl
bC5jb20+Cj4gPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4LXBt
QHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9wY2kvcGNpLmMgICAgfCAxMSArKysrKysrKysrCj4gPiAgZHJpdmVycy9wY2kvcXVpcmtzLmMg
fCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Cj4gSSBt
YXkgYmUgbWlzc2luZyBzb21ldGhpbmcgYnV0IHdoeSB5b3UgY2FuJ3QgZG8gdGhpcyBpbiB0aGUg
bm91dmVhdQo+IGRyaXZlciBpdHNlbGY/CgpXaGF0IGRvIHlvdSBtZWFuIHByZWNpc2VseT8gTW92
ZSB0aGUgcXVpcmsgaW50byBub3V2ZWF1LCBidXQga2VlcCB0aGUKY2hhbmdlcyB0byBwY2kgY29y
ZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
