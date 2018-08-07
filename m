From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 04/13] drm/nouveau: Remove useless poll_disable() call in
 switcheroo_set_state()
Date: Tue,  7 Aug 2018 16:39:01 -0400
Message-ID: <20180807203914.2192-5-lyude@redhat.com>
References: <20180807203914.2192-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180807203914.2192-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

VGhpcyB3b24ndCBkbyBhbnl0aGluZyBidXQgcG90ZW50aWFsbHkgbWFrZSB1cyBtaXNzIGhvdHBs
dWdzLiBXZSBhbHJlYWR5CmNhbGwgZHJtX2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKCkgaW4Kbm91
dmVhdV9wbW9wc19zdXNwZW5kKCktPm5vdXZlYXVfZGlzcGxheV9zdXNwZW5kKCktPm5vdXZlYXVf
ZGlzcGxheV9maW5pKCkKClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+CkNjOiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4KQ2M6IEthcm9sIEhlcmJzdCA8
a2Fyb2xoZXJic3RAZ21haWwuY29tPgpbb21pdHRpbmcgc3RhYmxlIENjLCB0aGlzIGxpa2VseSBk
b2Vzbid0IGZpeCBhbnl0aGluZyBpbXBvcnRhbnQgZW5vdWdoCmZvciB0aGF0XQotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV92Z2EuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMKaW5kZXggMDli
MWQ4MTUxODgxLi44ZjFjZTQ4MzMyMzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfdmdhLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV92
Z2EuYwpAQCAtNTAsNyArNTAsNiBAQCBub3V2ZWF1X3N3aXRjaGVyb29fc2V0X3N0YXRlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2LAogCX0gZWxzZSB7CiAJCXByX2VycigiVkdBIHN3aXRjaGVyb286IHN3
aXRjaGVkIG5vdXZlYXUgb2ZmXG4iKTsKIAkJZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1f
U1dJVENIX1BPV0VSX0NIQU5HSU5HOwotCQlkcm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2
KTsKIAkJbm91dmVhdV9zd2l0Y2hlcm9vX29wdGltdXNfZHNtKCk7CiAJCW5vdXZlYXVfcG1vcHNf
c3VzcGVuZCgmcGRldi0+ZGV2KTsKIAkJZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJ
VENIX1BPV0VSX09GRjsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
