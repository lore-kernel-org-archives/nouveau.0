From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/24] drm/amdgpu: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:22 +0100
Message-ID: <1461267765-10785-2-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBW
ZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9h
bWRncHVfZHJtLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3Vh
cGkvZHJtL2FtZGdwdV9kcm0uaAppbmRleCA0NTNhNzZhLi5jZGVjZjg3IDEwMDY0NAotLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdw
dV9kcm0uaApAQCAtMzQsNiArMzQsMTAgQEAKIAogI2luY2x1ZGUgImRybS5oIgogCisjaWYgZGVm
aW5lZChfX2NwbHVzcGx1cykKK2V4dGVybiAiQyIgeworI2VuZGlmCisKICNkZWZpbmUgRFJNX0FN
REdQVV9HRU1fQ1JFQVRFCQkweDAwCiAjZGVmaW5lIERSTV9BTURHUFVfR0VNX01NQVAJCTB4MDEK
ICNkZWZpbmUgRFJNX0FNREdQVV9DVFgJCQkweDAyCkBAIC02NDIsNCArNjQ2LDggQEAgc3RydWN0
IGRybV9hbWRncHVfaW5mb19od19pcCB7CiAjZGVmaW5lIEFNREdQVV9GQU1JTFlfVkkJCQkxMzAg
LyogSWNlbGFuZCwgVG9uZ2EgKi8KICNkZWZpbmUgQU1ER1BVX0ZBTUlMWV9DWgkJCTEzNSAvKiBD
YXJyaXpvLCBTdG9uZXkgKi8KIAorI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCit9CisjZW5kaWYK
KwogI2VuZGlmCi0tIAoyLjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
