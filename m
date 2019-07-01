From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 11/22] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
Date: Mon,  1 Jul 2019 08:20:09 +0200
Message-ID: <20190701062020.19239-12-hch@lst.de>
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
Cc: Philip Yang <Philip.Yang-5C7GfCeVMHo@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ira Weiny <iweiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Souptick Joarder <jrdr.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBsaXN0IGlzIGFs
d2F5cyByZWFkIGFuZCB3cml0dGVuIHdoaWxlIGhvbGRpbmcgaG1tLT5sb2NrIHNvIHRoZXJlIGlz
Cm5vIG5lZWQgZm9yIHRoZSBjb25mdXNpbmcgX3JjdSBhbm5vdGF0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgpBY2tlZC1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52
aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGl3ZWlueUBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAg
WWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KLS0tCiBtbS9obW0uYyB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9t
bS9obW0uYyBiL21tL2htbS5jCmluZGV4IDA0MjNmNGNhM2E3ZS4uNzNjOGFmNDgyN2ZlIDEwMDY0
NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtOTEyLDcgKzkxMiw3IEBAIGludCBo
bW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAKIAlyYW5nZS0+aG1t
ID0gaG1tOwogCWtyZWZfZ2V0KCZobW0tPmtyZWYpOwotCWxpc3RfYWRkX3JjdSgmcmFuZ2UtPmxp
c3QsICZobW0tPnJhbmdlcyk7CisJbGlzdF9hZGQoJnJhbmdlLT5saXN0LCAmaG1tLT5yYW5nZXMp
OwogCiAJLyoKIAkgKiBJZiB0aGVyZSBhcmUgYW55IGNvbmN1cnJlbnQgbm90aWZpZXJzIHdlIGhh
dmUgdG8gd2FpdCBmb3IgdGhlbSBmb3IKQEAgLTk0Miw3ICs5NDIsNyBAQCB2b2lkIGhtbV9yYW5n
ZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCQlyZXR1cm47CiAKIAltdXRl
eF9sb2NrKCZobW0tPmxvY2spOwotCWxpc3RfZGVsX3JjdSgmcmFuZ2UtPmxpc3QpOworCWxpc3Rf
ZGVsKCZyYW5nZS0+bGlzdCk7CiAJbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2spOwogCiAJLyogRHJv
cCByZWZlcmVuY2UgdGFrZW4gYnkgaG1tX3JhbmdlX3JlZ2lzdGVyKCkgKi8KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
