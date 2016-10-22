From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 13/17] drm/nouveau/gr: add missing header
	dependencies
Date: Sat, 22 Oct 2016 17:41:54 +0800
Message-ID: <1477129318-29677-13-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org, nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, tang.qiang007-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, han.fei-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: nouveau.vger.kernel.org

V2UgZ2V0IDIgd2FybmluZ3Mgd2hlbiBidWlsZGluZyBrZXJuZWwgd2l0aCBXPTE6CmRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2N0eG52NTAuYzoyNTU6MTogd2FybmluZzog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnbnY1MF9ncmN0eF9maWxsJyBbLVdtaXNzaW5nLXBy
b3RvdHlwZXNdCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2N0eG52NTAu
YzoyNjU6MTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnbnY1MF9ncmN0eF9p
bml0JyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpJbiBmYWN0LCB0aGVzZSBmdW5jdGlvbnMgYXJl
IGRlY2xhcmVkIGluCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL252NTAu
aC4KU28gdGhpcyBwYXRjaCBhZGRzIG1pc3NpbmcgaGVhZGVyIGRlcGVuZGVuY2llcy4KClNpZ25l
ZC1vZmYtYnk6IEJhb3lvdSBYaWUgPGJhb3lvdS54aWVAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9jdHhudjUwLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vZW5naW5lL2dyL2N0eG52NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vZW5naW5lL2dyL2N0eG52NTAuYwppbmRleCAxZTEzMjc4Li5jOGJiOTE5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9jdHhudjUwLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvY3R4bnY1MC5jCkBAIC0xMDYs
NiArMTA2LDcgQEAKICNkZWZpbmUgQ1BfU0VFS18yICAgICAgMHgwMGM4MDBmZgogCiAjaW5jbHVk
ZSAiY3R4bnY0MC5oIgorI2luY2x1ZGUgIm52NTAuaCIKIAogI2luY2x1ZGUgPHN1YmRldi9mYi5o
PgogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
