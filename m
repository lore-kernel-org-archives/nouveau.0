From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: Use 0x5f instead of 0x9f as
	imageblit on original NV10.
Date: Sun, 11 Apr 2010 18:16:21 +0000
Message-ID: <1271009782-10254-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWFyY2luIEtvxZtjaWVsbmlja2kgPGtvcmlha2luQDB4MDQubmV0Pgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252MDRfZmJjb24uYyB8ICAgIDIgKy0KIDEgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252MDRfZmJjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252MDRfZmJjb24uYwppbmRleCA4MTNiMjVjLi43Y2Y5Mjg3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjA0X2ZiY29uLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnYwNF9mYmNvbi5jCkBAIC0yMzYsNyArMjM2LDcgQEAgbnYwNF9mYmNvbl9hY2Nl
bF9pbml0KHN0cnVjdCBmYl9pbmZvICppbmZvKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAK
LQlyZXQgPSBudjA0X2ZiY29uX2dyb2JqX25ldyhkZXYsIGRldl9wcml2LT5jYXJkX3R5cGUgPj0g
TlZfMTAgPworCXJldCA9IG52MDRfZmJjb25fZ3JvYmpfbmV3KGRldiwgZGV2X3ByaXYtPmNoaXBz
ZXQgPj0gMHgxMSA/CiAJCQkJICAgMHgwMDlmIDogMHgwMDVmLCBOdkltYWdlQmxpdCk7CiAJaWYg
KHJldCkKIAkJcmV0dXJuIHJldDsKLS0gCjEuNi40LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
