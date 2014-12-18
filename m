From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 3/3] clk: allow users to enable auto mode when
	loading driver
Date: Thu, 18 Dec 2014 14:28:12 +0800
Message-ID: <1418884092-14448-4-git-send-email-vinceh@nvidia.com>
References: <1418884092-14448-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1418884092-14448-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIG9uZSBvcHRpb24gZm9yIHRoZSBib290IGNvbmZpZyBzdHJpbmdzICJO
dkNsa01vZGUqIiwgc28KdGhhdCB3ZSBjYW4gZW5hYmxlIHRoZSAiYXV0byIgbW9kZSB3aGVuIGxv
YWRpbmcgbW9kdWxlLgoKU2lnbmVkLW9mZi1ieTogVmluY2UgSHN1IDx2aW5jZWhAbnZpZGlhLmNv
bT4KLS0tCiBudmttL3N1YmRldi9jbG9jay9iYXNlLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL252a20vc3ViZGV2L2Nsb2NrL2Jhc2UuYyBi
L252a20vc3ViZGV2L2Nsb2NrL2Jhc2UuYwppbmRleCBiMWJiZTc2NGZhMzUuLmJjMDk1YjQ3MDEy
MSAxMDA2NDQKLS0tIGEvbnZrbS9zdWJkZXYvY2xvY2svYmFzZS5jCisrKyBiL252a20vc3ViZGV2
L2Nsb2NrL2Jhc2UuYwpAQCAtNDAxLDYgKzQwMSw5IEBAIG5vdXZlYXVfY2xvY2tfbnN0YXRlKHN0
cnVjdCBub3V2ZWF1X2Nsb2NrICpjbGssIGNvbnN0IGNoYXIgKm1vZGUsIGludCBhcmdsZW4pCiB7
CiAJaW50IHJldCA9IDE7CiAKKwlpZiAoY2xrLT5hbGxvd19yZWNsb2NrICYmICFzdHJuY2FzZWNt
cHoobW9kZSwgImF1dG8iLCBhcmdsZW4pKQorCQlyZXR1cm4gLTI7CisKIAlpZiAoc3RybmNhc2Vj
bXB6KG1vZGUsICJkaXNhYmxlZCIsIGFyZ2xlbikpIHsKIAkJY2hhciBzYXZlID0gbW9kZVthcmds
ZW5dOwogCQlsb25nIHY7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
