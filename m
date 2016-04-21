From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/24] drm/mga: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:29 +0100
Message-ID: <1461267765-10785-9-git-send-email-emil.l.velikov@gmail.com>
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
LQogaW5jbHVkZS91YXBpL2RybS9tZ2FfZHJtLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9tZ2FfZHJt
LmggYi9pbmNsdWRlL3VhcGkvZHJtL21nYV9kcm0uaAppbmRleCBmY2E4MTcwLi44YzQzMzc1IDEw
MDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL21nYV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL21nYV9kcm0uaApAQCAtMzcsNiArMzcsMTAgQEAKIAogI2luY2x1ZGUgImRybS5oIgogCisj
aWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK2V4dGVybiAiQyIgeworI2VuZGlmCisKIC8qIFdBUk5J
Tkc6IElmIHlvdSBjaGFuZ2UgYW55IG9mIHRoZXNlIGRlZmluZXMsIG1ha2Ugc3VyZSB0byBjaGFu
Z2UgdGhlCiAgKiBkZWZpbmVzIGluIHRoZSBYc2VydmVyIGZpbGUgKG1nYV9zYXJlYS5oKQogICov
CkBAIC00MTYsNCArNDIwLDggQEAgdHlwZWRlZiBzdHJ1Y3QgZHJtX21nYV9nZXRwYXJhbSB7CiAJ
dm9pZCBfX3VzZXIgKnZhbHVlOwogfSBkcm1fbWdhX2dldHBhcmFtX3Q7CiAKKyNpZiBkZWZpbmVk
KF9fY3BsdXNwbHVzKQorfQorI2VuZGlmCisKICNlbmRpZgotLSAKMi42LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
