From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 2/2] pbus/hwsq: Make code size u16
Date: Thu, 12 Mar 2015 20:43:23 +0100
Message-ID: <1426189403-5381-2-git-send-email-rspliet@eclipso.eu>
References: <1426189403-5381-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1426189403-5381-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org, "Mailinglist <nouveau"@lists.freedesktop.org
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

U28gd2UgY2FuIGFjdHVhbGx5IHVzZSB0aGUgZnVsbCA1MTIgYnl0ZSBjb2RlIHNwYWNlCgpTaWdu
ZWQtb2ZmLWJ5OiBSb3kgU3BsaWV0IDxyc3BsaWV0QGVjbGlwc28uZXU+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL2h3c3EuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2J1cy9od3NxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9idXMvaHdzcS5jCmluZGV4IGI4ODUzYmYuLjc2MjJiNDEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2J1cy9od3NxLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL2h3c3EuYwpAQCAt
MjksNyArMjksNyBAQCBzdHJ1Y3QgbnZrbV9od3NxIHsKIAl1MzIgZGF0YTsKIAlzdHJ1Y3Qgewog
CQl1OCBkYXRhWzUxMl07Ci0JCXU4IHNpemU7CisJCXUxNiBzaXplOwogCX0gYzsKIH07CiAKLS0g
CjIuMS4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
