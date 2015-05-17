From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 09/12] nvc0/ir: patch vertex count is stored in
	the upper bits
Date: Sun, 17 May 2015 01:07:12 -0400
Message-ID: <1431839235-10256-10-git-send-email-imirkin@alum.mit.edu>
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
X252YzAuY3BwIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9sb3dl
cmluZ19udmMwLmNwcCBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBf
aXJfbG93ZXJpbmdfbnZjMC5jcHAKaW5kZXggYjYxZjNjNC4uYmU4Mjk0NCAxMDA2NDQKLS0tIGEv
c3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9sb3dlcmluZ19udmMw
LmNwcAorKysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2xv
d2VyaW5nX252YzAuY3BwCkBAIC0xNDgwLDYgKzE0ODAsMTAgQEAgTlZDMExvd2VyaW5nUGFzczo6
aGFuZGxlUkRTVihJbnN0cnVjdGlvbiAqaSkKICAgICAgICAgIGktPm9wID0gT1BfTU9WOwogICAg
ICAgICAgaS0+c2V0U3JjKDAsIGJsZC5ta0ltbSgoc3YgPT0gU1ZfTlRJRCB8fCBzdiA9PSBTVl9O
Q1RBSUQpID8gMSA6IDApKTsKICAgICAgIH0KKyAgICAgIGlmIChzdiA9PSBTVl9WRVJURVhfQ09V
TlQpIHsKKyAgICAgICAgIGJsZC5zZXRQb3NpdGlvbihpLCB0cnVlKTsKKyAgICAgICAgIGJsZC5t
a09wMihPUF9FWFRCRiwgVFlQRV9VMzIsIGktPmdldERlZigwKSwgaS0+Z2V0RGVmKDApLCBibGQu
bWtJbW0oMHg4MDgpKTsKKyAgICAgIH0KICAgICAgIHJldHVybiB0cnVlOwogICAgfQogCi0tIAoy
LjMuNgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
