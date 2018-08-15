From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v8 2/5] drm/nouveau: Remove duplicate poll_enable() in
 pmops_runtime_suspend()
Date: Wed, 15 Aug 2018 15:00:12 -0400
Message-ID: <20180815190018.15396-3-lyude@redhat.com>
References: <20180815190018.15396-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180815190018.15396-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

U2luY2UgYWN0dWFsIGhvdHBsdWcgbm90aWZpY2F0aW9ucyBkb24ndCBnZXQgZGlzYWJsZWQgdW50
aWwKbm91dmVhdV9kaXNwbGF5X2ZpbmkoKSBpcyBjYWxsZWQsIGFsbCB0aGlzIHdpbGwgZG8gaXMg
Y2F1c2UgYW55IGhvdHBsdWdzCnRoYXQgaGFwcGVuIGJldHdlZW4gdGhpcyBkcm1fa21zX2hlbHBl
cl9wb2xsX2Rpc2FibGUoKSBjYWxsIGFuZCB0aGUKYWN0dWFsIGhvdHBsdWcgZGlzYWJsZW1lbnQg
dG8gcG90ZW50aWFsbHkgYmUgZHJvcHBlZCBpZiBBQ1BJIGlzbid0CmFyb3VuZCB0byBoZWxwIHVz
LgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQWNrZWQtYnk6
IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgpBY2tlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpDYzogTHVrYXMg
V3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kcm0uYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCBjN2VjODZkNmMzYzkuLjVmZGMxZmJlMmVl
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC04MzUsNyArODM1LDYg
QEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCQly
ZXR1cm4gLUVCVVNZOwogCX0KIAotCWRybV9rbXNfaGVscGVyX3BvbGxfZGlzYWJsZShkcm1fZGV2
KTsKIAlub3V2ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKIAlyZXQgPSBub3V2ZWF1X2Rv
X3N1c3BlbmQoZHJtX2RldiwgdHJ1ZSk7CiAJcGNpX3NhdmVfc3RhdGUocGRldik7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
