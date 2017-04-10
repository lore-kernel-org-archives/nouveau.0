From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 09/11] nvkm/ramgf100: Hook up ram training pattern
	init for NVC0+
Date: Mon, 10 Apr 2017 20:37:26 +0100
Message-ID: <20170410193728.29026-10-nouveau@spliet.org>
References: <20170410193728.29026-1-nouveau@spliet.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170410193728.29026-1-nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Ben Skeggs <bskeggsb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogUm95IFNwbGlldCA8bm91dmVhdUBzcGxpZXQub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbWdmMTAwLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbWdmMTAwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9yYW1nZjEwMC5jCmluZGV4IGE0Njk3
MTkuLmVlYmQyMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L2ZiL3JhbWdmMTAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvZmIvcmFtZ2YxMDAuYwpAQCAtNjUzLDggKzY1Myw3IEBAIGdmMTAwX3JhbV9pbml0KHN0cnVj
dCBudmttX3JhbSAqYmFzZSkKIAkvKiBYWFggV2h5IGRvZXMgdGhlIGJsb2IgZG8gdGhpcz8gKi8K
IAludmttX21hc2soZGV2aWNlLCAweDEzNzM2MCwgMHgwMDAwMDAwMiwgMHgwMDAwMDAwMCk7CiAK
LQkvKiBYWFg6IERvbid0IGhvb2sgdXAgeWV0IGZvciBiaXNlY3RhYmlsaXR5ICovCi0JcmV0dXJu
IDA7CisJcmV0dXJuIGdmMTAwX3JhbV90cmFpbl9pbml0KGJhc2UpOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG52a21fcmFtX2Z1bmMKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
