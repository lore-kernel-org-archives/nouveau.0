From: Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>
Subject: [PATCH v2 4/7] clk: drop cstates with higher voltage than
	boost_max_voltage
Date: Wed,  2 Dec 2015 17:24:31 +0100
Message-ID: <1449073474-3445-5-git-send-email-nouveau@karolherbst.de>
References: <1449073474-3445-1-git-send-email-nouveau@karolherbst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1449073474-3445-1-git-send-email-nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

LS0tCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvYmFzZS5jIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9jbGsvYmFzZS5jIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2Jhc2UuYwppbmRl
eCBkNzMxYmMzLi40M2FiY2E3IDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9j
bGsvYmFzZS5jCisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9iYXNlLmMKQEAgLTE1
NCw2ICsxNTQsOSBAQCBudmttX2NzdGF0ZV9uZXcoc3RydWN0IG52a21fY2xrICpjbGssIGludCBp
ZHgsIHN0cnVjdCBudmttX3BzdGF0ZSAqcHN0YXRlKQogCWlmICh2b2x0ICYmICh2b2x0YWdlID4g
dm9sdC0+bWF4X3ZvbHRhZ2UgfHwgdm9sdGFnZSA8IHZvbHQtPm1pbl92b2x0YWdlKSkKIAkJcmV0
dXJuIC1FSU5WQUw7CiAKKwlpZiAodm9sdCAmJiB2b2x0LT5ib29zdF9tYXhfdm9sdGFnZSAmJiAo
dm9sdGFnZSA+IHZvbHQtPmJvb3N0X21heF92b2x0YWdlKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisK
IAljc3RhdGUgPSBremFsbG9jKHNpemVvZigqY3N0YXRlKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFj
c3RhdGUpCiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi42LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
