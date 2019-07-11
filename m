From: Mark Menzynski <mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] moved gpio so it is sorted by values
Date: Thu, 11 Jul 2019 16:11:50 +0200
Message-ID: <20190711141153.7723-2-mmenzyns@redhat.com>
References: <20190711141153.7723-1-mmenzyns@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190711141153.7723-1-mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

U2lnbmVkLW9mZi1ieTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+Ci0tLQog
ZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaCB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
bS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggYi9kcm0vbm91dmVhdS9p
bmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCmluZGV4IGI3MWEzNTU1Li4yZjQwOTM1ZiAx
MDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaAor
KysgYi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCkBAIC0zLDkg
KzMsOSBAQAogI2RlZmluZSBfX05WQklPU19HUElPX0hfXwogZW51bSBkY2JfZ3Bpb19mdW5jX25h
bWUgewogCURDQl9HUElPX1BBTkVMX1BPV0VSID0gMHgwMSwKKwlEQ0JfR1BJT19GQU4gPSAweDA5
LAogCURDQl9HUElPX1RWREFDMCA9IDB4MGMsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgyZCwKLQlE
Q0JfR1BJT19GQU4gPSAweDA5LAogCURDQl9HUElPX0ZBTl9TRU5TRSA9IDB4M2QsCiAJRENCX0dQ
SU9fTE9HT19MRURfUFdNID0gMHg4NCwKIAlEQ0JfR1BJT19VTlVTRUQgPSAweGZmLAotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
