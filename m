From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] pci/g92: Enable changing pcie link speeds
Date: Sun, 20 Nov 2016 00:43:15 +0100
Message-ID: <20161119234315.4111-3-karolherbst@gmail.com>
References: <20161119234315.4111-1-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161119234315.4111-1-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

VGVzdGVkIG9uIGEgRzkyLCBzZWVtcyB0byB3b3JrLiBDb25maXJtZWQgYnkgOCBtbWlvdHJhY2Vz
LgoKU2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxrYXJvbGhlcmJzdEBnbWFpbC5jb20+Ci0t
LQogZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2UuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RybS9u
b3V2ZWF1L252a20vZW5naW5lL2RldmljZS9iYXNlLmMgYi9kcm0vbm91dmVhdS9udmttL2VuZ2lu
ZS9kZXZpY2UvYmFzZS5jCmluZGV4IDczMDdlZTFmLi41YTE2YjVhOSAxMDA2NDQKLS0tIGEvZHJt
L25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2UuYworKysgYi9kcm0vbm91dmVhdS9udmtt
L2VuZ2luZS9kZXZpY2UvYmFzZS5jCkBAIC05OTMsNyArOTkzLDcgQEAgbnY5Ml9jaGlwc2V0ID0g
ewogCS5tYyA9IGc4NF9tY19uZXcsCiAJLm1tdSA9IG52NTBfbW11X25ldywKIAkubXhtID0gbnY1
MF9teG1fbmV3LAotCS5wY2kgPSBnODRfcGNpX25ldywKKwkucGNpID0gZzkyX3BjaV9uZXcsCiAJ
LnRoZXJtID0gZzg0X3RoZXJtX25ldywKIAkudGltZXIgPSBudjQxX3RpbWVyX25ldywKIAkudm9s
dCA9IG52NDBfdm9sdF9uZXcsCi0tIAoyLjExLjAucmMyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
