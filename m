From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix crash with noaccel=1
Date: Sun, 11 Nov 2012 20:00:09 +0100
Message-ID: <20121111190009.GD3530@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ortwin =?utf-8?B?R2zDvGNr?= <odi-L693kI9kcNY@public.gmane.org>
List-Id: nouveau.vger.kernel.org

ClJlcG9ydGVkLWJ5OiBPcnR3aW4gR2zDvGNrIDxvZGlAb2RpLmNoPgpTaWduZWQtb2ZmLWJ5OiBN
YXJjaW4gU2x1c2FyeiA8bWFyY2luLnNsdXNhcnpAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYWJpMTYuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuYwppbmRl
eCBjYzc5Yzc5Li5jYmYxZmM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2FiaTE2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkx
Ni5jCkBAIC0yNDEsNiArMjQxLDEwIEBAIG5vdXZlYXVfYWJpMTZfaW9jdGxfY2hhbm5lbF9hbGxv
YyhBQkkxNl9JT0NUTF9BUkdTKQogCiAJaWYgKHVubGlrZWx5KCFhYmkxNikpCiAJCXJldHVybiAt
RU5PTUVNOworCisJaWYgKCFkcm0tPmNoYW5uZWwpCisJCXJldHVybiBub3V2ZWF1X2FiaTE2X3B1
dChhYmkxNiwgLUVOT0RFVik7CisKIAljbGllbnQgPSBudl9jbGllbnQoYWJpMTYtPmNsaWVudCk7
CiAKIAlpZiAoaW5pdC0+ZmJfY3R4ZG1hX2hhbmRsZSA9PSB+MCB8fCBpbml0LT50dF9jdHhkbWFf
aGFuZGxlID09IH4wKQotLSAKMS43LjEyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQo=
