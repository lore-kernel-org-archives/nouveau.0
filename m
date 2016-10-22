From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 06/17] drm/nouveau/gpio: mark symbol static where
	possible
Date: Sat, 22 Oct 2016 17:41:47 +0800
Message-ID: <1477129318-29677-6-git-send-email-baoyou.xie@linaro.org>
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
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9nazEwNC5jOjQxOjE6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2drMTA0X2dwaW9faW50cl9tYXNrJyBbLVdtaXNzaW5n
LXByb3RvdHlwZXNdCgpJbiBmYWN0LCB0aGlzIGZ1bmN0aW9uIGlzIG9ubHkgdXNlZCBpbiB0aGUg
ZmlsZSBpbiB3aGljaCBpdCBpcwpkZWNsYXJlZCBhbmQgZG9uJ3QgbmVlZCBhIGRlY2xhcmF0aW9u
LCBidXQgY2FuIGJlIG1hZGUgc3RhdGljLgpTbyB0aGlzIHBhdGNoIG1hcmtzIHRoaXMgZnVuY3Rp
b24gd2l0aCAnc3RhdGljJy4KClNpZ25lZC1vZmYtYnk6IEJhb3lvdSBYaWUgPGJhb3lvdS54aWVA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9ncGlv
L2drMTA0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9n
cGlvL2drMTA0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9ncGlvL2dr
MTA0LmMKaW5kZXggM2Y0NWFmZDEuLjJlYWQ1MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vZ2sxMDQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9ncGlvL2drMTA0LmMKQEAgLTM3LDcgKzM3LDcgQEAgZ2sxMDRf
Z3Bpb19pbnRyX3N0YXQoc3RydWN0IG52a21fZ3BpbyAqZ3BpbywgdTMyICpoaSwgdTMyICpsbykK
IAludmttX3dyMzIoZGV2aWNlLCAweDAwZGM4MCwgaW50cjEpOwogfQogCi12b2lkCitzdGF0aWMg
dm9pZAogZ2sxMDRfZ3Bpb19pbnRyX21hc2soc3RydWN0IG52a21fZ3BpbyAqZ3BpbywgdTMyIHR5
cGUsIHUzMiBtYXNrLCB1MzIgZGF0YSkKIHsKIAlzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSA9
IGdwaW8tPnN1YmRldi5kZXZpY2U7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
