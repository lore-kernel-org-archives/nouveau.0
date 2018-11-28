From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fbdev: Make skip_vt_switch the default
Date: Wed, 28 Nov 2018 09:20:57 +0100
Message-ID: <20181128082057.GH4266@phenom.ffwll.local>
References: <20181127170952.28507-1-daniel.vetter@ffwll.ch>
 <20181127173424.301-1-daniel.vetter@ffwll.ch>
 <3d406677-9d7d-6d8d-85af-1cfb253d1838@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <3d406677-9d7d-6d8d-85af-1cfb253d1838@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Daniel Stone <daniels@collabora.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Junwei Zhang <Jerry.Zhang@amd.com>, linux-arm-kernel@lists.infradead.org, Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>, Sandy Huang <hjc@rock-chips.com>, Samuel Li <Samuel.Li@amd.com>, Shirish S <shirish.s@amd.com>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Alex
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDg6MTc6MDRBTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMjctMTEtMTggb20gMTg6MzQgc2NocmVlZiBEYW5pZWwgVmV0dGVyOgo+
ID4gS01TIGRyaXZlcnMgcmVhbGx5IHNob3VsZCBhbGwgYmUgYWJsZSB0byByZXN0b3JlIHRoZWly
IGRpc3BsYXkgc3RhdGUKPiA+IG9uIHJlc3VtZSB3aXRob3V0IGZiY29uIGhlbHBpbmcgb3V0LiBT
byBtYWtlIHRoaXMgdGhlIGRlZmF1bHQuCj4gPgo+ID4gU2luY2UgSSdtIG5vdCBlbnRpcmVseSBm
b29saXNoLCBtYWtlIGl0IG9ubHkgYSBkZWZhdWx0LCB3aGljaCBkcml2ZXJzCj4gPiBjYW4gc3Rp
bGwgb3ZlcnJpZGUuIFRoYXQgd2F5IHdoZW4gdGhlIGluZXZpdGFibGUgcmVncmVzc2lvbiByZXBv
cnQKPiA+IGhhcHBlbnMgSSBjYW4gZml4IHRoaW5ncyB1cCB3aXRoIGEgb25lLWxpbmVyIHBsdXMg
RklYTUUgY29tbWVudCB0aGF0Cj4gPiBzb21lb25lIHNob3VsZCBmaXggdXAgdGhlIHN1c3BlbmQv
cmVzdW1lIGNvZGUgaW4gdGhhdCBkcml2ZXIuCj4gPgo+ID4gQnV0IGF0IGxlYXN0IGFsbCBuZXcg
ZHJpdmVycyB3b24ndCBiZSBicm9rZW4gYnkgYWNjaWRlbnQgYXMgc29vbiBhcwo+ID4geW91IHR1
cm4gb2ZmIGZiY29uIGJlY2F1c2UgInN1c3BlbmQvcmVzdW1lIHdvcmtlZCB3aGVuIEkgdGVzdGVk
IGl0Ii4KPiA+Cj4gPiB2MjogS2VlcCB0aGlzIGZvciByYWRlb24gYmVjYXVzZSBvZgo+ID4KPiA+
IGNvbW1pdCAxOGM0MzdjYWE1YjE4YTIzNWRkNjVjZWMyMjRlYWI1NGJlYmNlZTY1Cj4gPiBBdXRo
b3I6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IERhdGU6ICAg
VHVlIE5vdiAxNCAxNzoxOToyOSAyMDE3IC0wNTAwCj4gPgo+ID4gICAgIFJldmVydCAiZHJtL3Jh
ZGVvbjogZG9udCBzd2l0Y2ggdnQgb24gc3VzcGVuZCIKPiA+Cj4gPiBUaGFua3MgdG8gTWljaGVs
IETDpG56ZXIgZm9yIHBvaW50aW5nIHRoaXMgb25lIG91dC4KPiAKPiBNYXliZSBqdXN0IHJlbG9h
ZCB0aGUgZ2FtbWEgbHV0IG9uIHJlc3VtZSBmb3IgcmFkZW9uLCBpbnN0ZWFkIG9mIHJlbHlpbmcg
b24gZmJjb24/CgpJdCBhbHNvIGNhdXNlZCByYW5kb20gc291bmQgaXNzdWVzIGFuZCBvdGhlciBm
dW4uIEFsc28sIGFmYWl1aSByYWRlb24gZG9lcwpsb2FkIHRoZSBsdXQuIEV4Y2VwdCBiZWNhdXNl
IG9mIHRpbWluZyBvciBiYWQgbHVjaywgaXQgZG9lc24ndCB3b3JrCnJlbGlhYmx5LCBhbmQgdGhl
IHZ0IHN3aXRjaCBkb2luZyBpdCBhIDJuZCB0aW1lIGhlbHBzIG91dC4KLURhbmllbAoKPiBPdGhl
cndpc2UgcGF0Y2ggbG9va3Mgc2FuZSwgd291bGQgYmUgbmljZSBpZiByYWRlb24gd2FzIGZpeGVk
IGluc3RlYWQgb2Ygd29ya2VkIGFyb3VuZC4KPiAKPiBSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVs
LWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
