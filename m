From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 23/24] drm/virgl: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:44 +0100
Message-ID: <1461267765-10785-24-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Q2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVs
aWtvdkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oIHwgOCAr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9k
cm0uaAppbmRleCBjNzRmMWY5Li45MWEzMWZmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L3ZpcnRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oCkBAIC0y
Niw2ICsyNiwxMCBAQAogCiAjaW5jbHVkZSAiZHJtLmgiCiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNw
bHVzKQorZXh0ZXJuICJDIiB7CisjZW5kaWYKKwogLyogUGxlYXNlIG5vdGUgdGhhdCBtb2RpZmlj
YXRpb25zIHRvIGFsbCBzdHJ1Y3RzIGRlZmluZWQgaGVyZSBhcmUKICAqIHN1YmplY3QgdG8gYmFj
a3dhcmRzLWNvbXBhdGliaWxpdHkgY29uc3RyYWludHMuCiAgKgpAQCAtMTYzLDQgKzE2Nyw4IEBA
IHN0cnVjdCBkcm1fdmlydGdwdV9nZXRfY2FwcyB7CiAJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFT
RSArIERSTV9WSVJUR1BVX0dFVF9DQVBTLCBcCiAJc3RydWN0IGRybV92aXJ0Z3B1X2dldF9jYXBz
KQogCisjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK30KKyNlbmRpZgorCiAjZW5kaWYKLS0gCjIu
Ni4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
