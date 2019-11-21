From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Thu, 21 Nov 2019 12:03:52 +0100
Message-ID: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191121101423.GQ11621@lahna.fi.intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Mario Limonciello <Mario.Limonciello@dell.com>, Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MTQgQU0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEw
OjM2OjMxUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IHdpdGggdGhlIGJyYW5jaCBh
bmQgcGF0Y2ggYXBwbGllZDoKPiA+IGh0dHBzOi8vZ2lzdC5naXRodWJ1c2VyY29udGVudC5jb20v
a2Fyb2xoZXJic3QvMDNjNGM4MTQxYjBmYTI5MmQ3ODFiYWRmYTE4NjQ3OWUvcmF3LzVjNjI2NDBh
ZmJjNTdkNmU2OWVhOTI0YzMzOGJkMjgzNmU3NzBkMDIvZ2lzdGZpbGUxLnR4dAo+Cj4gVGhhbmtz
IGZvciB0ZXN0aW5nLiBUb28gYmFkIGl0IGRpZCBub3QgaGVscCA6KCBJIHN1cHBvc2UgdGhlcmUg
aXMgbm8KPiBjaGFuZ2UgaWYgeW91IGluY3JlYXNlIHRoZSBkZWxheSB0byBzYXkgMXM/CgpXZWxs
LCBsb29rIGF0IHRoZSBvcmlnaW5hbCBwYXRjaCBpbiB0aGlzIHRocmVhZC4KCldoYXQgaXQgZG9l
cyBpcyB0byBwcmV2ZW50IHRoZSBkZXZpY2UgKEdQVSBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSkK
ZnJvbSBnb2luZyBpbnRvIGEgUENJIGxvdy1wb3dlciBzdGF0ZSBiZWZvcmUgaW52b2tpbmcgQU1M
IHRvIHBvd2VyIGl0CmRvd24gKHRoZSBBTUwgaXMgc3RpbGwgaW52b2tlZCBhZnRlciB0aGlzIHBh
dGNoIEFGQUlDUyksIHNvIHdoeSB3b3VsZAp0aGF0IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCB0
aGUgZGVsYXlzPwoKVGhlIG9ubHkgcmVhc29uIHdvdWxkIGJlIHRoZSBBTUwgcnVubmluZyB0b28g
ZWFybHksIGJ1dCB0aGF0IGRvZXNuJ3QKc2VlbSBsaWtlbHkuICBJTU8gbW9yZSBsaWtlbHkgaXMg
dGhhdCB0aGUgQU1MIGRvZXMgc29tZXRoaW5nIHdoaWNoCmNhbm5vdCBiZSBkb25lIHRvIGEgZGV2
aWNlIGluIGEgUENJIGxvdy1wb3dlciBzdGF0ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
