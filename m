From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 04/11] gm107/ir: fix DSET boolean float flag
Date: Thu, 19 Feb 2015 20:02:33 -0500
Message-ID: <1424394160-22417-4-git-send-email-imirkin@alum.mit.edu>
References: <1424394160-22417-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1424394160-22417-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHNy
Yy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZW1pdF9nbTEwNy5jcHAg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NyYy9n
YWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZW1pdF9nbTEwNy5jcHAgYi9z
cmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2VtaXRfZ20xMDcuY3Bw
CmluZGV4IDlmNGM0MzUuLjczYTY1ZmEgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMv
bm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZW1pdF9nbTEwNy5jcHAKKysrIGIvc3JjL2dhbGxpdW0v
ZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9lbWl0X2dtMTA3LmNwcApAQCAtMTA2MCw2
ICsxMDYwLDcgQEAgQ29kZUVtaXR0ZXJHTTEwNzo6ZW1pdERTRVQoKQogCiAgICBlbWl0QUJTICAo
MHgzNiwgaW5zbi0+c3JjKDApKTsKICAgIGVtaXRORUcgICgweDM1LCBpbnNuLT5zcmMoMSkpOwor
ICAgZW1pdEZpZWxkKDB4MzQsIDEsIGluc24tPmRUeXBlID09IFRZUEVfRjMyKTsKICAgIGVtaXRD
b25kNCgweDMwLCBpbnNuLT5zZXRDb25kKTsKICAgIGVtaXRDQyAgICgweDJmKTsKICAgIGVtaXRB
QlMgICgweDJjLCBpbnNuLT5zcmMoMSkpOwotLSAKMi4wLjUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
