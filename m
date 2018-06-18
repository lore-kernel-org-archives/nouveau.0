From: Thomas Zimmermann <tdz@users.sourceforge.net>
Subject: [PATCH 2/4] drm/nouveau: Replace drm_framebuffer_{un/reference} with
 put, get functions
Date: Mon, 18 Jun 2018 14:53:10 +0200
Message-ID: <20180618125312.14687-3-tdz@users.sourceforge.net>
References: <20180618125312.14687-1-tdz@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180618125312.14687-1-tdz@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tdz@users.sourceforge.net>, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org

VGhpcyBwYXRjaCB1bmlmaWVzIHRoZSBuYW1pbmcgb2YgRFJNIGZ1bmN0aW9ucyBmb3IgcmVmZXJl
bmNlIGNvdW50aW5nCm9mIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIuIFRoZSByZXN1bHRpbmcgY29k
ZSBpcyBtb3JlIGFsaWduZWQgd2l0aCB0aGUKcmVzdCBvZiB0aGUgTGludXgga2VybmVsIGludGVy
ZmFjZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dGR6QHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZiY29uLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZiY29uLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZiY29uLmMKaW5kZXggODVjMWYxMGJjMmI2Li44
NDQ0OThjNDI2N2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZmJjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZiY29uLmMKQEAg
LTQyOSw3ICs0MjksNyBAQCBub3V2ZWF1X2ZiY29uX2Rlc3Ryb3koc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0IG5vdXZlYXVfZmJkZXYgKmZiY29uKQogCQlub3V2ZWF1X3ZtYV9kZWwoJm5v
dXZlYXVfZmItPnZtYSk7CiAJCW5vdXZlYXVfYm9fdW5tYXAobm91dmVhdV9mYi0+bnZibyk7CiAJ
CW5vdXZlYXVfYm9fdW5waW4obm91dmVhdV9mYi0+bnZibyk7Ci0JCWRybV9mcmFtZWJ1ZmZlcl91
bnJlZmVyZW5jZSgmbm91dmVhdV9mYi0+YmFzZSk7CisJCWRybV9mcmFtZWJ1ZmZlcl9wdXQoJm5v
dXZlYXVfZmItPmJhc2UpOwogCX0KIAogCXJldHVybiAwOwotLSAKMi4xNC40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
