From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 2/3] drm/nouveau: Remove useless poll_disable() call in
 switcheroo_set_state()
Date: Wed, 15 Aug 2018 15:15:12 -0400
Message-ID: <20180815191513.6266-3-lyude@redhat.com>
References: <20180815191513.6266-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180815191513.6266-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

VGhpcyB3b24ndCBkbyBhbnl0aGluZyBidXQgcG90ZW50aWFsbHkgbWFrZSB1cyBtaXNzIGhvdHBs
dWdzLiBXZSBhbHJlYWR5CmNhbGwgZHJtX2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKCkgaW4Kbm91
dmVhdV9wbW9wc19zdXNwZW5kKCktPm5vdXZlYXVfZGlzcGxheV9zdXNwZW5kKCktPm5vdXZlYXVf
ZGlzcGxheV9maW5pKCkKClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+ClJldmlld2VkLWJ5OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KQWNrZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEx1a2FzIFd1bm5lciA8bHVr
YXNAd3VubmVyLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMg
fCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfdmdhLmMKaW5kZXggMDliMWQ4MTUxODgxLi44ZjFjZTQ4MzMyMzAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYwpAQCAtNTAsNyArNTAsNiBAQCBub3V2ZWF1X3N3
aXRjaGVyb29fc2V0X3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCX0gZWxzZSB7CiAJCXBy
X2VycigiVkdBIHN3aXRjaGVyb286IHN3aXRjaGVkIG5vdXZlYXUgb2ZmXG4iKTsKIAkJZGV2LT5z
d2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0NIQU5HSU5HOwotCQlkcm1fa21z
X2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKIAkJbm91dmVhdV9zd2l0Y2hlcm9vX29wdGltdXNf
ZHNtKCk7CiAJCW5vdXZlYXVfcG1vcHNfc3VzcGVuZCgmcGRldi0+ZGV2KTsKIAkJZGV2LT5zd2l0
Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX09GRjsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
