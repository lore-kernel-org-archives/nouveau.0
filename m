From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] pm/gf100: remove undefined TEX.PM_UNKC8 mux
Date: Tue,  4 Aug 2015 23:58:13 +0200
Message-ID: <1438725495-12790-2-git-send-email-samuel.pitoiset@gmail.com>
References: <1438725495-12790-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1438725495-12790-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

VGhpcyBtdXggb25seSBleGlzdHMgb24gR0YxMDgrIChleGNlcHQgZm9yIEdGMTEwIG9uZSksIGJ1
dCBzaW5jZSBpdCBpcwpub3QgdXNlZCBieSB0aGUgdXNlcnNwYWNlIHdlIGNhbiBkcm9wIGl0IGZv
ciBub3cuCgpTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgUGl0b2lzZXQgPHNhbXVlbC5waXRvaXNldEBn
bWFpbC5jb20+Ci0tLQogZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvcG0vZ2YxMDAuYyB8IDQgLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvcG0vZ2YxMDAuYyBiL2RybS9ub3V2ZWF1L252a20vZW5naW5lL3BtL2dm
MTAwLmMKaW5kZXggYjQwYzIxOC4uMzdiMTYzNiAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZr
bS9lbmdpbmUvcG0vZ2YxMDAuYworKysgYi9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9wbS9nZjEw
MC5jCkBAIC02MiwxMCArNjIsNiBAQCBnZjEwMF90ZXhfc291cmNlc1tdID0gewogCQkJeyAweDcs
IDgsICJzZWwxIiwgdHJ1ZSB9LAogCQkJe30KIAkJfSwgInBncmFwaF9ncGMwX3RwYzBfdGV4X3Bt
X211eF9jX2QiIH0sCi0JeyAweDUwNDJjOCwgKGNvbnN0IHN0cnVjdCBudmttX3NwZWNtdXhbXSkg
ewotCQkJeyAweDFmLCAwLCAic2VsIiwgdHJ1ZSB9LAotCQkJe30KLQkJfSwgInBncmFwaF9ncGMw
X3RwYzBfdGV4X3BtX3Vua2M4IiB9LAogCXt9CiB9OwogCi0tIAoyLjQuNgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
