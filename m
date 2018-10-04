From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 0/5] Fix legacy DPMS changes with MST
Date: Thu,  4 Oct 2018 19:33:45 -0400
Message-ID: <20181004233353.5388-1-lyude@redhat.com>
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
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
List-Id: nouveau.vger.kernel.org

TmV4dCB2ZXJzaW9uIG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NDk4NzcvCgpUaGlzIGZpeGVzIHNvbWUgcmF0aGVyIHNpbGx5IGJ1Z3MgcmVnYXJkaW5nIERQTVMg
T24tPk9mZiBjaGFuZ2VzIGZhaWxpbmcKZm9yIGNvbm5lY3RvcnMgd2hpY2ggd2VyZSBqdXN0IHJl
Y2VudGx5IGRlc3Ryb3llZC4KCkx5dWRlIFBhdWwgKDUpOgogIGRybS9hdG9taWNfaGVscGVyOiBE
aXNhbGxvdyBuZXcgbW9kZXNldHMgb24gdW5yZWdpc3RlcmVkIGNvbm5lY3RvcnMKICBkcm0vbm91
dmVhdTogRml4IG52NTBfbXN0Yy0+YmVzdF9lbmNvZGVyKCkKICBkcm0vaTkxNTogTGVhdmUgaW50
ZWxfY29ubi0+bXN0X3BvcnQgc2V0LCB1c2UgbXN0X3BvcnRfZ29uZSBpbnN0ZWFkCiAgZHJtL2k5
MTU6IFNraXAgdmNwaSBhbGxvY2F0aW9uIGZvciBNU1RCIHBvcnRzIHRoYXQgYXJlIGdvbmUKICBk
cm0vaTkxNTogRml4IGludGVsX2RwX21zdF9iZXN0X2VuY29kZXIoKQoKIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5jICAgICB8IDIxICsrKysrKysrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9kcF9tc3QuYyAgICAgfCAzMSArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcnYuaCAgICAgICAgfCAgNiArKysr
KwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMTQgKysrKy0tLS0t
LS0KIDQgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
