From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 4/4] clk: allow users to enable auto mode when
	loading driver
Date: Mon, 22 Dec 2014 17:11:40 +0800
Message-ID: <1419239500-19703-4-git-send-email-vinceh@nvidia.com>
References: <1419239500-19703-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1419239500-19703-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIG9uZSBvcHRpb24gZm9yIHRoZSBib290IGNvbmZpZyBzdHJpbmdzICJO
dkNsa01vZGUqIiwgc28KdGhhdCB3ZSBjYW4gZW5hYmxlIHRoZSAiYXV0byIgbW9kZSB3aGVuIGxv
YWRpbmcgbW9kdWxlLgoKU2lnbmVkLW9mZi1ieTogVmluY2UgSHN1IDx2aW5jZWhAbnZpZGlhLmNv
bT4KLS0tCgp2Mjogbm9uZS4gKHYxIGlzIHRoZSBSRkMpCgogbnZrbS9zdWJkZXYvY2xvY2svYmFz
ZS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9udmttL3N1YmRldi9jbG9jay9iYXNlLmMgYi9udmttL3N1YmRldi9jbG9jay9iYXNlLmMKaW5k
ZXggYjFiYmU3NjRmYTM1Li5iYzA5NWI0NzAxMjEgMTAwNjQ0Ci0tLSBhL252a20vc3ViZGV2L2Ns
b2NrL2Jhc2UuYworKysgYi9udmttL3N1YmRldi9jbG9jay9iYXNlLmMKQEAgLTQwMSw2ICs0MDEs
OSBAQCBub3V2ZWF1X2Nsb2NrX25zdGF0ZShzdHJ1Y3Qgbm91dmVhdV9jbG9jayAqY2xrLCBjb25z
dCBjaGFyICptb2RlLCBpbnQgYXJnbGVuKQogewogCWludCByZXQgPSAxOwogCisJaWYgKGNsay0+
YWxsb3dfcmVjbG9jayAmJiAhc3RybmNhc2VjbXB6KG1vZGUsICJhdXRvIiwgYXJnbGVuKSkKKwkJ
cmV0dXJuIC0yOworCiAJaWYgKHN0cm5jYXNlY21weihtb2RlLCAiZGlzYWJsZWQiLCBhcmdsZW4p
KSB7CiAJCWNoYXIgc2F2ZSA9IG1vZGVbYXJnbGVuXTsKIAkJbG9uZyB2OwotLSAKMS45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
