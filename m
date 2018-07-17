From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [Nouveau] [PATCH v2 2/3] drm/nouveau: Fix runtime PM leak in
 nv50_disp_atomic_commit()
Date: Tue, 17 Jul 2018 09:33:52 +0200
Message-ID: <20180717073352.GA17459@wunner.de>
References: <20180712170256.13018-1-lyude@redhat.com>
 <20180712170256.13018-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180712170256.13018-3-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDE6MDI6NTNQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBAQCAtMTg3OCw3ICsx
ODc4LDcgQEAgbnY1MF9kaXNwX2F0b21pY19jb21taXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiAgCQludjUwX2Rpc3BfYXRvbWljX2NvbW1pdF90YWlsKHN0YXRlKTsKPiAgCj4gIAlkcm1fZm9y
X2VhY2hfY3J0YyhjcnRjLCBkZXYpIHsKPiAtCQlpZiAoY3J0Yy0+c3RhdGUtPmVuYWJsZSkgewo+
ICsJCWlmIChjcnRjLT5zdGF0ZS0+YWN0aXZlKSB7Cj4gIAkJCWlmICghZHJtLT5oYXZlX2Rpc3Bf
cG93ZXJfcmVmKSB7Cj4gIAkJCQlkcm0tPmhhdmVfZGlzcF9wb3dlcl9yZWYgPSB0cnVlOwo+ICAJ
CQkJcmV0dXJuIDA7CgpTb21ld2hhdCB0YW5nZW50aWFsIGNvbW1lbnQgb24gdGhpcyBvbGRlciBw
YXRjaCwgc2luY2UgeW91CmNvbnRpbnVlIHRvIGRpZyBhcm91bmQgaW4gdGhlIHJ1bnRpbWUgUE0g
YXJlYToKCldoZW5ldmVyIGEgY3J0YyBpcyBhY3RpdmF0ZWQgb3IgZGVhY3RpdmF0ZWQgaW4gbm91
dmVhdSwgd2UgaXRlcmF0ZQpvdmVyIGFsbCBjcnRjcyBhbmQgYWNxdWlyZSBhIHJ1bnRpbWUgUE0g
aWYgYSBjcnRjIGlzIGFjdGl2ZSBhbmQKcHJldmlvdXNseSB0aGVyZSB3YXMgbm8gYWN0aXZlIG9u
ZSwgb3Igd2UgZHJvcCBhIHJlZiBpZiBub25lIGlzCmFjdGl2ZSBhbmQgcHJldmlvdXNseSB0aGVy
ZSB3YXMgYW4gYWN0aXZlIG9uZS4KCkZvciBhIHdoaWxlIG5vdyBJJ3ZlIGJlZW4gdGhpbmtpbmcg
dGhhdCBpdCB3b3VsZCBiZSBtb3JlIHN0cmFpZ2h0Zm9yd2FyZAp0byBhY3F1aXJlIGEgcmVmIHdo
ZW5ldmVyIGEgY3J0YyBpcyBhY3RpdmF0ZWQgYW5kIGRyb3Agb25lIHdoZW4gYSBjcnRjCmlzIGRl
YWN0aXZhdGVkLCBpLmUuIGhvbGQgb25lIHJlZiBmb3IgZXZlcnkgYWN0aXZlIGNydGMuICBUaGF0
IHdheSB0aGUKaGF2ZV9kaXNwX3Bvd2VyX3JlZiB2YXJpYWJsZSBhcyB3ZWxsIGFzIHRoZSBpdGVy
YXRpb24gbG9naWMgY291bGQgYmUKcmVtb3ZlZCwgbGVhZGluZyB0byBhIHNpbXBsaWZpY2F0aW9u
LiAgSnVzdCBhIHN1Z2dlc3Rpb24gYW55d2F5LgoKVGhhbmtzLAoKTHVrYXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
