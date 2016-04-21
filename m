From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 16/24] drm/radeon: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:37 +0100
Message-ID: <1461267765-10785-17-git-send-email-emil.l.velikov@gmail.com>
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
ZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9y
YWRlb25fZHJtLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9yYWRlb25fZHJtLmggYi9pbmNsdWRlL3Vh
cGkvZHJtL3JhZGVvbl9kcm0uaAppbmRleCBjY2I5YmNkLi40OTBhNTljIDEwMDY0NAotLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL3JhZGVvbl9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL3JhZGVv
bl9kcm0uaApAQCAtMzUsNiArMzUsMTAgQEAKIAogI2luY2x1ZGUgImRybS5oIgogCisjaWYgZGVm
aW5lZChfX2NwbHVzcGx1cykKK2V4dGVybiAiQyIgeworI2VuZGlmCisKIC8qIFdBUk5JTkc6IElm
IHlvdSBjaGFuZ2UgYW55IG9mIHRoZXNlIGRlZmluZXMsIG1ha2Ugc3VyZSB0byBjaGFuZ2UgdGhl
CiAgKiBkZWZpbmVzIGluIHRoZSBYIHNlcnZlciBmaWxlIChyYWRlb25fc2FyZWEuaCkKICAqLwpA
QCAtMTA2Nyw0ICsxMDcxLDggQEAgc3RydWN0IGRybV9yYWRlb25faW5mbyB7CiAKICNkZWZpbmUg
Q0lLX1RJTEVfTU9ERV9ERVBUSF9TVEVOQ0lMXzFECQk1CiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNw
bHVzKQorfQorI2VuZGlmCisKICNlbmRpZgotLSAKMi42LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
