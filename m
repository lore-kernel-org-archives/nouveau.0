From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 7/9] mm: remove the unused MIGRATE_PFN_ERROR flag
Date: Mon, 29 Jul 2019 17:28:41 +0300
Message-ID: <20190729142843.22320-8-hch@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190729142843.22320-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

V2UgZG9uJ3QgdXNlIHRoaXMgZmxhZyBhbnltb3JlLCBzbyByZW1vdmUgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L21p
Z3JhdGUuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaCBiL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCmluZGV4
IDA5M2Q2N2ZjZjZkZC4uMjI5MTUzYzJjNDk2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21p
Z3JhdGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaApAQCAtMTY3LDcgKzE2Nyw2IEBA
IHN0YXRpYyBpbmxpbmUgaW50IG1pZ3JhdGVfbWlzcGxhY2VkX3RyYW5zaHVnZV9wYWdlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLAogI2RlZmluZSBNSUdSQVRFX1BGTl9MT0NLRUQJKDFVTCA8PCAyKQog
I2RlZmluZSBNSUdSQVRFX1BGTl9XUklURQkoMVVMIDw8IDMpCiAjZGVmaW5lIE1JR1JBVEVfUEZO
X0RFVklDRQkoMVVMIDw8IDQpCi0jZGVmaW5lIE1JR1JBVEVfUEZOX0VSUk9SCSgxVUwgPDwgNSkK
ICNkZWZpbmUgTUlHUkFURV9QRk5fU0hJRlQJNgogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdl
ICptaWdyYXRlX3Bmbl90b19wYWdlKHVuc2lnbmVkIGxvbmcgbXBmbikKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
