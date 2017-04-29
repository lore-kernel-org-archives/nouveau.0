From: Karol Herbst <karolherbst@gmail.com>
Subject: [PATCH] nv50/ir: we can't replace 0x0 with the zero reg
	for SHLADD
Date: Sat, 29 Apr 2017 17:10:20 +0200
Message-ID: <20170429151020.516-1-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, "13 . 0 17 . 0 17 . 1" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Zml4ZXMgYSBjcmFzaCBpbiBBbGllbiBJc29sYXRpb24KClNpZ25lZC1vZmYtYnk6IEthcm9sIEhl
cmJzdCA8a2Fyb2xoZXJic3RAZ21haWwuY29tPgpDYzogMTMuMCAxNy4wIDE3LjEgPG1lc2Etc3Rh
YmxlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZl
YXUvY29kZWdlbi9udjUwX2lyX2xvd2VyaW5nX252YzAuY3BwIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxp
dW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9sb3dlcmluZ19udmMwLmNwcCBiL3Ny
Yy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfbG93ZXJpbmdfbnZjMC5j
cHAKaW5kZXggNzMyZTFhOTNiNC4uNDgxNWQ2ZGYwNyAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0v
ZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9sb3dlcmluZ19udmMwLmNwcAorKysgYi9z
cmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2xvd2VyaW5nX252YzAu
Y3BwCkBAIC03NDAsNyArNzQwLDcgQEAgTlZDMExlZ2FsaXplUG9zdFJBOjp2aXNpdChCYXNpY0Js
b2NrICpiYikKICAgICAgICAgICAgICAgIG5leHQgPSBoaTsKICAgICAgICAgIH0KIAotICAgICAg
ICAgaWYgKGktPm9wICE9IE9QX01PViAmJiBpLT5vcCAhPSBPUF9QRkVUQ0gpCisgICAgICAgICBp
ZiAoaS0+b3AgIT0gT1BfTU9WICYmIGktPm9wICE9IE9QX1BGRVRDSCAmJiBpLT5vcCAhPSBPUF9T
SExBREQpCiAgICAgICAgICAgICByZXBsYWNlWmVybyhpKTsKICAgICAgIH0KICAgIH0KLS0gCjIu
MTIuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVz
YS1kZXYgbWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==
