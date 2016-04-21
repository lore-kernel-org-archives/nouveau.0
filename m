From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 17/24] drm/savage: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:38 +0100
Message-ID: <1461267765-10785-18-git-send-email-emil.l.velikov@gmail.com>
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
LQogaW5jbHVkZS91YXBpL2RybS9zYXZhZ2VfZHJtLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9zYXZh
Z2VfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3NhdmFnZV9kcm0uaAppbmRleCA1NzQxNDc0Li4w
ZjZlZGRlIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3NhdmFnZV9kcm0uaAorKysgYi9p
bmNsdWRlL3VhcGkvZHJtL3NhdmFnZV9kcm0uaApAQCAtMjgsNiArMjgsMTAgQEAKIAogI2luY2x1
ZGUgImRybS5oIgogCisjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK2V4dGVybiAiQyIgeworI2Vu
ZGlmCisKICNpZm5kZWYgX19TQVZBR0VfU0FSRUFfREVGSU5FU19fCiAjZGVmaW5lIF9fU0FWQUdF
X1NBUkVBX0RFRklORVNfXwogCkBAIC0yMDksNCArMjEzLDggQEAgdW5pb24gZHJtX3NhdmFnZV9j
bWRfaGVhZGVyIHsKIAl9IGNsZWFyMTsJCS8qIFNBVkFHRV9DTURfQ0xFQVIgZGF0YSAqLwogfTsK
IAorI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCit9CisjZW5kaWYKKwogI2VuZGlmCi0tIAoyLjYu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
