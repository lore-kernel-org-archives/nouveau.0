From: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
Date: Thu, 21 Nov 2019 12:08:31 +0100
Message-ID: <CAJZ5v0jjwaQpYR0P0TPPTGM-1zObm7w1y4bj=7MDvPL78jOz5w@mail.gmail.com>
References: <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mika Westerberg <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Limonciello <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MDMgUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDExOjE0IEFN
IE1pa2EgV2VzdGVyYmVyZwo+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMDozNjozMVBNICswMTAwLCBLYXJvbCBIZXJi
c3Qgd3JvdGU6Cj4gPiA+IHdpdGggdGhlIGJyYW5jaCBhbmQgcGF0Y2ggYXBwbGllZDoKPiA+ID4g
aHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC8wM2M0YzgxNDFi
MGZhMjkyZDc4MWJhZGZhMTg2NDc5ZS9yYXcvNWM2MjY0MGFmYmM1N2Q2ZTY5ZWE5MjRjMzM4YmQy
ODM2ZTc3MGQwMi9naXN0ZmlsZTEudHh0Cj4gPgo+ID4gVGhhbmtzIGZvciB0ZXN0aW5nLiBUb28g
YmFkIGl0IGRpZCBub3QgaGVscCA6KCBJIHN1cHBvc2UgdGhlcmUgaXMgbm8KPiA+IGNoYW5nZSBp
ZiB5b3UgaW5jcmVhc2UgdGhlIGRlbGF5IHRvIHNheSAxcz8KPgo+IFdlbGwsIGxvb2sgYXQgdGhl
IG9yaWdpbmFsIHBhdGNoIGluIHRoaXMgdGhyZWFkLgo+Cj4gV2hhdCBpdCBkb2VzIGlzIHRvIHBy
ZXZlbnQgdGhlIGRldmljZSAoR1BVIGluIHRoaXMgcGFydGljdWxhciBjYXNlKQo+IGZyb20gZ29p
bmcgaW50byBhIFBDSSBsb3ctcG93ZXIgc3RhdGUgYmVmb3JlIGludm9raW5nIEFNTCB0byBwb3dl
ciBpdAo+IGRvd24gKHRoZSBBTUwgaXMgc3RpbGwgaW52b2tlZCBhZnRlciB0aGlzIHBhdGNoIEFG
QUlDUyksIHNvIHdoeSB3b3VsZAo+IHRoYXQgaGF2ZSBhbnl0aGluZyB0byBkbyB3aXRoIHRoZSBk
ZWxheXM/Cj4KPiBUaGUgb25seSByZWFzb24gd291bGQgYmUgdGhlIEFNTCBydW5uaW5nIHRvbyBl
YXJseSwgYnV0IHRoYXQgZG9lc24ndAo+IHNlZW0gbGlrZWx5LiAgSU1PIG1vcmUgbGlrZWx5IGlz
IHRoYXQgdGhlIEFNTCBkb2VzIHNvbWV0aGluZyB3aGljaAo+IGNhbm5vdCBiZSBkb25lIHRvIGEg
ZGV2aWNlIGluIGEgUENJIGxvdy1wb3dlciBzdGF0ZS4KCkJUVywgSSdtIHdvbmRlcmluZyBpZiBh
bnlvbmUgaGFzIHRyaWVkIHRvIHNraXAgdGhlIEFNTCBpbnN0ZWFkIG9mCnNraXBwaW5nIHRoZSBQ
Q0kgUE0gaW4gdGhpcyBjYXNlIChhcyBvZiA1LjQtcmMgdGhhdCB3b3VsZCBiZSBhIHNpbWlsYXIK
cGF0Y2ggdG8gc2tpcCB0aGUgaW52b2NhdGlvbnMgb2YKX19wY2lfc3RhcnQvY29tcGxldGVfcG93
ZXJfdHJhbnNpdGlvbigpIGluIHBjaV9zZXRfcG93ZXJfc3RhdGUoKSBmb3IKdGhlIGFmZmVjdGVk
IGRldmljZSkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
