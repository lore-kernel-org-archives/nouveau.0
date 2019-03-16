From: Jon Derrick <jonathan.derrick-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] drm/nouveau/bar/nv50: check bar1 vmm return
 value
Date: Fri, 15 Mar 2019 18:05:15 -0600
Message-ID: <20190316000518.3081-2-jonathan.derrick@intel.com>
References: <20190316000518.3081-1-jonathan.derrick@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190316000518.3081-1-jonathan.derrick-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Derrick <jonathan.derrick-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Q2hlY2sgYmFyMSdzIG5ldyB2bW0gY3JlYXRpb24gcmV0dXJuIHZhbHVlIGZvciBlcnJvcnMuCgpT
aWduZWQtb2ZmLWJ5OiBKb24gRGVycmljayA8am9uYXRoYW4uZGVycmlja0BpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmFyL252NTAuYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iYXIvbnY1MC5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvYmFyL252NTAuYwppbmRleCAxNTdiMDc2YTEyNzIuLjhlNjRiMTlm
M2Y4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmFy
L252NTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iYXIvbnY1
MC5jCkBAIC0xNjgsNiArMTY4LDggQEAgbnY1MF9iYXJfb25laW5pdChzdHJ1Y3QgbnZrbV9iYXIg
KmJhc2UpCiAKIAlyZXQgPSBudmttX3ZtbV9uZXcoZGV2aWNlLCBzdGFydCwgbGltaXQtLSAtIHN0
YXJ0LCBOVUxMLCAwLAogCQkJICAgJmJhcjFfbG9jaywgImJhcjEiLCAmYmFyLT5iYXIxX3ZtbSk7
CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAogCWF0b21pY19pbmMoJmJhci0+YmFyMV92bW0t
PmVuZ3JlZltOVktNX1NVQkRFVl9CQVJdKTsKIAliYXItPmJhcjFfdm1tLT5kZWJ1ZyA9IGJhci0+
YmFzZS5zdWJkZXYuZGVidWc7Ci0tIAoyLjE0LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
