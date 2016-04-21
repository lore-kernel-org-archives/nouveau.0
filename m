From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 22/24] drm/via: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:43 +0100
Message-ID: <1461267765-10785-23-git-send-email-emil.l.velikov@gmail.com>
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
LQogaW5jbHVkZS91YXBpL2RybS92aWFfZHJtLmggfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS92aWFfZHJt
LmggYi9pbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaAppbmRleCBmYTIxZWQxLi5hMWUxMjVkIDEw
MDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL3ZpYV9kcm0uaApAQCAtMjYsNiArMjYsMTAgQEAKIAogI2luY2x1ZGUgImRybS5oIgogCisj
aWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK2V4dGVybiAiQyIgeworI2VuZGlmCisKIC8qIFdBUk5J
Tkc6IFRoZXNlIGRlZmluZXMgbXVzdCBiZSB0aGUgc2FtZSBhcyB3aGF0IHRoZSBYc2VydmVyIHVz
ZXMuCiAgKiBpZiB5b3UgY2hhbmdlIHRoZW0sIHlvdSBtdXN0IGNoYW5nZSB0aGUgZGVmaW5lcyBp
biB0aGUgWHNlcnZlci4KICAqLwpAQCAtMjcxLDQgKzI3NSw4IEBAIHR5cGVkZWYgc3RydWN0IGRy
bV92aWFfZG1hYmxpdCB7CiAJZHJtX3ZpYV9ibGl0c3luY190IHN5bmM7CiB9IGRybV92aWFfZG1h
YmxpdF90OwogCisjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK30KKyNlbmRpZgorCiAjZW5kaWYJ
CQkJLyogX1ZJQV9EUk1fSF8gKi8KLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXUK
