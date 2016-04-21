From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/24] drm/qxl: add extern C guard for the UAPI
	header
Date: Thu, 21 Apr 2016 20:42:34 +0100
Message-ID: <1461267765-10785-14-git-send-email-emil.l.velikov@gmail.com>
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

Q2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVs
aWtvdkBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9xeGxfZHJtLmggfCA4ICsrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS9xeGxfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3F4bF9kcm0uaAppbmRleCA0
ZDFlMzI2Li5jZDk5ZGEwIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3F4bF9kcm0uaAor
KysgYi9pbmNsdWRlL3VhcGkvZHJtL3F4bF9kcm0uaApAQCAtMjYsNiArMjYsMTAgQEAKIAogI2lu
Y2x1ZGUgImRybS5oIgogCisjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKK2V4dGVybiAiQyIgewor
I2VuZGlmCisKIC8qIFBsZWFzZSBub3RlIHRoYXQgbW9kaWZpY2F0aW9ucyB0byBhbGwgc3RydWN0
cyBkZWZpbmVkIGhlcmUgYXJlCiAgKiBzdWJqZWN0IHRvIGJhY2t3YXJkcy1jb21wYXRpYmlsaXR5
IGNvbnN0cmFpbnRzLgogICoKQEAgLTE0OCw0ICsxNTIsOCBAQCBzdHJ1Y3QgZHJtX3F4bF9hbGxv
Y19zdXJmIHsKIAlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1FYTF9BTExPQ19TVVJG
LFwKIAkJc3RydWN0IGRybV9xeGxfYWxsb2Nfc3VyZikKIAorI2lmIGRlZmluZWQoX19jcGx1c3Bs
dXMpCit9CisjZW5kaWYKKwogI2VuZGlmCi0tIAoyLjYuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
