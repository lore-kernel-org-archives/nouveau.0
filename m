From: Kelly Doran <kel.p.doran@gmail.com>
Subject: Fix for vblank on nvc0
Date: Tue, 6 Nov 2012 08:48:51 -0600
Message-ID: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8f3baf034d5e6a04cdd4b368
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--e89a8f3baf034d5e6a04cdd4b368
Content-Type: multipart/alternative; boundary=e89a8f3baf034d5e6604cdd4b366

--e89a8f3baf034d5e6604cdd4b366
Content-Type: text/plain; charset=ISO-8859-1

The vblank on nvc0 was not working correctly and would freeze X, I managed
to track it down and fix it with some help from m.b.lankhorst, see
https://bugs.freedesktop.org/show_bug.cgi?id=56692 for details.

--e89a8f3baf034d5e6604cdd4b366
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The vblank on nvc0 was not working correctly and would freeze X, I managed =
to track it down and fix it with some help from m.b.lankhorst, see=A0<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D56692">https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D56692</a>=A0for details.

--e89a8f3baf034d5e6604cdd4b366--

--e89a8f3baf034d5e6a04cdd4b368
Content-Type: application/octet-stream; name="nvc0_vblank_fix.patch"
Content-Disposition: attachment; filename="nvc0_vblank_fix.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h974tokx0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2NvcmUvZW5naW5lL2Rpc3AvbnY1
MC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvY29yZS9lbmdpbmUvZGlzcC9udjUwLmMKaW5k
ZXggMTZhOWFmYi4uNGM5NzFiOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
Y29yZS9lbmdpbmUvZGlzcC9udjUwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvY29y
ZS9lbmdpbmUvZGlzcC9udjUwLmMKQEAgLTIyLDYgKzIyLDggQEAKICAqIEF1dGhvcnM6IEJlbiBT
a2VnZ3MKICAqLwogCisjaW5jbHVkZSA8c3ViZGV2L2Jhci5oPgorCiAjaW5jbHVkZSA8ZW5naW5l
L3NvZnR3YXJlLmg+CiAjaW5jbHVkZSA8ZW5naW5lL2Rpc3AuaD4KIApAQCAtMzcsNiArMzksNyBA
QCBudjUwX2Rpc3Bfc2NsYXNzW10gPSB7CiBzdGF0aWMgdm9pZAogbnY1MF9kaXNwX2ludHJfdmJs
YW5rKHN0cnVjdCBudjUwX2Rpc3BfcHJpdiAqcHJpdiwgaW50IGNydGMpCiB7CisJc3RydWN0IG5v
dXZlYXVfYmFyICpiYXIgPSBub3V2ZWF1X2Jhcihwcml2KTsKIAlzdHJ1Y3Qgbm91dmVhdV9kaXNw
ICpkaXNwID0gJnByaXYtPmJhc2U7CiAJc3RydWN0IG5vdXZlYXVfc29mdHdhcmVfY2hhbiAqY2hh
biwgKnRlbXA7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKQEAgLTQ2LDE4ICs0OSwxOSBAQCBudjUw
X2Rpc3BfaW50cl92Ymxhbmsoc3RydWN0IG52NTBfZGlzcF9wcml2ICpwcml2LCBpbnQgY3J0YykK
IAkJaWYgKGNoYW4tPnZibGFuay5jcnRjICE9IGNydGMpCiAJCQljb250aW51ZTsKIAotCQludl93
cjMyKHByaXYsIDB4MDAxNzA0LCBjaGFuLT52YmxhbmsuY2hhbm5lbCk7Ci0JCW52X3dyMzIocHJp
diwgMHgwMDE3MTAsIDB4ODAwMDAwMDAgfCBjaGFuLT52YmxhbmsuY3R4ZG1hKTsKLQogCQlpZiAo
bnZfZGV2aWNlKHByaXYpLT5jaGlwc2V0ID09IDB4NTApIHsKKwkJCW52X3dyMzIocHJpdiwgMHgw
MDE3MDQsIGNoYW4tPnZibGFuay5jaGFubmVsKTsKKwkJCW52X3dyMzIocHJpdiwgMHgwMDE3MTAs
IDB4ODAwMDAwMDAgfCBjaGFuLT52YmxhbmsuY3R4ZG1hKTsKKwkJCWJhci0+Zmx1c2goYmFyKTsK
IAkJCW52X3dyMzIocHJpdiwgMHgwMDE1NzAsIGNoYW4tPnZibGFuay5vZmZzZXQpOwogCQkJbnZf
d3IzMihwcml2LCAweDAwMTU3NCwgY2hhbi0+dmJsYW5rLnZhbHVlKTsKIAkJfSBlbHNlIHsKLQkJ
CWlmIChudl9kZXZpY2UocHJpdiktPmNoaXBzZXQgPj0gMHhjMCkgewotCQkJCW52X3dyMzIocHJp
diwgMHgwNjAwMGMsCi0JCQkJCXVwcGVyXzMyX2JpdHMoY2hhbi0+dmJsYW5rLm9mZnNldCkpOwot
CQkJfQotCQkJbnZfd3IzMihwcml2LCAweDA2MDAxMCwgY2hhbi0+dmJsYW5rLm9mZnNldCk7CisJ
CQludl93cjMyKHByaXYsIDB4MDAxNzE4LCAweDgwMDAwMDAwIHwgY2hhbi0+dmJsYW5rLmNoYW5u
ZWwpOworCQkJYmFyLT5mbHVzaChiYXIpOworCQkJbnZfd3IzMihwcml2LCAweDA2MDAwYywKKwkJ
CQl1cHBlcl8zMl9iaXRzKGNoYW4tPnZibGFuay5vZmZzZXQpKTsKKwkJCW52X3dyMzIocHJpdiwg
MHgwNjAwMTAsIAorCQkJCWxvd2VyXzMyX2JpdHMoY2hhbi0+dmJsYW5rLm9mZnNldCkpOwogCQkJ
bnZfd3IzMihwcml2LCAweDA2MDAxNCwgY2hhbi0+dmJsYW5rLnZhbHVlKTsKIAkJfQogCg==
--e89a8f3baf034d5e6a04cdd4b368
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--e89a8f3baf034d5e6a04cdd4b368--
