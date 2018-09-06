From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 0/6] Backlight fixes and cleanup
Date: Thu,  6 Sep 2018 17:43:20 -0400
Message-ID: <20180906214328.24012-1-lyude@redhat.com>
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
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

UmVmYWN0b3IgZm9yIEJlbiwgaG9wZWZ1bGx5IHRoaXMgdGltZSB0aGlzIHNob3VsZCBhcHBseSB0
byBoaXMgdHJlZS4KTmV4dCB2ZXJzaW9uIG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNDg1OTYvCgpObyBjaGFuZ2VzIG90aGVyd2lzZS4KCkx5dWRlIFBhdWwgKDYp
OgogIGRybS9ub3V2ZWF1OiBDaGVjayBiYWNrbGlnaHQgSURzIGFyZSA+PSAwLCBub3QgPiAwCiAg
ZHJtL25vdXZlYXU6IEFkZCBOVl9QUklOVEtfT05DRSBhbmQgdmFyaWFudHMKICBkcm0vbm91dmVh
dTogTW92ZSBiYWNrbGlnaHQgZGV2aWNlIGludG8gbm91dmVhdV9jb25uZWN0b3IKICBkcm0vbm91
dmVhdTogcy9ub3V2ZWF1X2JhY2tsaWdodF9leGl0L25vdXZlYXVfYmFja2xpZ2h0X2ZpbmkvCiAg
ZHJtL25vdXZlYXU6IENsZWFudXAgaW5kZW50aW5nIGluIG5vdXZlYXVfYmFja2xpZ2h0LmMKICBk
cm0vbm91dmVhdTogUmVmYWN0b3IgbnZYWF9iYWNrbGlnaHRfaW5pdCgpCgogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYyB8IDIyMCArKysrKysrKysrLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyB8ICAyMCArKwog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuaCB8ICAzMyArKysKIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jICAgfCAgIDIgLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmggICB8ICAyNSAtLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmggICAgICAgfCAgMTAgKy0KIDYgZmlsZXMgY2hh
bmdlZCwgMTY4IGluc2VydGlvbnMoKyksIDE0MiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
