From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Date: Wed, 2 Dec 2020 17:03:11 +0100
Message-ID: <CAKMK7uFaCVLu9GWR0Jkvf8iXP4RdcG3TmMsLmFVDoERBOk1ZOQ@mail.gmail.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
 <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <virtualization-bounces@lists.linux-foundation.org>
In-Reply-To: <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: Zack Rusin <zackr@vmware.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Roland Scheidegger <sroland@vmware.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>, "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBEZWMgMiwgMjAyMCBhdCA0OjM3IFBNIFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5j
b20+IHdyb3RlOgo+Cj4KPgo+ID4gT24gRGVjIDIsIDIwMjAsIGF0IDA5OjI3LCBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPgo+ID4gSGkKPiA+Cj4gPiBB
bSAwMi4xMi4yMCB1bSAwOTowMSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+IEhpCj4g
Pj4gQW0gMzAuMTEuMjAgdW0gMjE6NTkgc2NocmllYiBaYWNrIFJ1c2luOgo+ID4+Pgo+ID4+Pgo+
ID4+Pj4gT24gTm92IDI0LCAyMDIwLCBhdCAwNjozOCwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IFVzaW5nIHN0cnVjdCBkcm1fZGV2
aWNlLnBkZXYgaXMgZGVwcmVjYXRlZC4gQ29udmVydCB2bXdnZnggdG8gc3RydWN0Cj4gPj4+PiBk
cm1fZGV2aWNlLmRldi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+ID4+Pj4KPiA+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+Pj4g
Q2M6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgo+ID4+Pj4gLS0tCj4g
Pj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyB8ICA4ICsrKystLS0t
Cj4gPj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAgICB8IDI3ICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0tCj4gPj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9mYi5jICAgICB8ICAyICstCj4gPj4+Cj4gPj4+IFJldmlld2VkLWJ5OiBaYWNrIFJ1c2luIDx6
YWNrckB2bXdhcmUuY29tPgo+ID4+IENvdWxkIHlvdSBhZGQgdGhpcyBwYXRjaCB0byB0aGUgdm13
Z2Z4IHRyZWU/Cj4gPgo+ID4gQU1EIGRldnMgaW5kaWNhdGVkIHRoYXQgdGhleSdkIHByZWZlciB0
byBtZXJnZSB0aGUgcGF0Y2hzZXQgdHJvdWdoIGRybS1taXNjLW5leHQuIElmIHlvdSdyZSBPSyB3
aXRoIHRoYXQsIEknZCBtZXJnZSB0aGUgdm13Z2Z4IHBhdGNoIHRocm91Z2ggZHJtLW1pc2MtbmV4
dCBhcyB3ZWxsLgo+Cj4gU291bmRzIGdvb2QuIEnigJlsbCBtYWtlIHN1cmUgdG8gcmViYXNlIG91
ciBsYXRlc3QgcGF0Y2ggc2V0IG9uIHRvcCBvZiBpdCB3aGVuIGl04oCZcyBpbi4gVGhhbmtzIQoK
YnR3IGlmIHlvdSB3YW50IHRvIGF2b2lkIG11bHRpLXRyZWUgY29vcmRpbmF0aW9uIGhlYWRhY2hl
cywgd2UgY2FuCmFsc28gbWFuYWdlIHZtd2dmeCBpbiBkcm0tbWlzYyBhbmQgZ2l2ZSB5b3UgJiBS
b2xhbmQgY29tbWl0IHJpZ2h0cwp0aGVyZS4gVXAgdG8geW91LiBUaGVyZSBpcyBzb21lIHNjcmlw
dGluZyBpbnZvbHZlZCBmb3Igbm93IChidXQgSSBob3BlCndoZW5ldmVyIHdlIG1vdmUgdG8gZ2l0
bGFiIHdlIGNvdWxkIGRvIHRoZSBjaGVja3Mgc2VydmVyLXNpZGUpOgoKaHR0cHM6Ly9kcm0ucGFn
ZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvZ2V0dGluZy1zdGFydGVkLmh0bWwK
CkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
