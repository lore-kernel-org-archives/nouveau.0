From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/5] GPU-DRM-nouveau: Use kmalloc_array() in gt215_link_train()
Date: Wed, 21 Sep 2016 09:25:51 +0200
Message-ID: <6fcf1d5f-73eb-9107-dc1f-be03a5fef271@users.sourceforge.net>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
List-Id: nouveau.vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUdWUsIDIwIFNlcCAyMDE2IDIyOjMyOjE0ICswMjAwCgoqIEEgbXVsdGlwbGljYXRpb24gZm9y
IHRoZSBzaXplIGRldGVybWluYXRpb24gb2YgYSBtZW1vcnkgYWxsb2NhdGlvbgogIGluZGljYXRl
ZCB0aGF0IGFuIGFycmF5IGRhdGEgc3RydWN0dXJlIHNob3VsZCBiZSBwcm9jZXNzZWQuCiAgVGh1
cyB1c2UgdGhlIGNvcnJlc3BvbmRpbmcgZnVuY3Rpb24gImttYWxsb2NfYXJyYXkiLgoKICBUaGlz
IGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KCiog
UmVwbGFjZSB0aGUgc3BlY2lmaWNhdGlvbiBvZiBhIGRhdGEgdHlwZSBieSBhIHBvaW50ZXIgZGVy
ZWZlcmVuY2UKICB0byBtYWtlIHRoZSBjb3JyZXNwb25kaW5nIHNpemUgZGV0ZXJtaW5hdGlvbiBh
IGJpdCBzYWZlciBhY2NvcmRpbmcgdG8KICB0aGUgTGludXggY29kaW5nIHN0eWxlIGNvbnZlbnRp
b24uCgpTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vm
b3JnZS5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvcmFt
Z3QyMTUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Zi
L3JhbWd0MjE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9yYW1n
dDIxNS5jCmluZGV4IGQxNWVhODguLmRiYWY1NzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbWd0MjE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvZmIvcmFtZ3QyMTUuYwpAQCAtMTcwLDcgKzE3MCw3IEBAIGd0
MjE1X2xpbmtfdHJhaW4oc3RydWN0IGd0MjE1X3JhbSAqcmFtKQogCQlyZXR1cm4gLUVOT1NZUzsK
IAogCS8qIFhYWDogTXVsdGlwbGUgcGFydGl0aW9ucz8gKi8KLQlyZXN1bHQgPSBrbWFsbG9jKDY0
ICogc2l6ZW9mKHUzMiksIEdGUF9LRVJORUwpOworCXJlc3VsdCA9IGttYWxsb2NfYXJyYXkoNjQs
IHNpemVvZigqcmVzdWx0KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFyZXN1bHQpCiAJCXJldHVybiAt
RU5PTUVNOwogCi0tIAoyLjEwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
