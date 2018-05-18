From: Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH] drm/nouveau/kms/nv50-: fix drm-get-put.cocci warnings
Date: Fri, 18 May 2018 18:51:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1805181849470.3339@hadrien>
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
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Alastair Bridgewater <alastair.bridgewater@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kbuild-all@01.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGZlbmdndWFuZy53dUBpbnRlbC5jb20+CgogVXNlIGRy
bV8qX2dldCgpIGFuZCBkcm1fKl9wdXQoKSBoZWxwZXJzIGluc3RlYWQgb2YgZHJtXypfcmVmZXJl
bmNlKCkgYW5kCiBkcm1fKl91bnJlZmVyZW5jZSgpIGhlbHBlcnMuCgpHZW5lcmF0ZWQgYnk6IHNj
cmlwdHMvY29jY2luZWxsZS9hcGkvZHJtLWdldC1wdXQuY29jY2kKCkZpeGVzOiAzMGVkNDliNTVi
NmUgKCJkcm0vbm91dmVhdS9rbXMvbnY1MC06IG1vdmUgY29kZSB1bmRlcm5lYXRoIGRpc3BudjUw
LyIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxmZW5nZ3Vhbmcud3VAaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2FsbEBsaXA2LmZyPgot
LS0KCnRyZWU6ICAgaHR0cHM6Ly9naXRodWIuY29tL3NrZWdnc2IvbGludXggbGludXgtNC4xOApo
ZWFkOiAgIDZjNDZkMDFmMjViY2Y3NDYwOGQwOTY0NWMyN2MzNWMzZjM5NDBlYmUKY29tbWl0OiAz
MGVkNDliNTViNmU0NGUwMDRjMzA5NTY3MWU3NGZlYTkzZWU4NGNiIFsxMDUvMTY1XQpkcm0vbm91
dmVhdS9rbXMvbnY1MC06IG1vdmUgY29kZSB1bmRlcm5lYXRoIGRpc3BudjUwLwoKIGRpc3AuYyB8
ICAgIDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtMzI1NCw3ICszMjU0LDcgQEAg
bnY1MF9tc3RtX2Rlc3Ryb3lfY29ubmVjdG9yKHN0cnVjdCBkcm1fZAogCW1zdGMtPnBvcnQgPSBO
VUxMOwogCWRybV9tb2Rlc2V0X3VubG9jaygmZHJtLT5kZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rp
b25fbXV0ZXgpOwoKLQlkcm1fY29ubmVjdG9yX3VucmVmZXJlbmNlKCZtc3RjLT5jb25uZWN0b3Ip
OworCWRybV9jb25uZWN0b3JfcHV0KCZtc3RjLT5jb25uZWN0b3IpOwogfQoKIHN0YXRpYyB2b2lk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
