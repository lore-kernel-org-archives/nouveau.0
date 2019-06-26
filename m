From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 06/25] mm: export alloc_pages_vma
Date: Wed, 26 Jun 2019 14:27:05 +0200
Message-ID: <20190626122724.13313-7-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190626122724.13313-1-hch-jcswGhMUV9g@public.gmane.org>
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

bm91dmVhdSBpcyBjdXJyZW50bHkgdXNpbmcgdGhpcyB0aHJvdWdoIGFuIG9kZCBobW0gd3JhcHBl
ciwgYW5kIEkgcGxhbgp0byBzd2l0Y2ggaXQgdG8gdGhlIHJlYWwgdGhpbmcgbGF0ZXIgaW4gdGhp
cyBzZXJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
UmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9t
ZW1wb2xpY3kuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvbW0vbWVtcG9saWN5LmMgYi9tbS9tZW1wb2xpY3kuYwppbmRleCAwMTYwMGQ4MGFlMDEu
LmY0ODU2OWFhMTg2MyAxMDA2NDQKLS0tIGEvbW0vbWVtcG9saWN5LmMKKysrIGIvbW0vbWVtcG9s
aWN5LmMKQEAgLTIwOTgsNiArMjA5OCw3IEBAIGFsbG9jX3BhZ2VzX3ZtYShnZnBfdCBnZnAsIGlu
dCBvcmRlciwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiBvdXQ6CiAJcmV0dXJuIHBhZ2U7
CiB9CitFWFBPUlRfU1lNQk9MKGFsbG9jX3BhZ2VzX3ZtYSk7CiAKIC8qKgogICogCWFsbG9jX3Bh
Z2VzX2N1cnJlbnQgLSBBbGxvY2F0ZSBwYWdlcy4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
