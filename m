From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 17/25] nouveau: use alloc_page_vma directly
Date: Mon, 17 Jun 2019 14:27:25 +0200
Message-ID: <20190617122733.22432-18-hch@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190617122733.22432-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

aG1tX3ZtYV9hbGxvY19sb2NrZWRfcGFnZSBpcyBzY2hlZHVsZWQgdG8gZ28gYXdheSwgdXNlIHRo
ZSBwcm9wZXIKbW0gZnVuY3Rpb24gZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCA0MGM0N2Q2YTdkNzguLmE1
MGY2ZmQyZmUyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKQEAgLTE0
OCwxMSArMTQ4LDEyIEBAIG5vdXZlYXVfZG1lbV9mYXVsdF9hbGxvY19hbmRfY29weShzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJaWYgKCFzcGFnZSB8fCAhKHNyY19wZm5zW2ldICYgTUlH
UkFURV9QRk5fTUlHUkFURSkpCiAJCQljb250aW51ZTsKIAotCQlkcGFnZSA9IGhtbV92bWFfYWxs
b2NfbG9ja2VkX3BhZ2Uodm1hLCBhZGRyKTsKKwkJZHBhZ2UgPSBhbGxvY19wYWdlX3ZtYShHRlBf
SElHSFVTRVIsIHZtYSwgYWRkcik7CiAJCWlmICghZHBhZ2UpIHsKIAkJCWRzdF9wZm5zW2ldID0g
TUlHUkFURV9QRk5fRVJST1I7CiAJCQljb250aW51ZTsKIAkJfQorCQlsb2NrX3BhZ2UoZHBhZ2Up
OwogCiAJCWRzdF9wZm5zW2ldID0gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4oZHBhZ2UpKSB8CiAJ
CQkgICAgICBNSUdSQVRFX1BGTl9MT0NLRUQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
