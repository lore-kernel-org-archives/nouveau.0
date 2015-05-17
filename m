From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 10/12] nvc0/ir: handle loads from outputs in
	control shaders
Date: Sun, 17 May 2015 01:07:13 -0400
Message-ID: <1431839235-10256-11-git-send-email-imirkin@alum.mit.edu>
References: <1431839235-10256-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1431839235-10256-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

LS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2xvd2VyaW5n
X252YzAuY3BwIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2xvd2Vy
aW5nX252YzAuY3BwIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9p
cl9sb3dlcmluZ19udmMwLmNwcAppbmRleCBiZTgyOTQ0Li5iNTQwNGM4IDEwMDY0NAotLS0gYS9z
cmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2xvd2VyaW5nX252YzAu
Y3BwCisrKyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfbG93
ZXJpbmdfbnZjMC5jcHAKQEAgLTE3NzMsNiArMTc3Myw5IEBAIE5WQzBMb3dlcmluZ1Bhc3M6OnZp
c2l0KEluc3RydWN0aW9uICppKQogICAgICAgICAgICAgaS0+c2V0SW5kaXJlY3QoMCwgMCwgcHRy
KTsKICAgICAgICAgICAgIGktPnN1Yk9wID0gTlY1MF9JUl9TVUJPUF9MRENfSVM7CiAgICAgICAg
ICB9CisgICAgICB9IGVsc2UgaWYgKGktPnNyYygwKS5nZXRGaWxlKCkgPT0gRklMRV9TSEFERVJf
T1VUUFVUKSB7CisgICAgICAgICBhc3NlcnQocHJvZy0+Z2V0VHlwZSgpID09IFByb2dyYW06OlRZ
UEVfVEVTU0VMTEFUSU9OX0NPTlRST0wpOworICAgICAgICAgaS0+b3AgPSBPUF9WRkVUQ0g7CiAg
ICAgICB9CiAgICAgICBicmVhazsKICAgIGNhc2UgT1BfQVRPTToKLS0gCjIuMy42CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
