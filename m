From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/24] drm/i915: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:28 +0100
Message-ID: <1461267765-10785-8-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFuaSBOaWt1
bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxp
a292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9pOTE1
X2RybS5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0v
aTkxNV9kcm0uaAppbmRleCBhNTUyNGNjLi5jMTdkNjNkIDEwMDY0NAotLS0gYS9pbmNsdWRlL3Vh
cGkvZHJtL2k5MTVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oCkBAIC0y
OSw2ICsyOSwxMCBAQAogCiAjaW5jbHVkZSAiZHJtLmgiCiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNw
bHVzKQorZXh0ZXJuICJDIiB7CisjZW5kaWYKKwogLyogUGxlYXNlIG5vdGUgdGhhdCBtb2RpZmlj
YXRpb25zIHRvIGFsbCBzdHJ1Y3RzIGRlZmluZWQgaGVyZSBhcmUKICAqIHN1YmplY3QgdG8gYmFj
a3dhcmRzLWNvbXBhdGliaWxpdHkgY29uc3RyYWludHMuCiAgKi8KQEAgLTExNzAsNCArMTE3NCw4
IEBAIHN0cnVjdCBkcm1faTkxNV9nZW1fY29udGV4dF9wYXJhbSB7CiAJX191NjQgdmFsdWU7CiB9
OwogCisjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK30KKyNlbmRpZgorCiAjZW5kaWYgLyogX1VB
UElfSTkxNV9EUk1fSF8gKi8KLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXUK
