From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 07/11] nvc0/ir: no instruction can load a double
	immediate
Date: Thu, 19 Feb 2015 20:02:36 -0500
Message-ID: <1424394160-22417-7-git-send-email-imirkin@alum.mit.edu>
References: <1424394160-22417-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1424394160-22417-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHNy
Yy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfdGFyZ2V0X252YzAuY3Bw
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Ny
Yy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfdGFyZ2V0X252YzAuY3Bw
IGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl90YXJnZXRfbnZj
MC5jcHAKaW5kZXggODE3Y2ViOC4uN2Q0YTg1OSAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0vZHJp
dmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl90YXJnZXRfbnZjMC5jcHAKKysrIGIvc3JjL2dh
bGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl90YXJnZXRfbnZjMC5jcHAKQEAg
LTMzNyw2ICszMzcsOCBAQCBUYXJnZXROVkMwOjppbnNuQ2FuTG9hZChjb25zdCBJbnN0cnVjdGlv
biAqaSwgaW50IHMsCiAgICBpZiAoc2YgPT0gRklMRV9JTU1FRElBVEUpIHsKICAgICAgIFN0b3Jh
Z2UgJnJlZyA9IGxkLT5nZXRTcmMoMCktPmFzSW1tKCktPnJlZzsKIAorICAgICAgaWYgKHR5cGVT
aXplb2YoaS0+c1R5cGUpID4gNCkKKyAgICAgICAgIHJldHVybiBmYWxzZTsKICAgICAgIGlmIChv
cEluZm9baS0+b3BdLmltbWRCaXRzICE9IDB4ZmZmZmZmZmYpIHsKICAgICAgICAgIGlmIChpLT5z
VHlwZSA9PSBUWVBFX0YzMikgewogICAgICAgICAgICAgaWYgKHJlZy5kYXRhLnUzMiAmIDB4ZmZm
KQotLSAKMi4wLjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCm1lc2EtZGV2IG1haWxpbmcgbGlzdAptZXNhLWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==
