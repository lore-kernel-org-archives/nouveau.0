From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 16/17] drm/nouveau/dispnv04: add missing header
	dependencies
Date: Sat, 22 Oct 2016 17:41:57 +0800
Message-ID: <1477129318-29677-16-git-send-email-baoyou.xie@linaro.org>
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
cHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3ZlcmxheS5jOjQ5NjoxOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yICdub3V2ZWF1X292ZXJsYXlfaW5pdCcgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQoKSW4gZmFjdCwgdGhpcyBmdW5jdGlvbiBpcyBkZWNsYXJlZCBpbgpkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnYwNC9kaXNwLmguClNvIHRoaXMgcGF0Y2ggYWRkcyBtaXNzaW5n
IGhlYWRlciBkZXBlbmRlbmNpZXMuCgpTaWduZWQtb2ZmLWJ5OiBCYW95b3UgWGllIDxiYW95b3Uu
eGllQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3Zl
cmxheS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3Zlcmxh
eS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3ZlcmxheS5jCmluZGV4IGVj
NDQ0ZWEuLmE3OTUxNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djA0L292ZXJsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9vdmVy
bGF5LmMKQEAgLTMzLDcgKzMzLDcgQEAKICNpbmNsdWRlICJub3V2ZWF1X2Nvbm5lY3Rvci5oIgog
I2luY2x1ZGUgIm5vdXZlYXVfZGlzcGxheS5oIgogI2luY2x1ZGUgIm52cmVnLmgiCi0KKyNpbmNs
dWRlICJkaXNwLmgiCiAKIHN0cnVjdCBub3V2ZWF1X3BsYW5lIHsKIAlzdHJ1Y3QgZHJtX3BsYW5l
IGJhc2U7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
