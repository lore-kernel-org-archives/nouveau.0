From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/24] drm/armada: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:23 +0100
Message-ID: <1461267765-10785-3-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

Q2M6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm0ubGludXgub3JnLnVrPgpTaWduZWQtb2Zm
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRl
L3VhcGkvZHJtL2FybWFkYV9kcm0uaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FybWFkYV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0vYXJtYWRhX2RybS5oCmluZGV4IDZkZTdmMDEuLjcyZTMyNmYgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYXJtYWRhX2RybS5oCisrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vYXJtYWRhX2RybS5oCkBAIC0xMSw2ICsxMSwxMCBAQAogCiAjaW5jbHVkZSAiZHJtLmgi
CiAKKyNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQorZXh0ZXJuICJDIiB7CisjZW5kaWYKKwogI2Rl
ZmluZSBEUk1fQVJNQURBX0dFTV9DUkVBVEUJCTB4MDAKICNkZWZpbmUgRFJNX0FSTUFEQV9HRU1f
TU1BUAkJMHgwMgogI2RlZmluZSBEUk1fQVJNQURBX0dFTV9QV1JJVEUJCTB4MDMKQEAgLTQ0LDQg
KzQ4LDggQEAgc3RydWN0IGRybV9hcm1hZGFfZ2VtX3B3cml0ZSB7CiAjZGVmaW5lIERSTV9JT0NU
TF9BUk1BREFfR0VNX1BXUklURSBcCiAJQVJNQURBX0lPQ1RMKElPVywgR0VNX1BXUklURSwgZ2Vt
X3B3cml0ZSkKIAorI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCit9CisjZW5kaWYKKwogI2VuZGlm
Ci0tIAoyLjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
