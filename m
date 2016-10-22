From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 03/17] drm/nouveau/clk: mark symbol static where
	possible
Date: Sat, 22 Oct 2016 17:41:44 +0800
Message-ID: <1477129318-29677-3-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org, nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, tang.qiang007-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, han.fei-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: nouveau.vger.kernel.org

V2UgZ2V0IDEgd2FybmluZyB3aGVuIGJ1aWxkaW5nIGtlcm5lbCB3aXRoIFc9MToKZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1LmM6MTg0OjE6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2d0MjE1X2Nsa19pbmZvJyBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCgpJbiBmYWN0LCB0aGlzIGZ1bmN0aW9uIGlzIG9ubHkgdXNlZCBpbiB0aGUgZmlsZSBp
biB3aGljaCBpdCBpcwpkZWNsYXJlZCBhbmQgZG9uJ3QgbmVlZCBhIGRlY2xhcmF0aW9uLCBidXQg
Y2FuIGJlIG1hZGUgc3RhdGljLgpTbyB0aGlzIHBhdGNoIG1hcmtzIHRoaXMgZnVuY3Rpb24gd2l0
aCAnc3RhdGljJy4KClNpZ25lZC1vZmYtYnk6IEJhb3lvdSBYaWUgPGJhb3lvdS54aWVAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ3QyMTUu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9ndDIx
NS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1LmMKaW5k
ZXggMDU2NzAyZS4uOTZlMDk0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvY2xrL2d0MjE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvY2xrL2d0MjE1LmMKQEAgLTE4MCw3ICsxODAsNyBAQCBndDIxNV9jbGtfcmVhZChz
dHJ1Y3QgbnZrbV9jbGsgKmJhc2UsIGVudW0gbnZfY2xrX3NyYyBzcmMpCiAJcmV0dXJuIDA7CiB9
CiAKLWludAorc3RhdGljIGludAogZ3QyMTVfY2xrX2luZm8oc3RydWN0IG52a21fY2xrICpiYXNl
LCBpbnQgaWR4LCB1MzIga2h6LAogCSAgICAgICBzdHJ1Y3QgZ3QyMTVfY2xrX2luZm8gKmluZm8p
CiB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
