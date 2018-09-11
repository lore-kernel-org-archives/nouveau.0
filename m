From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] fbdev: Drop FBINFO_CAN_FORCE_OUTPUT flag
Date: Tue, 11 Sep 2018 09:42:28 +0200
Message-ID: <20180911074228.GI19774@phenom.ffwll.local>
References: <CGME20180822085418epcas5p30ab8aa4b49ba204f4891760af002bce1@epcas5p3.samsung.com>
 <20180822085405.10787-1-daniel.vetter@ffwll.ch>
 <20180910124845eucas1p1b51674cd657757aadf5138e277e57ebe~TCsHYsLqt1779917799eucas1p18@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180910124845eucas1p1b51674cd657757aadf5138e277e57ebe~TCsHYsLqt1779917799eucas1p18@eucas1p1.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Lechner <david@lechnology.com>, Thierry Reding <treding@nvidia.com>, Kees Cook <keescook@chromium.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBTZXAgMTAsIDIwMTggYXQgMDI6NDg6NDNQTSArMDIwMCwgQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiB3cm90ZToKPiAKPiBPbiAwOC8yMi8yMDE4IDEwOjU0IEFNLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4gVGhpcyB3YXMgb25seSBhZGRlZCBmb3IgdGhlIGRybSdzIGZiZGV2IGVt
dWxhdGlvbiBzdXBwb3J0LCBzbyB0aGF0IGl0Cj4gPiB3b3VsZCB0cnkgaGFyZGVyIHRvIHNob3cg
dGhlIE9vcHMuCj4gPiAKPiA+IFVuZm9ydHVuYXRlbHkgdGhpcyBuZXZlciByZWFsbHkgd29ya2Vk
IHJlbGlhYmx5LCBhbmQgaW4gcHJhY3RpY2UgZW5kZWQKPiA+IHVwIHB1c2hpbmcgdGhlIHJlYWwg
T29wcyBvZmYgdGhlIHNjcmVlbiBkdWUgdG8gcGxlbnR5ZnVsbCBsb2NraW5nLAo+ID4gc2xlZXAt
d2hpbGUtYXRvbWljIGFuZCBvdGhlciBpc3N1ZXMuIFNvIHdlIHJlbW92ZWQgYWxsIHRoYXQgc3Vw
cG9ydAo+ID4gZnJvbSB0aGUgZmJkZXYgZW11bGF0aW9uIGEgd2hpbGUgYmFjay4gQXNpZGU6IFdl
J3ZlIGFsc28gcmVtb3ZlZCB0aGUKPiA+IGtnZGIgc3VwcG9ydCwgZm9yIHNpbWlsYXIgcmVhc29u
cy4KPiA+IAo+ID4gU2luY2UgaXQncyBzdWNoIGEgc21hbGwgcGF0Y2ggSSBmaWd1cmVkIEkgZG9u
J3Qgc3BsaXQgdGhpcyB1cCBpbnRvIHRoZQo+ID4gdXN1YWwgMy1waGFzZSByZW1vdmFsLgo+ID4g
Cj4gPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+ID4gQ2M6IEJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiA+IENjOiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gQ2M6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KPiA+IENjOiBBbGV4YW5kZXIgS2Fwc2h1ayA8YWxleGFuZGVy
LmthcHNodWtAZ21haWwuY29tPgo+ID4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0u
b3JnPgo+ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gPiBDYzog
RGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Cj4gPiBDYzogbm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+
IAo+IEFja2VkLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ft
c3VuZy5jb20+CgpBY2sgZm9yIG1lcmdpbmcgdGhlIGVudGlyZSBzZXJpZXMgdGhyb3VnaCBkcm0t
bWlzYy1uZXh0PwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
