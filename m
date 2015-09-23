From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] clk/gf100: allow users to enable reclocking
Date: Wed, 23 Sep 2015 23:20:54 +0200
Message-ID: <1443043254-12382-2-git-send-email-samuel.pitoiset@gmail.com>
References: <1443043254-12382-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1443043254-12382-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

T25seSB0aGUgY29yZSBjbG9jayBpcyBjdXJyZW50bHkgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1i
eTogU2FtdWVsIFBpdG9pc2V0IDxzYW11ZWwucGl0b2lzZXRAZ21haWwuY29tPgotLS0KIGRybS9u
b3V2ZWF1L252a20vc3ViZGV2L2Nsay9nZjEwMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvY2xrL2dmMTAwLmMgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2YxMDAu
YwppbmRleCBhNTJiN2U3Li44MDczMDVhIDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9jbGsvZ2YxMDAuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2YxMDAu
YwpAQCAtNDYyLDUgKzQ2Miw1IEBAIGdmMTAwX2Nsa19uZXcoc3RydWN0IG52a21fZGV2aWNlICpk
ZXZpY2UsIGludCBpbmRleCwgc3RydWN0IG52a21fY2xrICoqcGNsaykKIAkJcmV0dXJuIC1FTk9N
RU07CiAJKnBjbGsgPSAmY2xrLT5iYXNlOwogCi0JcmV0dXJuIG52a21fY2xrX2N0b3IoJmdmMTAw
X2NsaywgZGV2aWNlLCBpbmRleCwgZmFsc2UsICZjbGstPmJhc2UpOworCXJldHVybiBudmttX2Ns
a19jdG9yKCZnZjEwMF9jbGssIGRldmljZSwgaW5kZXgsIHRydWUsICZjbGstPmJhc2UpOwogfQot
LSAKMi41LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
