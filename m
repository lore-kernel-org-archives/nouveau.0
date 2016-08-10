From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 6/7] drm/nouveau/fifo/gk104: make use of new
	strcpytoupper() function
Date: Wed, 10 Aug 2016 14:04:56 -0700
Message-ID: <1470863097-21138-7-git-send-email-mmayer@broadcom.com>
References: <1470863097-21138-1-git-send-email-mmayer@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1470863097-21138-1-git-send-email-mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Q2FsbCBzdHJjcHl0b3VwcGVyKCkgcmF0aGVyIHRoYW4gY29weWluZyB0aGUgc3RyaW5nIGV4cGxp
Y2l0bHkgYW5kIHRoZW4Kd2Fsa2luZyBpdCB0byBjb252ZXJ0IGl0IHRvIHVwcGVyY2FzZS4KClNp
Z25lZC1vZmYtYnk6IE1hcmt1cyBNYXllciA8bW1heWVyQGJyb2FkY29tLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2drMTA0LmMgfCA1ICstLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZmlmby9nazEwNC5jIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZmlmby9nazEwNC5jCmluZGV4IDEwM2Mw
YWYuLjI0ZjRjNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2ZpZm8vZ2sxMDQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2lu
ZS9maWZvL2drMTA0LmMKQEAgLTMzMiwxMCArMzMyLDcgQEAgZ2sxMDRfZmlmb19pbnRyX2ZhdWx0
KHN0cnVjdCBnazEwNF9maWZvICpmaWZvLCBpbnQgdW5pdCkKIAkJZW51bSBudmttX2RldmlkeCBl
bmdpZHggPSBudmttX3RvcF9mYXVsdChkZXZpY2UsIHVuaXQpOwogCQlpZiAoZW5naWR4IDwgTlZL
TV9TVUJERVZfTlIpIHsKIAkJCWNvbnN0IGNoYXIgKnNyYyA9IG52a21fc3ViZGV2X25hbWVbZW5n
aWR4XTsKLQkJCWNoYXIgKmRzdCA9IGVuOwotCQkJZG8gewotCQkJCSpkc3QrKyA9IHRvdXBwZXIo
KnNyYysrKTsKLQkJCX0gd2hpbGUoKnNyYyk7CisJCQlzdHJjcHl0b3VwcGVyKGVuLCBzcmMpOwog
CQkJZW5naW5lID0gbnZrbV9kZXZpY2VfZW5naW5lKGRldmljZSwgZW5naWR4KTsKIAkJfQogCX0g
ZWxzZSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
