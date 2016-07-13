From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v6 15/46] drm/nouveau: dma-mapping: Use unsigned long for
 dma_attrs
Date: Wed, 13 Jul 2016 10:41:06 +0200
Message-ID: <1468399300-5399-15-git-send-email-k.kozlowski@samsung.com>
References: <1468399167-28083-1-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-1-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-2-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-3-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-4-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-5-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-6-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-7-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-8-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-9-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-10-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-11-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-12-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-13-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-14-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1468399300-5399-14-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@infradead.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

U3BsaXQgb3V0IHN1YnN5c3RlbSBzcGVjaWZpYyBjaGFuZ2VzIGZvciBlYXNpZXIgcmV2aWV3cy4g
VGhpcyB3aWxsIGJlCnNxdWFzaGVkIHdpdGggbWFpbiBjb21taXQuCgpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT4KW2ZvciBkcm1dCkFj
a2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2luc3RtZW0vZ2syMGEuYyB8IDEzICsrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1l
bS9nazIwYS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9n
azIwYS5jCmluZGV4IDZiOGYyYTE5YjJkOS4uYTZhN2ZhMGQ3Njc5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pbnN0bWVtL2drMjBhLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9nazIwYS5jCkBAIC0xMDks
NyArMTA5LDcgQEAgc3RydWN0IGdrMjBhX2luc3RtZW0gewogCXUxNiBpb21tdV9iaXQ7CiAKIAkv
KiBPbmx5IHVzZWQgYnkgRE1BIEFQSSAqLwotCXN0cnVjdCBkbWFfYXR0cnMgYXR0cnM7CisJdW5z
aWduZWQgbG9uZyBhdHRyczsKIH07CiAjZGVmaW5lIGdrMjBhX2luc3RtZW0ocCkgY29udGFpbmVy
X29mKChwKSwgc3RydWN0IGdrMjBhX2luc3RtZW0sIGJhc2UpCiAKQEAgLTI5Myw3ICsyOTMsNyBA
QCBnazIwYV9pbnN0b2JqX2R0b3JfZG1hKHN0cnVjdCBudmttX21lbW9yeSAqbWVtb3J5KQogCQln
b3RvIG91dDsKIAogCWRtYV9mcmVlX2F0dHJzKGRldiwgbm9kZS0+YmFzZS5tZW0uc2l6ZSA8PCBQ
QUdFX1NISUZULCBub2RlLT5iYXNlLnZhZGRyLAotCQkgICAgICAgbm9kZS0+aGFuZGxlLCAmaW1l
bS0+YXR0cnMpOworCQkgICAgICAgbm9kZS0+aGFuZGxlLCBpbWVtLT5hdHRycyk7CiAKIG91dDoK
IAlyZXR1cm4gbm9kZTsKQEAgLTM4Niw3ICszODYsNyBAQCBnazIwYV9pbnN0b2JqX2N0b3JfZG1h
KHN0cnVjdCBnazIwYV9pbnN0bWVtICppbWVtLCB1MzIgbnBhZ2VzLCB1MzIgYWxpZ24sCiAKIAlu
b2RlLT5iYXNlLnZhZGRyID0gZG1hX2FsbG9jX2F0dHJzKGRldiwgbnBhZ2VzIDw8IFBBR0VfU0hJ
RlQsCiAJCQkJCSAgICZub2RlLT5oYW5kbGUsIEdGUF9LRVJORUwsCi0JCQkJCSAgICZpbWVtLT5h
dHRycyk7CisJCQkJCSAgIGltZW0tPmF0dHJzKTsKIAlpZiAoIW5vZGUtPmJhc2UudmFkZHIpIHsK
IAkJbnZrbV9lcnJvcihzdWJkZXYsICJjYW5ub3QgYWxsb2NhdGUgRE1BIG1lbW9yeVxuIik7CiAJ
CXJldHVybiAtRU5PTUVNOwpAQCAtNTk3LDEwICs1OTcsOSBAQCBnazIwYV9pbnN0bWVtX25ldyhz
dHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSwgaW50IGluZGV4LAogCiAJCW52a21faW5mbygmaW1l
bS0+YmFzZS5zdWJkZXYsICJ1c2luZyBJT01NVVxuIik7CiAJfSBlbHNlIHsKLQkJaW5pdF9kbWFf
YXR0cnMoJmltZW0tPmF0dHJzKTsKLQkJZG1hX3NldF9hdHRyKERNQV9BVFRSX05PTl9DT05TSVNU
RU5ULCAmaW1lbS0+YXR0cnMpOwotCQlkbWFfc2V0X2F0dHIoRE1BX0FUVFJfV0VBS19PUkRFUklO
RywgJmltZW0tPmF0dHJzKTsKLQkJZG1hX3NldF9hdHRyKERNQV9BVFRSX1dSSVRFX0NPTUJJTkUs
ICZpbWVtLT5hdHRycyk7CisJCWltZW0tPmF0dHJzID0gRE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQg
fAorCQkJICAgICAgRE1BX0FUVFJfV0VBS19PUkRFUklORyB8CisJCQkgICAgICBETUFfQVRUUl9X
UklURV9DT01CSU5FOwogCiAJCW52a21faW5mbygmaW1lbS0+YmFzZS5zdWJkZXYsICJ1c2luZyBE
TUEgQVBJXG4iKTsKIAl9Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
