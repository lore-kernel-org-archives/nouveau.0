From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Revert "drm/nouveau/fifo/gk104: kick channels when
 deactivating them"
Date: Fri, 14 Aug 2015 12:49:17 +0900
Message-ID: <CAAVeFu+mjG6yHY5+_bLaoRxSf7B668_r92ZPfd-z0jOLF9AHSg@mail.gmail.com>
References: <1439353058-10001-1-git-send-email-acourbot@nvidia.com>
 <20150812060052.GA4242@afzalpc>
 <CAAVeFuK7Hk4TN3bPECFP2WVamKHj6xfO5cejLU_xeDts-DxVBg@mail.gmail.com>
 <20150812073727.GA5630@afzalpc>
 <CAAVeFuLNpvLHeWiucULJ=AEz0moX3PLvVpnYMyvkYhbL+FuSZg@mail.gmail.com>
 <20150812095907.GA3030@afzalpc>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150812095907.GA3030@afzalpc>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Afzal Mohammed <afzal.mohd.ma@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Eric Biggers <ebiggers3@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBBdWcgMTIsIDIwMTUgYXQgNjo1OSBQTSwgQWZ6YWwgTW9oYW1tZWQgPGFmemFsLm1v
aGQubWFAZ21haWwuY29tPiB3cm90ZToKPiBIaSwKPgo+IE9uIFdlZCwgQXVnIDEyLCAyMDE1IGF0
IDA0OjQwOjU3UE0gKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+Cj4+IEdyZWF0LCB0
aGFua3MuIEFyZSB5b3UgYWxzbyBvbiBhbiBvcHRpbXVzIGNvbmZpZ3VyYXRpb24gd2l0aCB0aGUK
Pj4gTlZJRElBIGNhcmQgYmVpbmcgdGhlIHNlY29uZGFyeSBHUFU/Cj4KPiBTcGVjIHNheXMgZ3Jh
cGhpYyBwcm9jZXNzb3IgaXMgTlZJRElBIEdlRm9yY2UgTlYxNFAtR1YyIEdUNDBNLCBzeXN0ZW0K
PiBpcyBMZW5vdm8gRTQzMSBsYXB0b3AuCj4KPiBJIGFtIGEgc3RyYW5nZXIgaGVyZSwgc3RhcnRl
ZCBLZXJuZWwgam91cm5leSB0b3dhcmRzIG5vcnRoIGFuZCByZWFjaGVkCj4gc291dGggc2luY2Ug
dGhlIHN5c3RlbSB3YXNuJ3QgYm9vdGluZyA6KSwgZG9uJ3Qga25vdyBob3cgdG8gZmluZCBpdCBp
cwo+IGFuIG9wdGltdXMgY29uZmlndXJhdGlvbiwgaWYgYWJvdmUgZGV0YWlscyBhcmVuJ3QgZW5v
dWdoLCBsZXQgbWUga25vdwo+IGhvdyB0byBmaW5kIG91dC4KClRoYW5rcyBmb3IgdGhlIGRldGFp
bHMhCgpBbiBvcHRpbXVzIGNvbmZpZ3VyYXRpb24gbWVhbnMgdGhhdCBkaXNwbGF5IGFuZCBiYXNp
YyBhY2NlbGVyYXRpb24gaXMKcHJvdmlkZWQgYnkgYW4gaW50ZWdyYXRlZCBJbnRlbCBncmFwaGlj
cywgYW5kIHRoZSBOVklESUEgR1BVIGNhbiBiZQpzd2l0Y2hlZCBvbi9vZmYgZHluYW1pY2FsbHkg
dG8gcHJvdmlkZSBtb3JlIHBvd2VyIHdoZW4gbmVlZGVkLgoKQWNjb3JkaW5nIHRvIHlvdXIgbGFw
dG9wIHJlZmVyZW5jZSwgdGhpcyBzZWVtcyB0byBiZSB0aGUga2luZCBvZgpjb25maWd1cmF0aW9u
IHlvdSBoYXZlLiBJdCBpcyByZWxldmFudCBiZWNhdXNlIHRoaXMgaXNzdWUgc2VlbXMgdG8KaGFw
cGVuIHdoZW4gdGhlIE5WSURJQSBHUFUgaXMgc3dpdGNoZWQgb2ZmIGR1cmluZyBib290LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
