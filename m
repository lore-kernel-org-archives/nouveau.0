From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] drm/radeon: disable AGP by default
Date: Wed, 13 May 2020 13:03:12 +0200
Message-ID: <20200513110313.12979-2-christian.koenig@amd.com>
References: <20200513110313.12979-1-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200513110313.12979-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, debian-powerpc-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

QWx3YXlzIHVzZSB0aGUgUENJIEdBUlQgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5kZXggYmJiMDg4M2U4Y2U2Li5h
NzFmMTMxMTZkNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC0xNzEsMTIg
KzE3MSw3IEBAIGludCByYWRlb25fbm9fd2I7CiBpbnQgcmFkZW9uX21vZGVzZXQgPSAtMTsKIGlu
dCByYWRlb25fZHluY2xrcyA9IC0xOwogaW50IHJhZGVvbl9yNHh4X2F0b20gPSAwOwotI2lmZGVm
IF9fcG93ZXJwY19fCi0vKiBEZWZhdWx0IHRvIFBDSSBvbiBQb3dlclBDIChmZG8gIzk1MDE3KSAq
LwogaW50IHJhZGVvbl9hZ3Btb2RlID0gLTE7Ci0jZWxzZQotaW50IHJhZGVvbl9hZ3Btb2RlID0g
MDsKLSNlbmRpZgogaW50IHJhZGVvbl92cmFtX2xpbWl0ID0gMDsKIGludCByYWRlb25fZ2FydF9z
aXplID0gLTE7IC8qIGF1dG8gKi8KIGludCByYWRlb25fYmVuY2htYXJraW5nID0gMDsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
