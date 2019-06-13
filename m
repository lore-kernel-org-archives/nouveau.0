From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 04/22] mm: don't clear ->mapping in hmm_devmem_free
Date: Thu, 13 Jun 2019 11:43:07 +0200
Message-ID: <20190613094326.24093-5-hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190613094326.24093-1-hch-jcswGhMUV9g@public.gmane.org>
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

LT5tYXBwaW5nIGlzbid0IGV2ZW4gdXNlZCBieSBITU0gdXNlcnMsIGFuZCB0aGUgZmllbGQgYXQg
dGhlIHNhbWUgb2Zmc2V0CmluIHRoZSB6b25lX2RldmljZSBwYXJ0IG9mIHRoZSB1bmlvbiBpcyBk
ZWNsYXJlZCBhcyBwYWQuICAoV2hpY2ggYnR3IGlzCnJhdGhlciBjb25mdXNpbmcsIGFzIERBWCB1
c2VzIC0+cGdtYXAgYW5kIC0+bWFwcGluZyBmcm9tIHR3byBkaWZmZXJlbnQKc2lkZXMgb2YgdGhl
IHVuaW9uLCBidXQgREFYIGRvZXNuJ3QgdXNlIGhtbV9kZXZtZW1fZnJlZSkuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBtbS9obW0uYyB8IDIgLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIv
bW0vaG1tLmMKaW5kZXggMGM2MjQyNmQxMjU3Li5lMWRjOTg0MDdlN2IgMTAwNjQ0Ci0tLSBhL21t
L2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzQ3LDggKzEzNDcsNiBAQCBzdGF0aWMgdm9pZCBo
bW1fZGV2bWVtX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0
IGhtbV9kZXZtZW0gKmRldm1lbSA9IGRhdGE7CiAKLQlwYWdlLT5tYXBwaW5nID0gTlVMTDsKLQog
CWRldm1lbS0+b3BzLT5mcmVlKGRldm1lbSwgcGFnZSk7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
