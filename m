From: Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>
Subject: [PATCH v2 4/4] pmu/fuc: use imm32 in ld/st macros
Date: Wed,  2 Mar 2016 17:23:07 +0100
Message-ID: <1456935787-6514-5-git-send-email-nouveau@karolherbst.de>
References: <1456935787-6514-1-git-send-email-nouveau@karolherbst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1456935787-6514-1-git-send-email-nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxub3V2ZWF1QGthcm9saGVyYnN0LmRlPgpSZXZp
ZXdlZC1ieTogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAZnJlZS5mcj4KLS0tCiBkcm0vbm91
dmVhdS9udmttL3N1YmRldi9wbXUvZnVjL21hY3Jvcy5mdWMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcG11L2Z1Yy9tYWNyb3MuZnVjIGIvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcG11L2Z1Yy9tYWNyb3MuZnVjCmluZGV4IDBkNWNiZWIuLjM3MzdiZDIgMTAwNjQ0Ci0t
LSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BtdS9mdWMvbWFjcm9zLmZ1YworKysgYi9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9wbXUvZnVjL21hY3Jvcy5mdWMKQEAgLTI1MiwxMiArMjUyLDEy
IEBACiAjZW5kaWYKIAogI2RlZmluZSBzdChzaXplLCBhZGRyLCByZWcpIC8qCi0qLwltb3Z3ICRy
MCBhZGRyIC8qCisqLwlpbW0zMigkcjAsIGFkZHIpIC8qCiAqLwlzdCBzaXplIERbJHIwXSByZWcg
LyoKICovCWNsZWFyIGIzMiAkcjAKIAogI2RlZmluZSBsZChzaXplLCByZWcsIGFkZHIpIC8qCi0q
Lwltb3Z3ICRyMCBhZGRyIC8qCisqLwlpbW0zMigkcjAsIGFkZHIpICAvKgogKi8JbGQgc2l6ZSBy
ZWcgRFskcjBdIC8qCiAqLwljbGVhciBiMzIgJHIwCiAKLS0gCjIuNy4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
