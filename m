From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 01/22] mm: remove the unused ARCH_HAS_HMM_DEVICE
 Kconfig option
Date: Thu, 13 Jun 2019 11:43:04 +0200
Message-ID: <20190613094326.24093-2-hch@lst.de>
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogbW0vS2Nv
bmZpZyB8IDEwIC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZwppbmRleCBmMGM3NmJhNDc2OTUuLjBk
MmJhN2UxZjQzZSAxMDA2NDQKLS0tIGEvbW0vS2NvbmZpZworKysgYi9tbS9LY29uZmlnCkBAIC02
NzUsMTYgKzY3NSw2IEBAIGNvbmZpZyBBUkNIX0hBU19ITU1fTUlSUk9SCiAJZGVwZW5kcyBvbiAo
WDg2XzY0IHx8IFBQQzY0KQogCWRlcGVuZHMgb24gTU1VICYmIDY0QklUCiAKLWNvbmZpZyBBUkNI
X0hBU19ITU1fREVWSUNFCi0JYm9vbAotCWRlZmF1bHQgeQotCWRlcGVuZHMgb24gKFg4Nl82NCB8
fCBQUEM2NCkKLQlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCi0JZGVwZW5kcyBvbiBNRU1PUllf
SE9UUkVNT1ZFCi0JZGVwZW5kcyBvbiBTUEFSU0VNRU1fVk1FTU1BUAotCWRlcGVuZHMgb24gQVJD
SF9IQVNfWk9ORV9ERVZJQ0UKLQlzZWxlY3QgWEFSUkFZX01VTFRJCi0KIGNvbmZpZyBBUkNIX0hB
U19ITU0KIAlib29sCiAJZGVmYXVsdCB5Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
