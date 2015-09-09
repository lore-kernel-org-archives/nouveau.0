From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/4] gm107: add voltage control using the new
	gk104 volt class
Date: Wed,  9 Sep 2015 04:05:53 +0300
Message-ID: <1441760753-13482-4-git-send-email-martin.peres@free.fr>
References: <1441760753-13482-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1441760753-13482-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

TGV0J3MgaWdub3JlIHRoZSBvdGhlciBkZXNrdG9wIE1heHdlbGxzIHVudGlsIEkgZ2V0IG15IGhh
bmRzIG9uIG9uZSBhbmQgY29uZmlybQp0aGF0IHN0aWxsIGNhbiBjaGFuZ2UgdGhlIHZvbHRhZ2Uu
CgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BmcmVlLmZyPgotLS0K
IGRybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS9iYXNlLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vZW5naW5l
L2RldmljZS9iYXNlLmMgYi9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jCmlu
ZGV4IDdjMzVmMWYuLmIzMjRmZDEgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vZW5naW5l
L2RldmljZS9iYXNlLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2Uu
YwpAQCAtMTk1Miw2ICsxOTUyLDcgQEAgbnYxMTdfY2hpcHNldCA9IHsKIAkucG11ID0gZ20xMDdf
cG11X25ldywKIAkudGhlcm0gPSBnbTEwN190aGVybV9uZXcsCiAJLnRpbWVyID0gZ2syMGFfdGlt
ZXJfbmV3LAorCS52b2x0ID0gZ2sxMDRfdm9sdF9uZXcsCiAJLmNlWzBdID0gZ2sxMDRfY2VfbmV3
LAogCS5jZVsyXSA9IGdrMTA0X2NlX25ldywKIAkuZGlzcCA9IGdtMTA3X2Rpc3BfbmV3LAotLSAK
Mi41LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
