From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 3/3] drm/nv4c/bios: disallow retrieving from prom on nv4x igp's
Date: Wed,  5 Feb 2014 14:33:04 -0500
Message-ID: <1391628784-18834-3-git-send-email-imirkin@alum.mit.edu>
References: <1391628784-18834-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1391628784-18834-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ronald <ronald645@gmail.com>, =?UTF-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin@0x04.net>
List-Id: nouveau.vger.kernel.org

U3VnZ2VzdGVkLWJ5OiBNYXJjaW4gS2/Fm2NpZWxuaWNraSA8a29yaWFraW5AMHgwNC5uZXQ+ClNp
Z25lZC1vZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9jb3JlL3N1YmRldi9iaW9zL2Jhc2UuYyB8IDQgKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2NvcmUvc3ViZGV2L2Jpb3MvYmFzZS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvY29yZS9zdWJkZXYvYmlvcy9iYXNlLmMKaW5kZXggYWEwZmJiZS4uZWYwYzljNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvY29yZS9zdWJkZXYvYmlvcy9iYXNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvY29yZS9zdWJkZXYvYmlvcy9iYXNlLmMKQEAgLTEz
MCw2ICsxMzAsMTAgQEAgbm91dmVhdV9iaW9zX3NoYWRvd19wcm9tKHN0cnVjdCBub3V2ZWF1X2Jp
b3MgKmJpb3MpCiAJdTE2IHBjaXI7CiAJaW50IGk7CiAKKwkvKiB0aGVyZSBpcyBubyBwcm9tIG9u
IG52NHggSUdQJ3MgKi8KKwlpZiAoZGV2aWNlLT5jYXJkX3R5cGUgPT0gTlZfNDAgJiYgZGV2aWNl
LT5jaGlwc2V0ID49IDB4NGMpCisJCXJldHVybjsKKwogCS8qIGVuYWJsZSBhY2Nlc3MgdG8gcm9t
ICovCiAJaWYgKGRldmljZS0+Y2FyZF90eXBlID49IE5WXzUwKQogCQlwY2lyZWcgPSAweDA4ODA1
MDsKLS0gCjEuOC4zLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
