From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Revert "drm/nouveau/fifo/gk104: kick channels when
 deactivating them"
Date: Mon, 17 Aug 2015 12:05:50 +0900
Message-ID: <CAAVeFuJNdKNA0+e1Nw-O1ZWOab9Cex1d0eZwtPzA_du3S1vN+w@mail.gmail.com>
References: <1439353058-10001-1-git-send-email-acourbot@nvidia.com>
 <20150812060052.GA4242@afzalpc>
 <CAAVeFuK7Hk4TN3bPECFP2WVamKHj6xfO5cejLU_xeDts-DxVBg@mail.gmail.com>
 <20150812073727.GA5630@afzalpc>
 <CAAVeFuLNpvLHeWiucULJ=AEz0moX3PLvVpnYMyvkYhbL+FuSZg@mail.gmail.com>
 <20150812095907.GA3030@afzalpc>
 <CAAVeFu+mjG6yHY5+_bLaoRxSf7B668_r92ZPfd-z0jOLF9AHSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFu+mjG6yHY5+_bLaoRxSf7B668_r92ZPfd-z0jOLF9AHSg@mail.gmail.com>
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

UGF0Y2ggaGFzIGxhbmRlZCBpbiAtcmM3LCB0aGFua3MgRGF2aWQhCgpPbiBGcmksIEF1ZyAxNCwg
MjAxNSBhdCAxMjo0OSBQTSwgQWxleGFuZHJlIENvdXJib3QgPGdudXJvdUBnbWFpbC5jb20+IHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDEyLCAyMDE1IGF0IDY6NTkgUE0sIEFmemFsIE1vaGFtbWVkIDxh
ZnphbC5tb2hkLm1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiBXZWQsIEF1ZyAx
MiwgMjAxNSBhdCAwNDo0MDo1N1BNICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToKPj4K
Pj4+IEdyZWF0LCB0aGFua3MuIEFyZSB5b3UgYWxzbyBvbiBhbiBvcHRpbXVzIGNvbmZpZ3VyYXRp
b24gd2l0aCB0aGUKPj4+IE5WSURJQSBjYXJkIGJlaW5nIHRoZSBzZWNvbmRhcnkgR1BVPwo+Pgo+
PiBTcGVjIHNheXMgZ3JhcGhpYyBwcm9jZXNzb3IgaXMgTlZJRElBIEdlRm9yY2UgTlYxNFAtR1Yy
IEdUNDBNLCBzeXN0ZW0KPj4gaXMgTGVub3ZvIEU0MzEgbGFwdG9wLgo+Pgo+PiBJIGFtIGEgc3Ry
YW5nZXIgaGVyZSwgc3RhcnRlZCBLZXJuZWwgam91cm5leSB0b3dhcmRzIG5vcnRoIGFuZCByZWFj
aGVkCj4+IHNvdXRoIHNpbmNlIHRoZSBzeXN0ZW0gd2Fzbid0IGJvb3RpbmcgOiksIGRvbid0IGtu
b3cgaG93IHRvIGZpbmQgaXQgaXMKPj4gYW4gb3B0aW11cyBjb25maWd1cmF0aW9uLCBpZiBhYm92
ZSBkZXRhaWxzIGFyZW4ndCBlbm91Z2gsIGxldCBtZSBrbm93Cj4+IGhvdyB0byBmaW5kIG91dC4K
Pgo+IFRoYW5rcyBmb3IgdGhlIGRldGFpbHMhCj4KPiBBbiBvcHRpbXVzIGNvbmZpZ3VyYXRpb24g
bWVhbnMgdGhhdCBkaXNwbGF5IGFuZCBiYXNpYyBhY2NlbGVyYXRpb24gaXMKPiBwcm92aWRlZCBi
eSBhbiBpbnRlZ3JhdGVkIEludGVsIGdyYXBoaWNzLCBhbmQgdGhlIE5WSURJQSBHUFUgY2FuIGJl
Cj4gc3dpdGNoZWQgb24vb2ZmIGR5bmFtaWNhbGx5IHRvIHByb3ZpZGUgbW9yZSBwb3dlciB3aGVu
IG5lZWRlZC4KPgo+IEFjY29yZGluZyB0byB5b3VyIGxhcHRvcCByZWZlcmVuY2UsIHRoaXMgc2Vl
bXMgdG8gYmUgdGhlIGtpbmQgb2YKPiBjb25maWd1cmF0aW9uIHlvdSBoYXZlLiBJdCBpcyByZWxl
dmFudCBiZWNhdXNlIHRoaXMgaXNzdWUgc2VlbXMgdG8KPiBoYXBwZW4gd2hlbiB0aGUgTlZJRElB
IEdQVSBpcyBzd2l0Y2hlZCBvZmYgZHVyaW5nIGJvb3QuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
