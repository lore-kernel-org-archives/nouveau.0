From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 33/37] drm/nouveau/debugfs: Fix check of
 pm_runtime_get_sync failure
Date: Fri, 29 Mar 2019 20:54:34 -0400
Message-ID: <20190330005441.27540-33-sashal@kernel.org>
References: <20190330005441.27540-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190330005441.27540-1-sashal@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgOTA5ZTljOWM0MjgzNzZlMmE0M2QxNzhlZDRiMGEyZDViYTljYjdkMyBdCgpwbV9ydW50aW1l
X2dldF9zeW5jIHJldHVybnMgbmVnYXRpdmUgb24gZmFpbHVyZS4KCkZpeGVzOiBlYWViOTAxMGJi
NGIgKCJkcm0vbm91dmVhdS9kZWJ1Z2ZzOiBXYWtlIHVwIEdQVSBiZWZvcmUgZG9pbmcgYW55IHJl
Y2xvY2tpbmciKQpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5j
b20+ClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RlYnVnZnMuYwppbmRleCA5MTA5YjY5Y2QwNTIuLjk2MzU3MDRhMWQ4NiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKQEAgLTE2MSw3ICsxNjEsNyBAQCBu
b3V2ZWF1X2RlYnVnZnNfcHN0YXRlX3NldChzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBf
X3VzZXIgKnVidWYsCiAJfQogCiAJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhkcm0tPmRldik7
Ci0JaWYgKElTX0VSUl9WQUxVRShyZXQpICYmIHJldCAhPSAtRUFDQ0VTKQorCWlmIChyZXQgPCAw
ICYmIHJldCAhPSAtRUFDQ0VTKQogCQlyZXR1cm4gcmV0OwogCXJldCA9IG52aWZfbXRoZChjdHJs
LCBOVklGX0NPTlRST0xfUFNUQVRFX1VTRVIsICZhcmdzLCBzaXplb2YoYXJncykpOwogCXBtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRybS0+ZGV2KTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
