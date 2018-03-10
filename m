From: jglisse@redhat.com
Subject: [RFC PATCH 04/13] drm/nouveau/mmu/gp100: allow gcc/tex to generate
 replayable faults
Date: Fri,  9 Mar 2018 22:21:32 -0500
Message-ID: <20180310032141.6096-5-jglisse@redhat.com>
References: <20180310032141.6096-1-jglisse@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180310032141.6096-1-jglisse@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: linux-mm@kvack.org, Evgeny Baskakov <ebaskakov@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>
List-Id: nouveau.vger.kernel.org

RnJvbTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKU2lnbmVkLW9mZi1ieTogQmVu
IFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L21tdS92bW1ncDEwMC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L21tdS92bW1ncDEwMC5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvbW11L3ZtbWdwMTAwLmMKaW5kZXggMDU5ZmFmZTBlNzcxLi44NzUy
ZDljZTRhZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L21tdS92bW1ncDEwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L21tdS92bW1ncDEwMC5jCkBAIC0zMTUsNyArMzE1LDEwIEBAIGdwMTAwX3ZtbV9mbHVzaChzdHJ1
Y3QgbnZrbV92bW0gKnZtbSwgaW50IGRlcHRoKQogaW50CiBncDEwMF92bW1fam9pbihzdHJ1Y3Qg
bnZrbV92bW0gKnZtbSwgc3RydWN0IG52a21fbWVtb3J5ICppbnN0KQogewotCWNvbnN0IHU2NCBi
YXNlID0gQklUX1VMTCgxMCkgLyogVkVSMiAqLyB8IEJJVF9VTEwoMTEpOyAvKiA2NEtpQiAqLwor
CWNvbnN0IHU2NCBiYXNlID0gQklUX1VMTCg0KSAvKiBGQVVMVF9SRVBMQVlfVEVYICovIHwKKwkJ
CSBCSVRfVUxMKDUpIC8qIEZBVUxUX1JFUExBWV9HQ0MgKi8gfAorCQkJIEJJVF9VTEwoMTApIC8q
IFZFUjIgKi8gfAorCQkJIEJJVF9VTEwoMTEpIC8qIDY0S2lCICovOwogCXJldHVybiBnZjEwMF92
bW1fam9pbl8odm1tLCBpbnN0LCBiYXNlKTsKIH0KIAotLSAKMi4xNC4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
