From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/24] drm/nouveau: drop drm/ prefix from include
Date: Thu, 21 Apr 2016 20:42:32 +0100
Message-ID: <1461267765-10785-12-git-send-email-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

U2ltaWxhciB0byB0aGUgcmVzdCBvZiB0aGUgRFJNIFVBUEkgLSB0aGVzZSBhcmUgdG8gYmUgaW1w
b3J0ZWQKdW5tb2RpZmllZCBpbnRvIGxpYmRybS4gSW4gY3VycmVudCBmb3JtIHRoYXQncyBpbXBv
c3NpYmxlLgoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91
YXBpL2RybS9ub3V2ZWF1X2RybS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9ub3V2ZWF1
X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9ub3V2ZWF1X2RybS5oCmluZGV4IDhkMmRjMDUuLjI1
OTU4OGEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vbm91dmVhdV9kcm0uaAorKysgYi9p
bmNsdWRlL3VhcGkvZHJtL25vdXZlYXVfZHJtLmgKQEAgLTI3LDcgKzI3LDcgQEAKIAogI2RlZmlu
ZSBEUk1fTk9VVkVBVV9FVkVOVF9OVklGICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHg4MDAwMDAwMAogCi0jaW5jbHVkZSA8ZHJtL2RybS5oPgorI2luY2x1ZGUgImRybS5o
IgogCiAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKIGV4dGVybiAiQyIgewotLSAKMi42LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
