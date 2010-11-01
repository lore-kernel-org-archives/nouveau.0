From: =?UTF-8?q?Viktor=20Novotn=C3=BD?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: [PATCH 1/4] nv05: Fix
	SCALED_IMAGE_FROM_MEMORY_COLOR_CONVERSION(from renouveau)
Date: Mon,  1 Nov 2010 01:22:46 +0100
Message-ID: <1288570969-8057-7-git-send-email-noviktor@seznam.cz>
References: <1288570969-8057-1-git-send-email-noviktor@seznam.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1288570969-8057-1-git-send-email-noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

RnJvbTogVmlrdG9yIE5vdm90bsO9IDxub3Zpa3RvckBzZXpuYW0uY3o+CgotLS0KIG52MDFfMmQu
eG1sIHwgICAgMiArLQogMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbnYwMV8yZC54bWwgYi9udjAxXzJkLnhtbAppbmRleCBmY2I1
MzgyLi45MWYxZGQ4IDEwMDY0NAotLS0gYS9udjAxXzJkLnhtbAorKysgYi9udjAxXzJkLnhtbApA
QCAtNTUyLDcgKzU1Miw3IEBAIHhzaTpzY2hlbWFMb2NhdGlvbj0iaHR0cDovL25vdXZlYXUuZnJl
ZWRlc2t0b3Aub3JnLyBydWxlcy1uZy54c2QiPgogCQkJCTxkb2M+QWNjZXB0cyBOVjA0X0NPTlRF
WFRfU1VSRkFDRVNfMkQgYW5kIHVwLCBOVjA0X1NXSVpaTEVEX1NVUkZBQ0UgYW5kIHVwPC9kb2M+
CiAJCQk8L3JlZzMyPgogCQk8L3N0cmlwZT4KLQkJPHJlZzMyIG9mZnNldD0iMHgwMmZjIiBuYW1l
PSJDT0xPUl9DT05WRVJTSU9OIiB0eXBlPSJudjA1X2NvbG9yX2NvbnZlcnNpb24iLz4KKwkJPHJl
ZzMyIG9mZnNldD0iMHgwMmZjIiBuYW1lPSJDT0xPUl9DT05WRVJTSU9OIiB0eXBlPSJudjA1X2Nv
bG9yX2NvbnZlcnNpb24iIHZhcmlhbnRzPSJOVjA1X1NDQUxFRF9JTUFHRV9GUk9NX01FTU9SWS0i
Lz4KIAkJPHJlZzMyIG9mZnNldD0iMHgwMzAwIiBuYW1lPSJDT0xPUl9GT1JNQVQiPgogCQkJPHZh
bHVlIHZhbHVlPSIweDAwMDEiIG5hbWU9IkExUjVHNUI1Ii8+CiAJCQk8dmFsdWUgdmFsdWU9IjB4
MDAwMiIgbmFtZT0iWDFSNUc1QjUiLz4KLS0gCjEuNy4zLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
