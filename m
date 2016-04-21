From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 18/24] drm/sis: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:39 +0100
Message-ID: <1461267765-10785-19-git-send-email-emil.l.velikov@gmail.com>
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
LQogaW5jbHVkZS91YXBpL2RybS9zaXNfZHJtLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9zaXNfZHJt
LmggYi9pbmNsdWRlL3VhcGkvZHJtL3Npc19kcm0uaAppbmRleCAzNzQ4NThjLi4zZjdkOGNhIDEw
MDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3Npc19kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL3Npc19kcm0uaApAQCAtMjcsNiArMjcsMTAgQEAKICNpZm5kZWYgX19TSVNfRFJNX0hfXwog
I2RlZmluZSBfX1NJU19EUk1fSF9fCiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQorZXh0ZXJu
ICJDIiB7CisjZW5kaWYKKwogLyogU2lTIHNwZWNpZmljIGlvY3RscyAqLwogI2RlZmluZSBOT1Rf
VVNFRF8wXzMKICNkZWZpbmUgRFJNX1NJU19GQl9BTExPQwkweDA0CkBAIC02NCw0ICs2OCw4IEBA
IHR5cGVkZWYgc3RydWN0IHsKIAl1bnNpZ25lZCBsb25nIG9mZnNldCwgc2l6ZTsKIH0gZHJtX3Np
c19mYl90OwogCisjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK30KKyNlbmRpZgorCiAjZW5kaWYJ
CQkJLyogX19TSVNfRFJNX0hfXyAqLwotLSAKMi42LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQo=
