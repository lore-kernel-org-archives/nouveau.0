From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 7/7] mm: comment on VM_FAULT_RETRY semantics in
 handle_mm_fault
Date: Wed, 24 Jul 2019 08:52:58 +0200
Message-ID: <20190724065258.16603-8-hch@lst.de>
References: <20190724065258.16603-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190724065258.16603-1-hch-jcswGhMUV9g@public.gmane.org>
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
Cc: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIG1hZ2ljIGRyb3Bw
aW5nIG9mIG1tYXBfc2VtIHdoZW4gaGFuZGxlX21tX2ZhdWx0IHJldHVybnMKVk1fRkFVTFRfUkVU
UlkgaXMgcmF0aGVyIHN1YnRpbGUuICBBZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CltoY2g6IHdyb3Rl
IGEgY2hhbmdlbG9nXQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBtbS9obW0uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXgg
MTZiNjczMWEzNGRiLi41NGIzYTQxNjJhZTkgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21t
L2htbS5jCkBAIC0zMDEsOCArMzAxLDEwIEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVsdChz
dHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCWZsYWdzIHw9IGhtbV92
bWFfd2Fsay0+YmxvY2sgPyAwIDogRkFVTFRfRkxBR19BTExPV19SRVRSWTsKIAlmbGFncyB8PSB3
cml0ZV9mYXVsdCA/IEZBVUxUX0ZMQUdfV1JJVEUgOiAwOwogCXJldCA9IGhhbmRsZV9tbV9mYXVs
dCh2bWEsIGFkZHIsIGZsYWdzKTsKLQlpZiAocmV0ICYgVk1fRkFVTFRfUkVUUlkpCisJaWYgKHJl
dCAmIFZNX0ZBVUxUX1JFVFJZKSB7CisJCS8qIE5vdGUsIGhhbmRsZV9tbV9mYXVsdCBkaWQgdXBf
cmVhZCgmbW0tPm1tYXBfc2VtKSkgKi8KIAkJcmV0dXJuIC1FQUdBSU47CisJfQogCWlmIChyZXQg
JiBWTV9GQVVMVF9FUlJPUikgewogCQkqcGZuID0gcmFuZ2UtPnZhbHVlc1tITU1fUEZOX0VSUk9S
XTsKIAkJcmV0dXJuIC1FRkFVTFQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQ==
