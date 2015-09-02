From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH] clk/gt215: Unbreak engine pausing for GT21x/MCP7x
Date: Wed,  2 Sep 2015 23:21:02 +0100
Message-ID: <1441232462-15053-2-git-send-email-rspliet@eclipso.eu>
References: <1441232462-15053-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1441232462-15053-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

VHlwbyB0aGF0IHNudWNrIGluIHdpdGggY29tbWl0IDY5NzljNjMwM2E0YWJmMjYzNzUzY2Q5ZDU3
N2Q3OWYwNWM2ZThjNDcKClNpZ25lZC1vZmYtYnk6IFJveSBTcGxpZXQgPHJzcGxpZXRAZWNsaXBz
by5ldT4KUmVwb3J0ZWQtYnk6IFBpZXJyZSBNb3JlYXUgPHBpZXJyZS5tb3Jyb3dAZnJlZS5mcj4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ3QyMTUuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9ndDIxNS5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2d0MjE1LmMKaW5kZXggMDdm
ZWFlNi4uYzIzM2UzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvY2xrL2d0MjE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvY2xrL2d0MjE1LmMKQEAgLTMyNiw3ICszMjYsNyBAQCBndDIxNV9jbGtfcHJlKHN0cnVjdCBu
dmttX2NsayAqY2xrLCB1bnNpZ25lZCBsb25nICpmbGFncykKIAkJcmV0dXJuIC1FSU87CiAKIAlp
ZiAobnZrbV9tc2VjKGRldmljZSwgMjAwMCwKLQkJdTMyIHRtcCA9IG52a21fcmQzMihkZXZpY2Us
IDB4MDAyNTA0KSAmIDB4MDAwMDAwM2Y7CisJCXUzMiB0bXAgPSBudmttX3JkMzIoZGV2aWNlLCAw
eDAwMjUxYykgJiAweDAwMDAwMDNmOwogCQlpZiAodG1wID09IDB4MDAwMDAwM2YpCiAJCQlicmVh
azsKIAkpIDwgMCkKLS0gCjIuNC4zCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1Cg==
