From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 0/5] Fix legacy DPMS changes with MST
Date: Mon,  8 Oct 2018 18:52:55 -0400
Message-ID: <20181008225303.2907-1-lyude@redhat.com>
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
To: intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

TmV4dCB2ZXJzaW9uIG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NDk4NzgvCgpObyBmdW5jdGlvbmFsIGNoYW5nZXMsIGp1c3QgYSB0eXBvIGZpeAoKTHl1ZGUgUGF1
bCAoNSk6CiAgZHJtL2F0b21pY19oZWxwZXI6IERpc2FsbG93IG5ldyBtb2Rlc2V0cyBvbiB1bnJl
Z2lzdGVyZWQgY29ubmVjdG9ycwogIGRybS9ub3V2ZWF1OiBGaXggbnY1MF9tc3RjLT5iZXN0X2Vu
Y29kZXIoKQogIGRybS9pOTE1OiBEb24ndCB1bnNldCBpbnRlbF9jb25uZWN0b3ItPm1zdF9wb3J0
CiAgZHJtL2k5MTU6IFNraXAgdmNwaSBhbGxvY2F0aW9uIGZvciBNU1RCIHBvcnRzIHRoYXQgYXJl
IGdvbmUKICBkcm0vaTkxNTogRml4IGludGVsX2RwX21zdF9iZXN0X2VuY29kZXIoKQoKIGRyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jICAgICB8IDIxICsrKysrKysrKysrKy0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RwX21zdC5jICAgICB8IDQxICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDE0
ICsrKy0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlv
bnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
