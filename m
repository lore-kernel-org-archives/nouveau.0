From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/3] drm/nouveau: Remove useless poll_disable() call in
 switcheroo_set_state()
Date: Mon, 13 Aug 2018 15:22:30 -0400
Message-ID: <20180813192231.28861-3-lyude@redhat.com>
References: <20180813192231.28861-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180813192231.28861-1-lyude@redhat.com>
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
b20+ClJldmlld2VkLWJ5OiBLYXJvbCBIZXJic3QgPGthcm9saGVyYnN0QGdtYWlsLmNvbT4KQ2M6
IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfdmdhLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMKaW5kZXggMDliMWQ4MTUxODgxLi44ZjFj
ZTQ4MzMyMzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdh
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV92Z2EuYwpAQCAtNTAsNyAr
NTAsNiBAQCBub3V2ZWF1X3N3aXRjaGVyb29fc2V0X3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LAogCX0gZWxzZSB7CiAJCXByX2VycigiVkdBIHN3aXRjaGVyb286IHN3aXRjaGVkIG5vdXZlYXUg
b2ZmXG4iKTsKIAkJZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0NI
QU5HSU5HOwotCQlkcm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKIAkJbm91dmVhdV9z
d2l0Y2hlcm9vX29wdGltdXNfZHNtKCk7CiAJCW5vdXZlYXVfcG1vcHNfc3VzcGVuZCgmcGRldi0+
ZGV2KTsKIAkJZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX09GRjsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
