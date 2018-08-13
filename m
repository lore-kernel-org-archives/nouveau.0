From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v7 2/5] drm/nouveau: Remove duplicate poll_enable() in
 pmops_runtime_suspend()
Date: Mon, 13 Aug 2018 15:16:42 -0400
Message-ID: <20180813191648.27419-3-lyude@redhat.com>
References: <20180813191648.27419-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180813191648.27419-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Karol Herbst <karolherbst@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

U2luY2UgYWN0dWFsIGhvdHBsdWcgbm90aWZpY2F0aW9ucyBkb24ndCBnZXQgZGlzYWJsZWQgdW50
aWwKbm91dmVhdV9kaXNwbGF5X2ZpbmkoKSBpcyBjYWxsZWQsIGFsbCB0aGlzIHdpbGwgZG8gaXMg
Y2F1c2UgYW55IGhvdHBsdWdzCnRoYXQgaGFwcGVuIGJldHdlZW4gdGhpcyBkcm1fa21zX2hlbHBl
cl9wb2xsX2Rpc2FibGUoKSBjYWxsIGFuZCB0aGUKYWN0dWFsIGhvdHBsdWcgZGlzYWJsZW1lbnQg
dG8gcG90ZW50aWFsbHkgYmUgZHJvcHBlZCBpZiBBQ1BJIGlzbid0CmFyb3VuZCB0byBoZWxwIHVz
LgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRlPgpDYzog
S2Fyb2wgSGVyYnN0IDxrYXJvbGhlcmJzdEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCBjN2VjODZkNmMzYzku
LjVmZGMxZmJlMmVlNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC04
MzUsNyArODM1LDYgQEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQogCQlyZXR1cm4gLUVCVVNZOwogCX0KIAotCWRybV9rbXNfaGVscGVyX3BvbGxfZGlz
YWJsZShkcm1fZGV2KTsKIAlub3V2ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKIAlyZXQg
PSBub3V2ZWF1X2RvX3N1c3BlbmQoZHJtX2RldiwgdHJ1ZSk7CiAJcGNpX3NhdmVfc3RhdGUocGRl
dik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
