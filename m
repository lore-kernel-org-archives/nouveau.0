From: Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH] drm/nouveau/debugfs: fix pm_runtime.cocci warnings (fwd)
Date: Sat, 28 Jul 2018 08:19:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1807280815360.2466@hadrien>
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
To: Karol Herbst <karolherbst@gmail.com>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, kbuild-all@01.org
List-Id: nouveau.vger.kernel.org

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGZlbmdndWFuZy53dUBpbnRlbC5jb20+CgpwbV9ydW50
aW1lX2dldF9zeW5jIHJldHVybnMgPCAwIGFzIGVycm9yLiBVbmVjZXNzYXJ5IElTX0VSUl9WQUxV
RSBhdCBsaW5lIDE2NAoKR2VuZXJhdGVkIGJ5OiBzY3JpcHRzL2NvY2NpbmVsbGUvYXBpL3BtX3J1
bnRpbWUuY29jY2kKCkZpeGVzOiBlYWViOTAxMGJiNGIgKCJkcm0vbm91dmVhdS9kZWJ1Z2ZzOiBX
YWtlIHVwIEdQVSBiZWZvcmUgZG9pbmcgYW55IHJlY2xvY2tpbmciKQpDQzogS2Fyb2wgSGVyYnN0
IDxrYXJvbGhlcmJzdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0ZXN0IHJvYm90
IDxmZW5nZ3Vhbmcud3VAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWxpYSBMYXdhbGwgPGp1
bGlhLmxhd2FsbEBsaXA2LmZyPgotLS0KClBsZWFzZSB0YWtlIHRoZSBwYXRjaCBvbmx5IGlmIGl0
J3MgYSBwb3NpdGl2ZSB3YXJuaW5nLiBUaGFua3MhCgogbm91dmVhdV9kZWJ1Z2ZzLmMgfCAgICAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jCkBAIC0xNjEsNyArMTYxLDcgQEAgbm91
dmVhdV9kZWJ1Z2ZzX3BzdGF0ZV9zZXQoc3RydWN0IGZpbGUgKgogCX0KCiAJcmV0ID0gcG1fcnVu
dGltZV9nZXRfc3luYyhkcm0tPmRldik7Ci0JaWYgKElTX0VSUl9WQUxVRShyZXQpICYmIHJldCAh
PSAtRUFDQ0VTKQorCWlmIChyZXQgPCAwICYmIHJldCAhPSAtRUFDQ0VTKQogCQlyZXR1cm4gcmV0
OwogCXJldCA9IG52aWZfbXRoZChjdHJsLCBOVklGX0NPTlRST0xfUFNUQVRFX1VTRVIsICZhcmdz
LCBzaXplb2YoYXJncykpOwogCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRybS0+ZGV2KTsK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
