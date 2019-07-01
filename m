From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 05/22] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Date: Mon,  1 Jul 2019 08:20:03 +0200
Message-ID: <20190701062020.19239-6-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190701062020.19239-1-hch-jcswGhMUV9g@public.gmane.org>
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
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Kuehling,
 Felix" <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

RnJvbTogIkt1ZWhsaW5nLCBGZWxpeCIgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpEb24ndCBz
ZXQgdGhpcyBmbGFnIGJ5IGRlZmF1bHQgaW4gaG1tX3ZtYV9kb19mYXVsdC4gSXQgaXMgc2V0CmNv
bmRpdGlvbmFsbHkganVzdCBhIGZldyBsaW5lcyBiZWxvdy4gU2V0dGluZyBpdCB1bmNvbmRpdGlv
bmFsbHkgY2FuIGxlYWQKdG8gaGFuZGxlX21tX2ZhdWx0IGRvaW5nIGEgbm9uLWJsb2NraW5nIGZh
dWx0LCByZXR1cm5pbmcgLUVCVVNZIGFuZAp1bmxvY2tpbmcgbW1hcF9zZW0gdW5leHBlY3RlZGx5
LgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgotLS0KIG1tL2htbS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBkY2U0ZTcwZTY0OGEuLjgyNjgx
NmFiMjM3NyAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTMyOCw3ICsz
MjgsNyBAQCBzdHJ1Y3QgaG1tX3ZtYV93YWxrIHsKIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVs
dChzdHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJICAgIGJvb2wg
d3JpdGVfZmF1bHQsIHVpbnQ2NF90ICpwZm4pCiB7Ci0JdW5zaWduZWQgaW50IGZsYWdzID0gRkFV
TFRfRkxBR19BTExPV19SRVRSWSB8IEZBVUxUX0ZMQUdfUkVNT1RFOworCXVuc2lnbmVkIGludCBm
bGFncyA9IEZBVUxUX0ZMQUdfUkVNT1RFOwogCXN0cnVjdCBobW1fdm1hX3dhbGsgKmhtbV92bWFf
d2FsayA9IHdhbGstPnByaXZhdGU7CiAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1h
X3dhbGstPnJhbmdlOwogCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gd2Fsay0+dm1hOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
