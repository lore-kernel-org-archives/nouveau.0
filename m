From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings
 from GPU!
Date: Mon, 18 Jan 2021 18:21:06 +0100
Message-ID: <YAXDgmWMR9s4OgxN@phenom.ffwll.local>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20210118150945.GE4903@dell>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>, Jesse Barnes <jesse.barnes@intel.com>, Jan Safrata <jan.nikitenko@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Gareth Hughes <gareth@valinux.com>, Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>, Min He <min.he@intel.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Niu Bing <bing.niu@intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, jim liu <jim.liu@intel.com>, Roland Scheidegger <sroland@vmware.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgMDM6MDk6NDVQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMTggSmFuIDIwMjEsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gCj4gPiBPbiBG
cmksIEphbiAxNSwgMjAyMSBhdCAwNjoyNzoxNVBNICswMDAwLCBaYWNrIFJ1c2luIHdyb3RlOgo+
ID4gPiAKPiA+ID4gPiBPbiBKYW4gMTUsIDIwMjEsIGF0IDEzOjE1LCBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+ID4gPiA+IGtl
cm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3
aXRoCj4gPiA+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiA+ID4gPiAKPiA+ID4gPiBMYXN0
IHNldCEgIEFsbCBjbGVhbiBhZnRlciB0aGlzIGZvcjsgQXJtLCBBcm02NCwgUFBDLCBNSVBTIGFu
ZCB4ODYuCj4gPiA+IAo+ID4gPiBUaGFua3MhIEZvciBhbGwgdGhlIHZtd2dmeCBiaXRzOgo+ID4g
PiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KPiA+IAo+ID4gT2sg
SSBtZXJnZWQgZXZlcnl0aGluZyBleGNlcHQgdm13Z2Z4ICh0aGF0J3MgZm9yIFphY2spIGFuZCBp
OTE1L25vdXZlYXUKPiA+ICh0aG9zZSBnZW5lcmFsbHkgZ28gdGhyb3VnaCBvdGhlciB0cmVlcywg
cGxzIGhvbGxlciBpZiB0aGV5J3JlIHN0dWNrKS4KPiAKPiBUaGFua3MgRGFuaWVsLCB5b3UncmUg
YSBzdXBlcnN0YXIhCj4gCj4gU28gWmFjayB3aWxsIHRha2UgdGhlIHZtd2dmeCBwYXJ0cz8gIERl
c3BpdGUgcHJvdmlkaW5nIGEgUi1iPwoKSSBvbmx5IG1lcmdlIHN0dWZmIHRoYXQncyBkZWZhY3Rv
IGFiYW5kb25lZCBhbHJlYWR5LiBFdmVyeXRoaW5nIGVsc2UgSSB0cnkKdG8gb2ZmbG9hZCB0byB3
aG9tZXZlciBhY3R1YWxseSBjYXJlcyA6LSkKLURhbmllbAoKPiAKPiA+IE5vdGUgdGhhdCB3ZSBo
YXZlIHNvbWUgYnVpbGQgaXNzdWUgb24gc29tZSBvZiB0aGUgY29uZmlncyBzZnIgdXNlcywgc28g
ZHJtCj4gPiB0cmVlcyBhcmUgc3RpbGwgc3R1Y2sgb24gb2xkIHZlcnNpb25zIGluIGxpbnV4LW5l
eHQuIEhvcGVmdWxseSBzaG91bGQgZ2V0Cj4gPiByZXNvbHZlZCBzb29uLCB0aGUgYnVnZml4IGlz
IGluIHNvbWUgc3VidHJlZSBJJ3ZlIGhlYXJkLgo+IAo+IE5vIHdvcnJpZXMuICBUaGFua3MgZm9y
IGxldHRpbmcgbWUga25vdy4KPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiBTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKPiBMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
