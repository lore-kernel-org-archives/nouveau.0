From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2 4/4] nv30: falling back to draw path for
	edgeflag does no good
Date: Mon, 25 May 2015 21:24:48 -0400
Message-ID: <1432603488-30723-4-git-send-email-imirkin@alum.mit.edu>
References: <1432603488-30723-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1432603488-30723-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
Cc: "10.5 10.6" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

VGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgRURHRUZMQUcgaGFzIHRvIGJlIHRvZ2dsZWQgYXQgdmVy
dGV4IHN1Ym1pc3Npb24KdGltZS4gVGhpcyBjYW4gYmUgZG9uZSBmcm9tIGVpdGhlciB0aGUgZHJh
dyBvciB0aGUgcmVndWxhciBwYXRocy4gQXZvaWQKZmFsbGluZyBiYWNrIHRvIGRyYXcganVzdCBi
ZWNhdXNlIHRoZXJlJ3MgYW4gZWRnZWZsYWcuCgpTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8
aW1pcmtpbkBhbHVtLm1pdC5lZHU+CkNjOiAiMTAuNSAxMC42IiA8bWVzYS1zdGFibGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPgotLS0KIHNyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9udjMwL252
ZnhfdmVydHByb2cuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1
L252MzAvbnZmeF92ZXJ0cHJvZy5jIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L252MzAv
bnZmeF92ZXJ0cHJvZy5jCmluZGV4IGM4OTYwZGIuLjFjZTA1ODkgMTAwNjQ0Ci0tLSBhL3NyYy9n
YWxsaXVtL2RyaXZlcnMvbm91dmVhdS9udjMwL252ZnhfdmVydHByb2cuYworKysgYi9zcmMvZ2Fs
bGl1bS9kcml2ZXJzL25vdXZlYXUvbnYzMC9udmZ4X3ZlcnRwcm9nLmMKQEAgLTg3Miw5ICs4NzIs
OCBAQCBudmZ4X3ZlcnRwcm9nX3BhcnNlX2RlY2xfb3V0cHV0KHN0cnVjdCBudmZ4X3ZwYyAqdnBj
LAogICAgICAgfQogICAgICAgYnJlYWs7CiAgICBjYXNlIFRHU0lfU0VNQU5USUNfRURHRUZMQUc6
Ci0gICAgICAvKiBub3QgcmVhbGx5IGFuIGVycm9yIGp1c3QgYSBmYWxsYmFjayAqLwotICAgICAg
Tk9VVkVBVV9FUlIoImNhbm5vdCBoYW5kbGUgZWRnZWZsYWcgb3V0cHV0XG4iKTsKLSAgICAgIHJl
dHVybiBGQUxTRTsKKyAgICAgIHZwYy0+cl9yZXN1bHRbaWR4XSA9IG52ZnhfcmVnKE5WRlhTUl9O
T05FLCAwKTsKKyAgICAgIHJldHVybiBUUlVFOwogICAgZGVmYXVsdDoKICAgICAgIE5PVVZFQVVf
RVJSKCJiYWQgb3V0cHV0IHNlbWFudGljXG4iKTsKICAgICAgIHJldHVybiBGQUxTRTsKLS0gCjIu
My42CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwptZXNh
LWRldiBtYWlsaW5nIGxpc3QKbWVzYS1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9tZXNhLWRldgo=
