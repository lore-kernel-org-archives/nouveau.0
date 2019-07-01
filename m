From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 04/22] mm/hmm: support automatic NUMA balancing
Date: Mon,  1 Jul 2019 08:20:02 +0200
Message-ID: <20190701062020.19239-5-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190701062020.19239-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Philip Yang <Philip.Yang-5C7GfCeVMHo@public.gmane.org>, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+CgpXaGlsZSB0aGUgcGFnZSBp
cyBtaWdyYXRpbmcgYnkgTlVNQSBiYWxhbmNpbmcsIEhNTSBmYWlsZWQgdG8gZGV0ZWN0IHRoaXMK
Y29uZGl0aW9uIGFuZCBzdGlsbCByZXR1cm4gdGhlIG9sZCBwYWdlLiBBcHBsaWNhdGlvbiB3aWxs
IHVzZSB0aGUgbmV3IHBhZ2UKbWlncmF0ZWQsIGJ1dCBkcml2ZXIgcGFzcyB0aGUgb2xkIHBhZ2Ug
cGh5c2ljYWwgYWRkcmVzcyB0byBHUFUsIHRoaXMgY3Jhc2gKdGhlIGFwcGxpY2F0aW9uIGxhdGVy
LgoKVXNlIHB0ZV9wcm90bm9uZShwdGUpIHRvIHJldHVybiB0aGlzIGNvbmRpdGlvbiBhbmQgdGhl
biBobW1fdm1hX2RvX2ZhdWx0CndpbGwgYWxsb2NhdGUgbmV3IHBhZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKw6lyw7RtZSBH
bGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgotLS0KIG1tL2htbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9t
bS9obW0uYwppbmRleCA0ZGI1ZGNmMTEwYmEuLmRjZTRlNzBlNjQ4YSAxMDA2NDQKLS0tIGEvbW0v
aG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgaW50IGhtbV92
bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywKIAogc3RhdGljIGlubGluZSB1aW50
NjRfdCBwdGVfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgcHRlX3Qg
cHRlKQogewotCWlmIChwdGVfbm9uZShwdGUpIHx8ICFwdGVfcHJlc2VudChwdGUpKQorCWlmIChw
dGVfbm9uZShwdGUpIHx8ICFwdGVfcHJlc2VudChwdGUpIHx8IHB0ZV9wcm90bm9uZShwdGUpKQog
CQlyZXR1cm4gMDsKIAlyZXR1cm4gcHRlX3dyaXRlKHB0ZSkgPyByYW5nZS0+ZmxhZ3NbSE1NX1BG
Tl9WQUxJRF0gfAogCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXSA6Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW52
ZGltbSBtYWlsaW5nIGxpc3QKTGludXgtbnZkaW1tQGxpc3RzLjAxLm9yZwpodHRwczovL2xpc3Rz
LjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW52ZGltbQo=
