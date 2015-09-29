From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 9/9] clk/g84: Enable reclocking for GDDR3 G94-G200
Date: Wed, 30 Sep 2015 00:23:52 +0100
Message-ID: <1443569032-13817-10-git-send-email-rspliet@eclipso.eu>
References: <1443569032-13817-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1443569032-13817-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

WW91ciBtaWxhZ2UgbWF5IHZhcnksIGFzIGl0J3Mgb25seSBiZWVuIHRlc3RlZCBvbiBhIHNpbmds
ZSBHOTQgYW5kIG9uZSBHOTYuCgpTaWduZWQtb2ZmLWJ5OiBSb3kgU3BsaWV0IDxyc3BsaWV0QGVj
bGlwc28uZXU+ClRlc3RlZC1ieTogUGllcnJlIE1vcmVhdSA8cGllcnJlLm1vcnJvd0BmcmVlLmZy
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nODQuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nODQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nODQuYwppbmRleCAzNDdkYTll
Li5mOTdlM2VjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9jbGsvZzg0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xr
L2c4NC5jCkBAIC00NCw1ICs0NCw1IEBAIGludAogZzg0X2Nsa19uZXcoc3RydWN0IG52a21fZGV2
aWNlICpkZXZpY2UsIGludCBpbmRleCwgc3RydWN0IG52a21fY2xrICoqcGNsaykKIHsKIAlyZXR1
cm4gbnY1MF9jbGtfbmV3XygmZzg0X2NsaywgZGV2aWNlLCBpbmRleCwKLQkJCSAgICAgKGRldmlj
ZS0+Y2hpcHNldCA9PSAweGEwKSwgcGNsayk7CisJCQkgICAgIChkZXZpY2UtPmNoaXBzZXQgPj0g
MHg5NCksIHBjbGspOwogfQotLSAKMi40LjMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXUK
