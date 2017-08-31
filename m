From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] drm: nouveau: replace magic constant for TASK_COMM_LEN
Date: Thu, 31 Aug 2017 19:39:24 +0200
Message-ID: <aed4ab093ddbfbd94247ac9d68285c09258a6011.1504200976.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Q2xpZW50J3MgbmFtZSBpcyB0YXNrX2NvbW0gKyBwaWQ6IHVzZSBjb25zdGFudCBmb3IgY2xhcml0
eSBhbmQgcHJlcGFyZQpmb3IgY2hhbmdlZCBUQVNLX0NPTU1fTEVOLgoKU2lnbmVkLW9mZi1ieTog
TWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
cm0uYwppbmRleCAxNWExM2QwOWQ0MzEuLjI4Mzk2ZDBiMDg2NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC04MzAsNyArODMwLDcgQEAgbm91dmVhdV9kcm1fb3Blbihz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZwcml2KQogewogCXN0cnVj
dCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oZGV2KTsKIAlzdHJ1Y3Qgbm91dmVhdV9j
bGkgKmNsaTsKLQljaGFyIG5hbWVbMzJdLCB0bXBuYW1lW1RBU0tfQ09NTV9MRU5dOworCWNoYXIg
bmFtZVtUQVNLX0NPTU1fTEVOICsgMTZdLCB0bXBuYW1lW1RBU0tfQ09NTV9MRU5dOwogCWludCBy
ZXQ7CiAKIAkvKiBuZWVkIHRvIGJyaW5nIHVwIHBvd2VyIGltbWVkaWF0ZWx5IGlmIG9wZW5pbmcg
ZGV2aWNlICovCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
