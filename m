From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 4/5] GPU-DRM-nouveau: Adjust a kzalloc() call in
 gt215_ram_new()
Date: Wed, 21 Sep 2016 09:28:00 +0200
Message-ID: <0d8628f4-7254-2600-9ee4-e72b4e0ee6f6@users.sourceforge.net>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: nouveau.vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBXZWQsIDIxIFNlcCAyMDE2IDA4OjQ0OjM4ICswMjAwCgpUaGUgc2NyaXB0ICJjaGVja3BhdGNo
LnBsIiBjYW4gcG9pbnQgb3V0IHRoYXQgYXNzaWdubWVudHMgc2hvdWxkIHVzdWFsbHkKbm90IGJl
IHBlcmZvcm1lZCB3aXRoaW4gY29uZGl0aW9uIGNoZWNrcy4KVGh1cyBtb3ZlIHRoZSBhc3NpZ25t
ZW50IGZvciBvbmUgbG9jYWwgdmFyaWFibGUgdG8gYSBzZXBhcmF0ZSBzdGF0ZW1lbnQKaW4gdGhp
cyBmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJz
LnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9mYi9yYW1ndDIxNS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9mYi9yYW1ndDIxNS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvZmIvcmFtZ3QyMTUuYwppbmRleCBjYjUwNTM5Li5lZGJlOGU0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9yYW1ndDIxNS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbWd0MjE1LmMKQEAgLTk0MCw3ICs5
NDAsOCBAQCBndDIxNV9yYW1fbmV3KHN0cnVjdCBudmttX2ZiICpmYiwgc3RydWN0IG52a21fcmFt
ICoqcHJhbSkKIAlzdHJ1Y3QgZ3QyMTVfcmFtICpyYW07CiAJaW50IHJldCwgaTsKIAotCWlmICgh
KHJhbSA9IGt6YWxsb2Moc2l6ZW9mKCpyYW0pLCBHRlBfS0VSTkVMKSkpCisJcmFtID0ga3phbGxv
YyhzaXplb2YoKnJhbSksIEdGUF9LRVJORUwpOworCWlmICghcmFtKQogCQlyZXR1cm4gLUVOT01F
TTsKIAkqcHJhbSA9ICZyYW0tPmJhc2U7CiAKLS0gCjIuMTAuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
