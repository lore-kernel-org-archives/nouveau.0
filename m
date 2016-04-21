From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 24/24] drm/vmwgfx: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:45 +0100
Message-ID: <1461267765-10785-25-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Brian Paul <brianp-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Q2M6IFNpbmNsYWlyIFllaCA8c3llaEB2bXdhcmUuY29tPgpDYzogVGhvbWFzIEhlbGxzdHJvbSA8
dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpDYzogQnJpYW4gUGF1bCA8YnJpYW5wQHZtd2FyZS5jb20+
ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgot
LS0KIGluY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oIHwgOSArKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3Zt
d2dmeF9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCmluZGV4IDViNjhiNGQu
LmQzMjVhNDEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCisrKyBi
L2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCkBAIC0zMCw2ICszMCwxMCBAQAogCiAjaW5j
bHVkZSAiZHJtLmgiCiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQorZXh0ZXJuICJDIiB7Cisj
ZW5kaWYKKwogI2RlZmluZSBEUk1fVk1XX01BWF9TVVJGQUNFX0ZBQ0VTIDYKICNkZWZpbmUgRFJN
X1ZNV19NQVhfTUlQX0xFVkVMUyAyNAogCkBAIC0xMDg3LDQgKzEwOTEsOSBAQCB1bmlvbiBkcm1f
dm13X2V4dGVuZGVkX2NvbnRleHRfYXJnIHsKIAllbnVtIGRybV92bXdfZXh0ZW5kZWRfY29udGV4
dCByZXE7CiAJc3RydWN0IGRybV92bXdfY29udGV4dF9hcmcgcmVwOwogfTsKKworI2lmIGRlZmlu
ZWQoX19jcGx1c3BsdXMpCit9CisjZW5kaWYKKwogI2VuZGlmCi0tIAoyLjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
