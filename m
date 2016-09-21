From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/5] GPU-DRM-nouveau: Fine-tuning for five function
 implementations
Date: Wed, 21 Sep 2016 09:23:05 +0200
Message-ID: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
OiBXZWQsIDIxIFNlcCAyMDE2IDA5OjA5OjA5ICswMjAwCgpBIGZldyB1cGRhdGUgc3VnZ2VzdGlv
bnMgd2VyZSB0YWtlbiBpbnRvIGFjY291bnQKZnJvbSBzdGF0aWMgc291cmNlIGNvZGUgYW5hbHlz
aXMuCgpNYXJrdXMgRWxmcmluZyAoNSk6CiAgVXNlIGttYWxsb2NfYXJyYXkoKSBpbiBudmJpb3Nf
aWNjc2Vuc2VfcGFyc2UoKQogIFVzZSBrbWFsbG9jX2FycmF5KCkgaW4gZ3QyMTVfbGlua190cmFp
bigpCiAgRGVsZXRlIHVubmVjZXNzYXJ5IGJyYWNlcwogIEFkanVzdCBhIGt6YWxsb2MoKSBjYWxs
IGluIGd0MjE1X3JhbV9uZXcoKQogIEFkZCBzcGFjZSBhZnRlciBhbiAiaWYiCgogZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pY2NzZW5zZS5jIHwgIDQgKysrLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvcmFtZ3QyMTUuYyAgIHwgMjEgKysr
KysrKysrLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
