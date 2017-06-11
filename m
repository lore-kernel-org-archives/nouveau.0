From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 2/9] tgsi/dump: print _PRECISE modifier on
	Instrutions
Date: Sun, 11 Jun 2017 20:42:32 +0200
Message-ID: <20170611184239.7204-3-karolherbst@gmail.com>
References: <20170611184239.7204-1-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170611184239.7204-1-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxrYXJvbGhlcmJzdEBnbWFpbC5jb20+Ci0tLQog
c3JjL2dhbGxpdW0vYXV4aWxpYXJ5L3Rnc2kvdGdzaV9kdW1wLmMgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9hdXhpbGlh
cnkvdGdzaS90Z3NpX2R1bXAuYyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS90Z3NpL3Rnc2lfZHVt
cC5jCmluZGV4IGY2ZWJhNzQyNGIuLmI1OGU2NDUxMWMgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVt
L2F1eGlsaWFyeS90Z3NpL3Rnc2lfZHVtcC5jCisrKyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS90
Z3NpL3Rnc2lfZHVtcC5jCkBAIC01ODQsNiArNTg0LDEwIEBAIGl0ZXJfaW5zdHJ1Y3Rpb24oCiAg
ICAgICBUWFQoICJfU0FUIiApOwogICAgfQogCisgICBpZiAoaW5zdC0+SW5zdHJ1Y3Rpb24uUHJl
Y2lzZSkgeworICAgICAgVFhUKCAiX1BSRUNJU0UiICk7CisgICB9CisKICAgIGZvciAoaSA9IDA7
IGkgPCBpbnN0LT5JbnN0cnVjdGlvbi5OdW1Ec3RSZWdzOyBpKyspIHsKICAgICAgIGNvbnN0IHN0
cnVjdCB0Z3NpX2Z1bGxfZHN0X3JlZ2lzdGVyICpkc3QgPSAmaW5zdC0+RHN0W2ldOwogCi0tIAoy
LjEzLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
