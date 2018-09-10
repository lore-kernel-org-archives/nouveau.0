From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/4] fbdev: Drop FBINFO_CAN_FORCE_OUTPUT flag
Date: Mon, 10 Sep 2018 14:48:43 +0200
Message-ID: <20180910124845eucas1p1b51674cd657757aadf5138e277e57ebe~TCsHYsLqt1779917799eucas1p18@eucas1p1.samsung.com>
References: <CGME20180822085418epcas5p30ab8aa4b49ba204f4891760af002bce1@epcas5p3.samsung.com>
 <20180822085405.10787-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20180822085405.10787-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Lechner <david@lechnology.com>, Thierry Reding <treding@nvidia.com>, Kees Cook <keescook@chromium.org>
List-Id: nouveau.vger.kernel.org

Ck9uIDA4LzIyLzIwMTggMTA6NTQgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gVGhpcyB3YXMg
b25seSBhZGRlZCBmb3IgdGhlIGRybSdzIGZiZGV2IGVtdWxhdGlvbiBzdXBwb3J0LCBzbyB0aGF0
IGl0Cj4gd291bGQgdHJ5IGhhcmRlciB0byBzaG93IHRoZSBPb3BzLgo+IAo+IFVuZm9ydHVuYXRl
bHkgdGhpcyBuZXZlciByZWFsbHkgd29ya2VkIHJlbGlhYmx5LCBhbmQgaW4gcHJhY3RpY2UgZW5k
ZWQKPiB1cCBwdXNoaW5nIHRoZSByZWFsIE9vcHMgb2ZmIHRoZSBzY3JlZW4gZHVlIHRvIHBsZW50
eWZ1bGwgbG9ja2luZywKPiBzbGVlcC13aGlsZS1hdG9taWMgYW5kIG90aGVyIGlzc3Vlcy4gU28g
d2UgcmVtb3ZlZCBhbGwgdGhhdCBzdXBwb3J0Cj4gZnJvbSB0aGUgZmJkZXYgZW11bGF0aW9uIGEg
d2hpbGUgYmFjay4gQXNpZGU6IFdlJ3ZlIGFsc28gcmVtb3ZlZCB0aGUKPiBrZ2RiIHN1cHBvcnQs
IGZvciBzaW1pbGFyIHJlYXNvbnMuCj4gCj4gU2luY2UgaXQncyBzdWNoIGEgc21hbGwgcGF0Y2gg
SSBmaWd1cmVkIEkgZG9uJ3Qgc3BsaXQgdGhpcyB1cCBpbnRvIHRoZQo+IHVzdWFsIDMtcGhhc2Ug
cmVtb3ZhbC4KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEFsZXhhbmRlciBLYXBzaHVrIDxhbGV4YW5kZXIu
a2Fwc2h1a0BnbWFpbC5jb20+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3Jn
Pgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IENjOiBEYXZpZCBM
ZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpBY2tlZC1ieTogQmFy
dGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKQmVzdCBy
ZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1nZngK
