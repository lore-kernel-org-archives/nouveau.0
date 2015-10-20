From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/1] vga_switcheroo: Constify
	vga_switcheroo_handler
Date: Tue, 20 Oct 2015 12:07:05 +0200
Message-ID: <cover.1445335625.git.lukas@wunner.de>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Darren Hart <dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW5vdGhlciB2Z2Ffc3dpdGNoZXJvbyBjbGVhbnVwLiBNYWludGFpbmVycywgaXMgaXQgb2theSB0
byBpbmNsdWRlIHRoZQpvbmUtbGluZSBjaGFuZ2Ugb2YgZWFjaCBkcml2ZXIgaW4gaGVyZSBvciBk
byB5b3Ugd2FudCB0aGF0IHNwbGl0IGludG8Kc2VwYXJhdGUgcGF0Y2hlcz8KClRoYW5rcywKCkx1
a2FzCgoKTHVrYXMgV3VubmVyICgxKToKICB2Z2Ffc3dpdGNoZXJvbzogQ29uc3RpZnkgdmdhX3N3
aXRjaGVyb29faGFuZGxlcgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4
X2hhbmRsZXIuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWNwaS5j
ICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0cHhfaGFu
ZGxlci5jICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L3ZnYS92Z2Ffc3dpdGNoZXJvby5jICAgICAg
ICAgICAgICAgICB8IDQgKystLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvYXBwbGUtZ211eC5jICAg
ICAgICAgICAgICAgIHwgMiArLQogaW5jbHVkZS9saW51eC92Z2Ffc3dpdGNoZXJvby5oICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
