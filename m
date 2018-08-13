From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/3] Cleanup drm_kms_helper_poll_enable/disable() calls
Date: Mon, 13 Aug 2018 15:22:28 -0400
Message-ID: <20180813192231.28861-1-lyude@redhat.com>
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

RG9lcyB3aGF0IGl0IHNheXMgb24gdGhlIGxhYmVsLCBhIGxvdCBvZiB0aGVzZSBjYWxscyBhcmUg
YWxyZWFkeSBoYW5kbGVkCnNvbWV3aGVyZSBlbHNlIGFuZCBkb24ndCBhcHBlYXIgdG8gYmUgaGVy
ZSBmb3IgYSBsZWdpdGltYXRlIHJlYXNvbgphbnltb3JlLgoKTHl1ZGUgUGF1bCAoMyk6CiAgZHJt
L25vdXZlYXU6IFJlbW92ZSB1c2VsZXNzIHBvbGxfZW5hYmxlKCkgY2FsbCBpbgogICAgc3dpdGNo
ZXJvb19zZXRfc3RhdGUoKQogIGRybS9ub3V2ZWF1OiBSZW1vdmUgdXNlbGVzcyBwb2xsX2Rpc2Fi
bGUoKSBjYWxsIGluCiAgICBzd2l0Y2hlcm9vX3NldF9zdGF0ZSgpCiAgZHJtL25vdXZlYXU6IFJl
bW92ZSB1c2VsZXNzIHBvbGxfZW5hYmxlKCkgY2FsbCBpbiBkcm1fbG9hZCgpCgogZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV92Z2EuYyB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDUgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
