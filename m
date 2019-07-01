From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 13/22] mm/hmm: Use lockdep instead of comments
Date: Mon,  1 Jul 2019 08:20:11 +0200
Message-ID: <20190701062020.19239-14-hch@lst.de>
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
Cc: Philip Yang <Philip.Yang-5C7GfCeVMHo@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Souptick Joarder <jrdr.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gd2UgY2FuIGNoZWNr
IGxvY2tpbmcgYXQgcnVudGltZS4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpS
ZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpBY2tlZC1i
eTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhp
bGlwLllhbmdAYW1kLmNvbT4KLS0tCiBtbS9obW0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBi
L21tL2htbS5jCmluZGV4IDFlZGRkYTQ1Y2VmYS4uNmY1ZGM2ZDU2OGZlIDEwMDY0NAotLS0gYS9t
bS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtMjQ2LDExICsyNDYsMTEgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtbXVfbm90aWZpZXJfb3BzIGhtbV9tbXVfbm90aWZpZXJfb3BzID0gewogICoKICAq
IFRvIHN0YXJ0IG1pcnJvcmluZyBhIHByb2Nlc3MgYWRkcmVzcyBzcGFjZSwgdGhlIGRldmljZSBk
cml2ZXIgbXVzdCByZWdpc3RlcgogICogYW4gSE1NIG1pcnJvciBzdHJ1Y3QuCi0gKgotICogVEhF
IG1tLT5tbWFwX3NlbSBNVVNUIEJFIEhFTEQgSU4gV1JJVEUgTU9ERSAhCiAgKi8KIGludCBobW1f
bWlycm9yX3JlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tKQogeworCWxvY2tkZXBfYXNzZXJ0X2hlbGRfZXhjbHVzaXZlKCZtbS0+bW1hcF9zZW0p
OworCiAJLyogU2FuaXR5IGNoZWNrICovCiAJaWYgKCFtbSB8fCAhbWlycm9yIHx8ICFtaXJyb3It
Pm9wcykKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW52ZGltbSBtYWlsaW5nIGxpc3QKTGlu
dXgtbnZkaW1tQGxpc3RzLjAxLm9yZwpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW52ZGltbQo=
