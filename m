From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] GPU-DRM-nouveau: Delete an unnecessary check before the
 function call "pci_dev_put"
Date: Wed, 20 Jul 2016 19:50:45 +0200
Message-ID: <4dcc6c6b-455f-d938-ab45-5597096007f0@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5447BF71.7040200@users.sourceforge.net>
 <559975EB.500@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <559975EB.500@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBXZWQsIDIwIEp1bCAyMDE2IDE5OjQzOjI3ICswMjAwCgpUaGUgcGNpX2Rldl9wdXQoKSBmdW5j
dGlvbiB0ZXN0cyB3aGV0aGVyIGl0cyBhcmd1bWVudCBpcyBOVUxMIGFuZCB0aGVuCnJldHVybnMg
aW1tZWRpYXRlbHkuIFRodXMgdGhlIHRlc3QgYXJvdW5kIHRoZSBjYWxsIGlzIG5vdCBuZWVkZWQu
CgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2Fy
ZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZv
cmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCA2NmMxMjgwLi43YjA5ODQxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKQEAgLTUyNSw4ICs1MjUsNyBAQCBub3V2
ZWF1X2RybV91bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlub3V2ZWF1X3ZnYV9maW5p
KGRybSk7CiAKIAludmlmX2RldmljZV9maW5pKCZkcm0tPmRldmljZSk7Ci0JaWYgKGRybS0+aGRt
aV9kZXZpY2UpCi0JCXBjaV9kZXZfcHV0KGRybS0+aGRtaV9kZXZpY2UpOworCXBjaV9kZXZfcHV0
KGRybS0+aGRtaV9kZXZpY2UpOwogCW5vdXZlYXVfY2xpX2Rlc3Ryb3koJmRybS0+Y2xpZW50KTsK
IAlyZXR1cm4gMDsKIH0KLS0gCjIuOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
