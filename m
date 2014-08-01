From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 09/19] drm/radeon: handle lockup in delayed work, v2
Date: Fri, 01 Aug 2014 19:46:17 +0200
Message-ID: <53DBD269.80807@canonical.com>
References: <20140731153245.15061.63023.stgit@patser>
 <20140731153342.15061.54264.stgit@patser> <53DBC1EC.1010001@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53DBC1EC.1010001@amd.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, airlied@linux.ie
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com
List-Id: nouveau.vger.kernel.org

CgpPbiAwMS0wOC0xNCAxODozNSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAzMS4wNy4y
MDE0IHVtIDE3OjMzIHNjaHJpZWIgTWFhcnRlbiBMYW5raG9yc3Q6Cj4+IFNpZ25lZC1vZmYtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBjYW5vbmljYWwuY29tPgo+PiAt
LS0KPj4gVjEgaGFkIGEgbmFzdHkgYnVnIGJyZWFraW5nIGdwdSBsb2NrdXAgcmVjb3ZlcnkuIFRo
ZSBmaXggaXMgbm90Cj4+IGFsbG93aW5nIHJhZGVvbl9mZW5jZV9kcml2ZXJfY2hlY2tfbG9ja3Vw
IHRvIHRha2UgZXhjbHVzaXZlX2xvY2ssCj4+IGFuZCBraWxsIGl0IGR1cmluZyBsb2NrdXAgcmVj
b3ZlcnkgaW5zdGVhZC4KPiAKPiBUaGF0IGxvb2tzIGxpa2UgdGhlIGRlbGF5ZWQgd29yayBzdGFy
dHMgcnVubmluZyBhcyBzb29uIGFzIHdlIHN1Ym1pdCBhIGZlbmNlLCBhbmQgbm90IHdoZW4gaXQn
cyBuZWVkZWQgZm9yIHdhaXRpbmcuCj4gCj4gU2luY2UgaXQncyBhIGJhY2t1cCBmb3IgZmFpbGlu
ZyBJUlFzIEkgd291bGQgcmF0aGVyIHB1dCBpdCBpbnRvIHJhZGVvbl9pcnFfa21zLmMgYW5kIHN0
YXJ0L3N0b3AgaXQgd2hlbiB0aGUgSVJRcyBhcmUgc3RhcnRlZC9zdG9wZWQuCgpUaGUgZGVsYXll
ZCB3b3JrIGlzIG5vdCBqdXN0IGZvciBmYWlsaW5nIGlycSdzLCBpdCdzIGFsc28gdGhlIGhhbmRs
ZXIgdGhhdCdzIHVzZWQgdG8gZGV0ZWN0IGxvY2t1cHMsIHdoaWNoIGlzIHdoeSBJIHRyaWdnZXIg
YWZ0ZXIgcHJvY2Vzc2luZyBmZW5jZXMsIGFuZCByZXNldCB0aGUgdGltZXIgYWZ0ZXIgcHJvY2Vz
c2luZy4KClNwZWNpZmljYWxseSB3aGF0IGhhcHBlbmVkIHdhcyB0aGlzIHNjZW5hcmlvOgoKLSBs
b2NrIHVwIG9jY3VycwotIHdyaXRlIGxvY2sgdGFrZW4gYnkgZ3B1X3Jlc2V0Ci0gZGVsYXllZCB3
b3JrIHJ1bnMsIHRyaWVzIHRvIGFjcXVpcmUgcmVhZCBsb2NrLCBibG9ja3MKLSBncHVfcmVzZXQg
dHJpZXMgdG8gY2FuY2VsIGRlbGF5ZWQgd29yayBzeW5jaHJvbm91c2x5Ci0gaGFzIHRvIHdhaXQg
Zm9yIGRlbGF5ZWQgd29yayB0byBmaW5pc2ggLT4gZGVhZGxvY2sKCn5NYWFydGVuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
