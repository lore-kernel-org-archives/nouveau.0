From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
Date: Wed, 20 Nov 2019 13:11:52 +0100
Message-ID: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20191120120913.GE11621-3PARRvDOhMZrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
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

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowOSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6
NTg6MDBQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gb3ZlcmFsbCwgd2hhdCBJIHJl
YWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29yayBvbiB3aW5kb3dzPwo+Cj4g
U28gZG8gSSA7LSkKPgo+ID4gT3Igd2hhdCBhcmUgd2UgZG9pbmcgZGlmZmVyZW50bHkgb24gTGlu
dXggc28gdGhhdCBpdCBkb2Vzbid0IHdvcms/IElmCj4gPiBhbnlib2R5IGhhcyBhbnkgaWRlYSBv
biBob3cgd2UgY291bGQgZGlnIGludG8gdGhpcyBhbmQgZmlndXJlIGl0IG91dAo+ID4gb24gdGhp
cyBsZXZlbCwgdGhpcyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBnZXQgY2xvc2VyIHRvIHRo
ZSByb290Cj4gPiBjYXVzZT8gbm8/Cj4KPiBIYXZlIHlvdSB0cmllZCB0byB1c2UgdGhlIGFjcGlf
cmV2X292ZXJyaWRlIHBhcmFtZXRlciBpbiB5b3VyIHN5c3RlbSBhbmQKPiBkb2VzIGl0IGhhdmUg
YW55IGVmZmVjdD8KPgo+IEFsc28gZGlkIHlvdSB0cnkgdG8gdHJhY2UgdGhlIEFDUEkgX09OL19P
RkYoKSBtZXRob2RzPyBJIHRoaW5rIHRoYXQKPiBzaG91bGQgaG9wZWZ1bGx5IHJldmVhbCBzb21l
dGhpbmcuCj4KCkkgdGhpbmsgSSBkaWQgaW4gdGhlIHBhc3QgYW5kIGl0IHNlZW1lZCB0byBoYXZl
IHdvcmtlZCwgdGhlcmUgaXMganVzdApvbmUgYmlnIGlzc3VlIHdpdGggdGhpczogaXQncyBhIERl
bGwgc3BlY2lmaWMgd29ya2Fyb3VuZCBhZmFpaywgYW5kCnRoaXMgaXNzdWUgcGxhZ3VlcyBub3Qg
anVzdCBEZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3ZvCmxhcHRvcHMgYXMg
d2VsbCwgYW5kIEkndmUgaGVhcmQgYWJvdXQgdXNlcnMgaGF2aW5nIHRoZSBzYW1lIGlzc3VlcyBv
bgpBc3VzIGFuZCBNU0kgbGFwdG9wcyBhcyB3ZWxsLgoKSSB3aWxsIHNwZW5kIHNvbWUgdGltZSB0
byBjb2xsZWN0IGFsbCB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uLApjcmVhdGUgYSBidWcgdG8g
cHV0IGl0IGFsbCBpbiB0aGVyZSBhbmQgc2VuZCBvdXQgYSB2NSB3aXRoIHRoZSB1cGRhdGVkCmlu
Zm9ybWF0aW9uIGFuZCByZWZlcmVuY2VzIHRvIHRoaXMgYnVnLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
