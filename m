From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Nouveau] [PATCH v4 3/3] drm/nouveau/fb/nv50: defer DMA mapping
 of scratch page to init() hook
Date: Mon, 3 Oct 2016 14:45:59 +0900
Message-ID: <CAAVeFu+E0032ykOe99W32ACgMX5ZNgYiHn4KSZ9oyEeWtjzvRg@mail.gmail.com>
References: <1474893160-12321-1-git-send-email-ard.biesheuvel@linaro.org>
 <1474893160-12321-4-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1474893160-12321-4-git-send-email-ard.biesheuvel@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBTZXAgMjYsIDIwMTYgYXQgOTozMiBQTSwgQXJkIEJpZXNoZXV2ZWwKPGFyZC5iaWVz
aGV1dmVsQGxpbmFyby5vcmc+IHdyb3RlOgo+IFRoZSAxMDBjMDggc2NyYXRjaCBwYWdlIGlzIG1h
cHBlZCB1c2luZyBkbWFfbWFwX3BhZ2UoKSBiZWZvcmUgdGhlIFRUTQo+IGxheWVyIGhhcyBoYWQg
YSBjaGFuY2UgdG8gc2V0IHRoZSBETUEgbWFzay4gVGhpcyBtZWFucyB3ZSBhcmUgc3RpbGwKPiBy
dW5uaW5nIHdpdGggdGhlIGRlZmF1bHQgb2YgMzIgd2hlbiB0aGlzIGNvZGUgZXhlY3V0ZXMsIGFu
ZCB0aGlzIGNhdXNlcwo+IHByb2JsZW1zIGZvciBwbGF0Zm9ybXMgd2l0aCBubyBtZW1vcnkgYmVs
b3cgNCBHQiAoc3VjaCBhcyBBTUQgU2VhdHRsZSkKPgo+IFNvIG1vdmUgdGhlIGRtYV9tYXBfcGFn
ZSgpIHRvIHRoZSAuaW5pdCBob29rLCB3aGljaCBleGVjdXRlcyBhZnRlciB0aGUKPiBETUEgbWFz
ayBoYXMgYmVlbiBzZXQuCgpUaGUgY29tbWVudHMgSSBkaWQgb24gZ2YxMDAgYWxzbyBhcHBseSBo
ZXJlLiBUaGUgb25seSBkaWZmZXJlbmNlIGlzCnRoYXQgeW91IHdpbGwgaGF2ZSB0byBjcmVhdGUg
dGhlIG9uZWluaXQgaG9vayB3aGljaCBkb2VzIG5vdCBleGlzdCBpbgp0aGlzIGZpbGUuCgpUaGFu
a3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
