From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] kms: no need to check for empty edid before
	drm_detect_hdmi_monitor
Date: Tue,  3 Nov 2015 21:14:26 -0500
Message-ID: <1446603266-14685-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIGRy
bS9ub3V2ZWF1L252NTBfZGlzcGxheS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5jIGIvZHJtL25vdXZl
YXUvbnY1MF9kaXNwbGF5LmMKaW5kZXggYmRhYmE5MS4uZDljYmE4NyAxMDA2NDQKLS0tIGEvZHJt
L25vdXZlYXUvbnY1MF9kaXNwbGF5LmMKKysrIGIvZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5LmMK
QEAgLTc3Myw3ICs3NzMsNiBAQCBudjUwX2NydGNfc2V0X3NjYWxlKHN0cnVjdCBub3V2ZWF1X2Ny
dGMgKm52X2NydGMsIGJvb2wgdXBkYXRlKQogCSAqLwogCWlmIChudl9jb25uZWN0b3IgJiYgKCBu
dl9jb25uZWN0b3ItPnVuZGVyc2NhbiA9PSBVTkRFUlNDQU5fT04gfHwKIAkJCSAgICAgKG52X2Nv
bm5lY3Rvci0+dW5kZXJzY2FuID09IFVOREVSU0NBTl9BVVRPICYmCi0JCQkgICAgICBudl9jb25u
ZWN0b3ItPmVkaWQgJiYKIAkJCSAgICAgIGRybV9kZXRlY3RfaGRtaV9tb25pdG9yKG52X2Nvbm5l
Y3Rvci0+ZWRpZCkpKSkgewogCQl1MzIgYlggPSBudl9jb25uZWN0b3ItPnVuZGVyc2Nhbl9oYm9y
ZGVyOwogCQl1MzIgYlkgPSBudl9jb25uZWN0b3ItPnVuZGVyc2Nhbl92Ym9yZGVyOwotLSAKMi40
LjEwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
