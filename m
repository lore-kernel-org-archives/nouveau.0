From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/5] Fix deadlock on runtime suspend in DRM drivers
Date: Wed, 14 Feb 2018 09:46:36 +0100
Message-ID: <20180214084636.GA28107@wunner.de>
References: <cover.1518338788.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <cover.1518338788.git.lukas@wunner.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: Ismo Toijala <ismo.toijala@gmail.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Peter Wu <peter@lekensteyn.nl>
List-Id: nouveau.vger.kernel.org

RGVhciBkcm0tbWlzYyBtYWludGFpbmVycywKCk9uIFN1biwgRmViIDExLCAyMDE4IGF0IDEwOjM4
OjI4QU0gKzAxMDAsIEx1a2FzIFd1bm5lciB3cm90ZToKPiBGaXggYSBkZWFkbG9jayBvbiBoeWJy
aWQgZ3JhcGhpY3MgbGFwdG9wcyB0aGF0J3MgYmVlbiBwcmVzZW50IHNpbmNlIDIwMTM6CgpUaGlz
IHNlcmllcyBoYXMgYmVlbiByZXZpZXdlZCwgY29uc2VudCBoYXMgYmVlbiBleHByZXNzZWQgYnkg
dGhlIG1vc3QKaW50ZXJlc3RlZCBwYXJ0aWVzLCBwYXRjaCBbMS81XSB3aGljaCB0b3VjaGVzIGZp
bGVzIG91dHNpZGUgZHJpdmVycy9ncHUKaGFzIGJlZW4gYWNrZWQgYW5kIEkndmUganVzdCBvdXQg
YSB2MiBhZGRyZXNzaW5nIHRoZSBvbmx5IG9iamVjdGlvbgpyYWlzZWQuICBNeSBwbGFuIGlzIHRo
dXMgdG8gd2FpdCBhbm90aGVyIHR3byBkYXlzIGZvciBjb21tZW50cyBhbmQsCmJhcnJpbmcgZnVy
dGhlciBvYmplY3Rpb25zLCBwdXNoIHRvIGRybS1taXNjIHRoaXMgd2Vla2VuZC4KCkhvd2V2ZXIg
SSdtIHN0cnVnZ2xpbmcgd2l0aCB0aGUgZGVjaXNpb24gd2hldGhlciB0byBwdXNoIHRvIG5leHQg
b3IKZml4ZXMuICBUaGUgc2VyaWVzIGlzIG1hcmtlZCBmb3Igc3RhYmxlLCBob3dldmVyIHRoZSBu
dW1iZXIgb2YKYWZmZWN0ZWQgbWFjaGluZXMgaXMgbGltaXRlZCBhbmQgZm9yIGFuIGlzc3VlIHRo
YXQncyBiZWVuIHByZXNlbnQKZm9yIDUgeWVhcnMgaXQgcHJvYmFibHkgZG9lc24ndCBtYXR0ZXIg
aWYgaXQgc29ha3MgYW5vdGhlciB0d28gbW9udGhzCmluIGxpbnV4LW5leHQgYmVmb3IgaXQgZ2V0
cyBiYWNrcG9ydGVkLiAgSGVuY2UgSSB0ZW5kIHRvIGVyciBvbiB0aGUKc2lkZSBvZiBjYXV0aW9u
IGFuZCBwdXNoIHRvIG5leHQsIGhvd2V2ZXIgYSBjYXNlIGNvdWxkIGJlIG1hZGUgdGhhdApmaXhl
cyBpcyBtb3JlIGFwcHJvcHJpYXRlLgoKSSdtIGxhY2tpbmcgZXhwZXJpZW5jZSBtYWtpbmcgc3Vj
aCBkZWNpc2lvbnMgYW5kIHdvdWxkIGJlIGludGVyZXN0ZWQKdG8gbGVhcm4gaG93IHlvdSdkIGhh
bmRsZSB0aGlzLgoKVGhhbmtzLAoKTHVrYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
