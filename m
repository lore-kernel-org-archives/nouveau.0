From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] pm/nv50: fix wrong addr for ZCULL source on
	G80:GT215
Date: Sun, 26 Jul 2015 11:30:07 +0200
Message-ID: <1437903008-17478-1-git-send-email-samuel.pitoiset@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogU2FtdWVsIFBpdG9pc2V0IDxzYW11ZWwucGl0b2lzZXRAZ21haWwuY29t
PgotLS0KIGRybS9ub3V2ZWF1L252a20vZW5naW5lL3BtL252NTAuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RybS9u
b3V2ZWF1L252a20vZW5naW5lL3BtL252NTAuYyBiL2RybS9ub3V2ZWF1L252a20vZW5naW5lL3Bt
L252NTAuYwppbmRleCBhNzc4YmM3Li4xNGQ0NzRiIDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9wbS9udjUwLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvcG0vbnY1
MC5jCkBAIC0zNCw3ICszNCw3IEBAIG52NTBfcHJvcF9zb3VyY2VzW10gPSB7CiAKIGNvbnN0IHN0
cnVjdCBudmttX3NwZWNzcmMKIG52NTBfemN1bGxfc291cmNlc1tdID0gewotCXsgMHg0MDAyY2E0
LCAoY29uc3Qgc3RydWN0IG52a21fc3BlY211eFtdKSB7CisJeyAweDQwMmNhNCwgKGNvbnN0IHN0
cnVjdCBudmttX3NwZWNtdXhbXSkgewogCQkJeyAweDdmZmYsIDAsICJ1bmswIiB9LAogCQkJe30K
IAkJfSwgInBncmFwaF96Y3VsbF9wbV91bmthNCIgfSwKLS0gCjIuNC42CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
