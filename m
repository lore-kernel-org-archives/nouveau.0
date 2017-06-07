From: Colin King <colin.king@canonical.com>
Subject: [PATCH][drm-next] drm/nouveau: fix non-ANSI function declaration of
 nouveau_pmops_runtime
Date: Wed,  7 Jun 2017 12:35:17 +0100
Message-ID: <20170607113517.29270-1-colin.king@canonical.com>
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
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkdpdmUgZnVu
Y3Rpb24gbm91dmVhdV9wbW9wc19ydW50aW1lIGEgdm9pZCBhcmd1bWVudCB0byBtYWtlIGl0IGFu
IEFOU0kKZnVuY3Rpb24gZGVjbGFyYXRpb24uIEZpeGVzIHNwYXJzZSB3YXJuaW5nOgoKd2Fybmlu
Zzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ25vdXZlYXVfcG1v
cHNfcnVudGltZScKClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCmluZGV4IDdhY2QxY2Y4YzVhNi4uOTA3NTdh
ZjliYzczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKQEAgLTcyNyw3ICs3
MjcsNyBAQCBub3V2ZWF1X3Btb3BzX3RoYXcoc3RydWN0IGRldmljZSAqZGV2KQogfQogCiBib29s
Ci1ub3V2ZWF1X3Btb3BzX3J1bnRpbWUoKQorbm91dmVhdV9wbW9wc19ydW50aW1lKHZvaWQpCiB7
CiAJaWYgKG5vdXZlYXVfcnVudGltZV9wbSA9PSAtMSkKIAkJcmV0dXJuIG5vdXZlYXVfaXNfb3B0
aW11cygpIHx8IG5vdXZlYXVfaXNfdjFfZHNtKCk7Ci0tIAoyLjExLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
