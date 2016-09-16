From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau/led: abort early if the device
	does not have GPIOs
Date: Fri, 16 Sep 2016 10:34:44 +0300
Message-ID: <20160916073444.8952-3-martin.peres@free.fr>
References: <20160916073444.8952-1-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160916073444.8952-1-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAZnJlZS5mcj4KLS0tCiBk
cm0vbm91dmVhdS9ub3V2ZWF1X2xlZC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9ub3V2ZWF1X2xlZC5jIGIvZHJtL25v
dXZlYXUvbm91dmVhdV9sZWQuYwppbmRleCAxZjczMWRhLi4zZTJmMWI2IDEwMDY0NAotLS0gYS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2xlZC5jCisrKyBiL2RybS9ub3V2ZWF1L25vdXZlYXVfbGVkLmMK
QEAgLTgyLDYgKzgyLDkgQEAgbm91dmVhdV9sZWRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQogCXN0cnVjdCBkY2JfZ3Bpb19mdW5jIGxvZ29fbGVkOwogCWludCByZXQ7CiAKKwlpZiAoIWdw
aW8pCisJCXJldHVybiAwOworCiAJLyogY2hlY2sgdGhhdCB0aGVyZSBpcyBhIEdQSU8gY29udHJv
bGxpbmcgdGhlIGxvZ28gTEVEICovCiAJaWYgKG52a21fZ3Bpb19maW5kKGdwaW8sIDAsIERDQl9H
UElPX0xPR09fTEVEX1BXTSwgMHhmZiwgJmxvZ29fbGVkKSkKIAkJcmV0dXJuIDA7Ci0tIAoyLjgu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
