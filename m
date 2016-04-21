From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/24] drm/r128: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:36 +0100
Message-ID: <1461267765-10785-16-git-send-email-emil.l.velikov@gmail.com>
References: <1461267765-10785-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1461267765-10785-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0t
LQogaW5jbHVkZS91YXBpL2RybS9yMTI4X2RybS5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vcjEyOF9k
cm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vcjEyOF9kcm0uaAppbmRleCA3YTQ0YzY1Li42OTBlOWM2
IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3IxMjhfZHJtLmgKKysrIGIvaW5jbHVkZS91
YXBpL2RybS9yMTI4X2RybS5oCkBAIC0zNSw2ICszNSwxMCBAQAogCiAjaW5jbHVkZSAiZHJtLmgi
CiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQorZXh0ZXJuICJDIiB7CisjZW5kaWYKKwogLyog
V0FSTklORzogSWYgeW91IGNoYW5nZSBhbnkgb2YgdGhlc2UgZGVmaW5lcywgbWFrZSBzdXJlIHRv
IGNoYW5nZSB0aGUKICAqIGRlZmluZXMgaW4gdGhlIFggc2VydmVyIGZpbGUgKHIxMjhfc2FyZWEu
aCkKICAqLwpAQCAtMzI1LDQgKzMyOSw4IEBAIHR5cGVkZWYgc3RydWN0IGRybV9yMTI4X2dldHBh
cmFtIHsKIAl2b2lkIF9fdXNlciAqdmFsdWU7CiB9IGRybV9yMTI4X2dldHBhcmFtX3Q7CiAKKyNp
ZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQorfQorI2VuZGlmCisKICNlbmRpZgotLSAKMi42LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
