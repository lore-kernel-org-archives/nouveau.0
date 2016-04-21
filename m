From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 21/24] drm/vc4: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:42 +0100
Message-ID: <1461267765-10785-22-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

Q2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVs
aWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0vdmM0
X2RybS5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdmM0X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS92
YzRfZHJtLmgKaW5kZXggZWViMzdlMy4uYWYxMmU4YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBp
L2RybS92YzRfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS92YzRfZHJtLmgKQEAgLTI2LDYg
KzI2LDEwIEBACiAKICNpbmNsdWRlICJkcm0uaCIKIAorI2lmIGRlZmluZWQoX19jcGx1c3BsdXMp
CitleHRlcm4gIkMiIHsKKyNlbmRpZgorCiAjZGVmaW5lIERSTV9WQzRfU1VCTUlUX0NMICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDAKICNkZWZpbmUgRFJNX1ZDNF9XQUlUX1NFUU5PICAgICAg
ICAgICAgICAgICAgICAgICAgMHgwMQogI2RlZmluZSBEUk1fVkM0X1dBSVRfQk8gICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAyCkBAIC0yNzYsNCArMjgwLDggQEAgc3RydWN0IGRybV92YzRf
Z2V0X2hhbmdfc3RhdGUgewogCV9fdTMyIHBhZFsxNl07CiB9OwogCisjaWYgZGVmaW5lZChfX2Nw
bHVzcGx1cykKK30KKyNlbmRpZgorCiAjZW5kaWYgLyogX1VBUElfVkM0X0RSTV9IXyAqLwotLSAK
Mi42LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
