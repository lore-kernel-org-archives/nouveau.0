From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 0/4] drm/dp_mst: Improve VCPI helpers,
 use in nouveau
Date: Fri, 26 Oct 2018 16:35:45 -0400
Message-ID: <20181026203549.1796-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

VGhpcyBwYXRjaHNldCBkb2VzIHNvbWUgY2xlYW5pbmcgdXAgb2YgdGhlIGF0b21pYyBWQ1BJIGhl
bHBlcnMgZm9yIE1TVCwKYW5kIGNvbnZlcnRzIG5vdXZlYXUgb3ZlciB0byB1c2luZyB0aGVtLiBJ
IHdvdWxkIGhhdmUgaW5jbHVkZWQgYW1kZ3B1IGluCnRoaXMgcGF0Y2ggYXMgd2VsbCwgYnV0IGF0
IHRoZSBtb21lbnQgbW92aW5nIHRoZW0gb3ZlciB0byB0aGUgYXRvbWljCmhlbHBlcnMgaXMgbm9u
dHJpdmlhbC4KCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CgpMeXVkZSBQYXVs
ICg0KToKICBkcm0vZHBfbXN0OiBBZGQgc29tZSBhdG9taWMgc3RhdGUgaXRlcmF0b3IgbWFjcm9z
CiAgZHJtL2RwX21zdDogU3RhcnQgdHJhY2tpbmcgcGVyLXBvcnQgVkNQSSBhbGxvY2F0aW9ucwog
IGRybS9kcF9tc3Q6IENoZWNrIHBheWxvYWQgY291bnQgaW4gZHJtX2RwX21zdF9hdG9taWNfY2hl
Y2soKQogIGRybS9ub3V2ZWF1OiBVc2UgYXRvbWljIFZDUEkgaGVscGVycyBmb3IgTVNUCgogZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgIHwgMTk2ICsrKysrKysrKysrKysr
KysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jICAgIHwgICA4
ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RwX21zdC5jICAgICB8ICAzMSArKy0tCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAgNTQgKysrKysrLQogaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgIHwgIDg4ICsrKysrKysrKystCiA1
IGZpbGVzIGNoYW5nZWQsIDMyMiBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
