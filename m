From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/8] drm/nouveau: switch to gem vma offset manager
Date: Thu,  5 Sep 2019 09:05:03 +0200
Message-ID: <20190905070509.22407-3-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190905070509.22407-1-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

UGFzcyBnZW0gdm1hX29mZnNldF9tYW5hZ2VyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpLCBzbyB0
dG0gdXNlcyBpdAppbnN0ZWFkIG9mIGl0cyBvd24gZW1iZWRkZWQgc3RydWN0LiAgVGhpcyBtYWtl
cyBzb21lIGdlbSBmdW5jdGlvbnMKKHNwZWNpZmljYWxseSBkcm1fZ2VtX29iamVjdF9sb29rdXAp
IHdvcmsgb24gdHRtIG9iamVjdHMuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKaW5kZXggZTY3ZWIxMDg0M2QxLi43N2Ew
YzZhZDNjZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwpAQCAtMjM2LDcg
KzIzNiw3IEBAIG5vdXZlYXVfdHRtX2luaXQoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0pCiAJcmV0
ID0gdHRtX2JvX2RldmljZV9pbml0KCZkcm0tPnR0bS5iZGV2LAogCQkJCSAgJm5vdXZlYXVfYm9f
ZHJpdmVyLAogCQkJCSAgZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmcsCi0JCQkJIE5VTEwsCisJ
CQkJICBkZXYtPnZtYV9vZmZzZXRfbWFuYWdlciwKIAkJCQkgIGRybS0+Y2xpZW50Lm1tdS5kbWFi
aXRzIDw9IDMyID8gdHJ1ZSA6IGZhbHNlKTsKIAlpZiAocmV0KSB7CiAJCU5WX0VSUk9SKGRybSwg
ImVycm9yIGluaXRpYWxpc2luZyBibyBkcml2ZXIsICVkXG4iLCByZXQpOwotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
