From: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
Date: Wed, 20 Nov 2019 13:06:26 +0100
Message-ID: <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mika Westerberg <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Limonciello <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NDggUE0gUmFm
YWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IE5vdiAyMCwgMjAxOSBhdCAxMjoyMiBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3Rl
cmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkg
YXQgMTE6NTI6MjJBTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gT24g
V2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6MTggQU0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA+ID4gPG1p
a2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KCltjdXRdCgo+ID4gPiA+
Cj4gPiA+ID4gT2gsIHNvIGRvZXMgaXQgbG9vayBsaWtlIHdlIGFyZSB0cnlpbmcgdG8gd29yayBh
cm91bmQgQU1MIHRoYXQgdHJpZWQKPiA+ID4gPiB0byB3b3JrIGFyb3VuZCBzb21lIHByb2JsZW1h
dGljIGJlaGF2aW9yIGluIExpbnV4IGF0IG9uZSBwb2ludD8KPiA+ID4KPiA+ID4gWWVzLCBpdCBs
b29rcyBsaWtlIHNvIGlmIEkgcmVhZCB0aGUgQVNMIHJpZ2h0Lgo+ID4KPiA+IE9LLCBzbyB0aGF0
IHdvdWxkIGNhbGwgZm9yIGEgRE1JLWJhc2VkIHF1aXJrIGFzIHRoZSByZWFsIGNhdXNlIGZvciB0
aGUKPiA+IGlzc3VlIHNlZW1zIHRvIGJlIHRoZSBBTUwgaW4gcXVlc3Rpb24sIHdoaWNoIG1lYW5z
IGEgZmlybXdhcmUgcHJvYmxlbS4KPiA+Cj4KPiBBbmQgSSBkaXNhZ3JlZSBhcyB0aGlzIGlzIGEg
bGludXggc3BlY2lmaWMgd29ya2Fyb3VuZCBhbmQgd2luZG93cyBnb2VzCj4gdGhhdCBwYXRoIGFu
ZCBzdWNjZWVkcy4gVGhpcyBmaXJtd2FyZSBiYXNlZCB3b3JrYXJvdW5kIHdhcyBhZGRlZCwKPiBi
ZWNhdXNlIGl0IGJyb2tlIG9uIExpbnV4LgoKQXBwYXJlbnRseSBzbyBhdCB0aGUgdGltZSBpdCB3
YXMgYWRkZWQsIGJ1dCB3b3VsZCBpdCBzdGlsbCBicmVhayBhZnRlcgp0aGUga2VybmVsIGNoYW5n
ZXMgbWFkZSBzaW5jZSB0aGVuPwoKTW9yZW92ZXIsIGhhcyBpdCBub3QgYmVjb21lIGhhcm1mdWwg
bm93PyAgSU9XLCB3b3VsZG4ndCBpdCB3b3JrIGFmdGVyCnJlbW92aW5nIHRoZSAiTGludXggd29y
a2Fyb3VuZCIgZnJvbSB0aGUgQU1MPwoKVGhlIG9ubHkgd2F5IHRvIHZlcmlmeSB0aGF0IEkgY2Fu
IHNlZSB3b3VsZCBiZSB0byBydW4gdGhlIHN5c3RlbSB3aXRoCmN1c3RvbSBBQ1BJIHRhYmxlcyB3
aXRob3V0IHRoZSAiTGludXggd29ya2Fyb3VuZCIgaW4gdGhlIEFNTCBpbgpxdWVzdGlvbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
