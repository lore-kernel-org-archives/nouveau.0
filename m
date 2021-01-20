From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings
 from GPU!
Date: Wed, 20 Jan 2021 08:05:26 +0000
Message-ID: <20210120080526.GL4903@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local> <20210119082927.GJ4903@dell>
 <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>, Jesse Barnes <jesse.barnes@intel.com>, Jan Safrata <jan.nikitenko@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Gareth Hughes <gareth@valinux.com>, Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>, Min He <min.he@intel.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Niu Bing <bing.niu@intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, jim liu <jim.liu@intel.com>, Roland Scheidegger <sroland@vmware.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCAxOSBKYW4gMjAyMSwgWmFjayBSdXNpbiB3cm90ZToKCj4gCj4gCj4gPiBPbiBKYW4g
MTksIDIwMjEsIGF0IDAzOjI5LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90
ZToKPiA+IAo+ID4gT24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+
IAo+ID4+IE9uIE1vbiwgSmFuIDE4LCAyMDIxIGF0IDAzOjA5OjQ1UE0gKzAwMDAsIExlZSBKb25l
cyB3cm90ZToKPiA+Pj4gT24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+Pj4gCj4gPj4+PiBPbiBGcmksIEphbiAxNSwgMjAyMSBhdCAwNjoyNzoxNVBNICswMDAwLCBa
YWNrIFJ1c2luIHdyb3RlOgo+ID4+Pj4+IAo+ID4+Pj4+PiBPbiBKYW4gMTUsIDIwMjEsIGF0IDEz
OjE1LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+Pj4+Pj4gCj4g
Pj4+Pj4+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8g
Y2xlYW4tdXAgVz0xCj4gPj4+Pj4+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkg
b3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPj4+Pj4+IG5pZ2dseSBsaXR0bGUgd2Fybmlu
Z3MuCj4gPj4+Pj4+IAo+ID4+Pj4+PiBMYXN0IHNldCEgIEFsbCBjbGVhbiBhZnRlciB0aGlzIGZv
cjsgQXJtLCBBcm02NCwgUFBDLCBNSVBTIGFuZCB4ODYuCj4gPj4+Pj4gCj4gPj4+Pj4gVGhhbmtz
ISBGb3IgYWxsIHRoZSB2bXdnZnggYml0czoKPiA+Pj4+PiBSZXZpZXdlZC1ieTogWmFjayBSdXNp
biA8emFja3JAdm13YXJlLmNvbT4KPiA+Pj4+IAo+ID4+Pj4gT2sgSSBtZXJnZWQgZXZlcnl0aGlu
ZyBleGNlcHQgdm13Z2Z4ICh0aGF0J3MgZm9yIFphY2spIGFuZCBpOTE1L25vdXZlYXUKPiA+Pj4+
ICh0aG9zZSBnZW5lcmFsbHkgZ28gdGhyb3VnaCBvdGhlciB0cmVlcywgcGxzIGhvbGxlciBpZiB0
aGV5J3JlIHN0dWNrKS4KPiA+Pj4gCj4gPj4+IFRoYW5rcyBEYW5pZWwsIHlvdSdyZSBhIHN1cGVy
c3RhciEKPiA+Pj4gCj4gPj4+IFNvIFphY2sgd2lsbCB0YWtlIHRoZSB2bXdnZnggcGFydHM/ICBE
ZXNwaXRlIHByb3ZpZGluZyBhIFItYj8KPiA+PiAKPiA+PiBJIG9ubHkgbWVyZ2Ugc3R1ZmYgdGhh
dCdzIGRlZmFjdG8gYWJhbmRvbmVkIGFscmVhZHkuIEV2ZXJ5dGhpbmcgZWxzZSBJIHRyeQo+ID4+
IHRvIG9mZmxvYWQgdG8gd2hvbWV2ZXIgYWN0dWFsbHkgY2FyZXMgOi0pCj4gPiAKPiA+IFVuZGVy
c3Rvb2QuICBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KPiA+IAo+ID4gSG9wZWZ1bGx5IFph
Y2sgYWN0dWFsbHkgY2FyZXMuIDpECj4gCj4gaGFoLCBJIGRvLiBJIGp1c3QgcHVzaGVkIGFsbCBv
ZiB0aGUgY2hhbmdlcyB0byBkcm0tbWlzYy1uZXh0LiBMZXQgbWUKPiBrbm93IGlmIEkgbWlzc2Vk
IGFueXRoaW5nLiBUaGFua3MhCgpQZXJmZWN0LiAgVGhhbmsgeW91IFphY2suCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZngK
