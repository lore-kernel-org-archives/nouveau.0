From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] gr/gf100: do not assume a PMU is present
Date: Thu, 3 Sep 2015 15:32:35 +0900
Message-ID: <1441261955-3577-3-git-send-email-acourbot@nvidia.com>
References: <1441261955-3577-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1441261955-3577-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U29tZSBkZXZpY2VzIG1heSBub3QgaGF2ZSBhIFBNVS4gQXZvaWQgYSBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgaW4Kc3VjaCBjYXNlcy4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90
IDxhY291cmJvdEBudmlkaWEuY29tPgotLS0KIGRybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dm
MTAwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dmMTAwLmMgYi9k
cm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9nZjEwMC5jCmluZGV4IGYxMzU4YTU2NGUzZS4uZjI1
MmZhMmQ3Y2Y5IDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9nci9nZjEwMC5j
CisrKyBiL2RybS9ub3V2ZWF1L252a20vZW5naW5lL2dyL2dmMTAwLmMKQEAgLTE0OTksNyArMTQ5
OSw4IEBAIGdmMTAwX2dyX29uZWluaXQoc3RydWN0IG52a21fZ3IgKmJhc2UpCiAJc3RydWN0IG52
a21fZGV2aWNlICpkZXZpY2UgPSBnci0+YmFzZS5lbmdpbmUuc3ViZGV2LmRldmljZTsKIAlpbnQg
cmV0LCBpLCBqOwogCi0JbnZrbV9wbXVfcGdvYihkZXZpY2UtPnBtdSwgZmFsc2UpOworCWlmIChk
ZXZpY2UtPnBtdSkKKwkJbnZrbV9wbXVfcGdvYihkZXZpY2UtPnBtdSwgZmFsc2UpOwogCiAJcmV0
ID0gbnZrbV9tZW1vcnlfbmV3KGRldmljZSwgTlZLTV9NRU1fVEFSR0VUX0lOU1QsIDB4MTAwMCwg
MjU2LCBmYWxzZSwKIAkJCSAgICAgICZnci0+dW5rNDE4OGI0KTsKLS0gCjIuNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
