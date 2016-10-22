From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 07/17] drm/nouveau/secboot: mark symbol static
	where possible
Date: Sat, 22 Oct 2016 17:41:48 +0800
Message-ID: <1477129318-29677-7-git-send-email-baoyou.xie@linaro.org>
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
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvc2VjYm9vdC9nbTIwMC5jOjEzNjg6MTogd2Fybmlu
Zzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnZ20yMDBfc2VjYm9vdF9maW5pJyBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpJbiBmYWN0LCB0aGlzIGZ1bmN0aW9uIGlzIG9ubHkgdXNlZCBpbiB0
aGUgZmlsZSBpbiB3aGljaCBpdCBpcwpkZWNsYXJlZCBhbmQgZG9uJ3QgbmVlZCBhIGRlY2xhcmF0
aW9uLCBidXQgY2FuIGJlIG1hZGUgc3RhdGljLgpTbyB0aGlzIHBhdGNoIG1hcmtzIHRoaXMgZnVu
Y3Rpb24gd2l0aCAnc3RhdGljJy4KClNpZ25lZC1vZmYtYnk6IEJhb3lvdSBYaWUgPGJhb3lvdS54
aWVAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9z
ZWNib290L2dtMjAwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9zZWNib290L2dtMjAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9zZWNib290L2dtMjAwLmMKaW5kZXggZjFlMmRjOS4uZWM0OGU0YSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvc2VjYm9vdC9nbTIwMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3NlY2Jvb3QvZ20yMDAuYwpAQCAtMTM2
NCw3ICsxMzY0LDcgQEAgZ20yMDBfc2VjYm9vdF9pbml0KHN0cnVjdCBudmttX3NlY2Jvb3QgKnNi
KQogCXJldHVybiAwOwogfQogCi1pbnQKK3N0YXRpYyBpbnQKIGdtMjAwX3NlY2Jvb3RfZmluaShz
dHJ1Y3QgbnZrbV9zZWNib290ICpzYiwgYm9vbCBzdXNwZW5kKQogewogCXN0cnVjdCBnbTIwMF9z
ZWNib290ICpnc2IgPSBnbTIwMF9zZWNib290KHNiKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
