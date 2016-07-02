From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Nouveau] [PATCH 2/6] drm/nouveau/core: make use of new
 strtolower() function
Date: Sat, 2 Jul 2016 10:18:11 +0900
Message-ID: <CAAVeFuKabYS8s42GghnDSNe_AVa5v+1w_OHiR6cEgdU0_Dz7UA@mail.gmail.com>
References: <1467330612-26242-1-git-send-email-mmayer@broadcom.com>
 <1467330612-26242-3-git-send-email-mmayer@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467330612-26242-3-git-send-email-mmayer@broadcom.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Markus Mayer <mmayer@broadcom.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMSwgMjAxNiBhdCA4OjUwIEFNLCBNYXJrdXMgTWF5ZXIgPG1tYXllckBicm9h
ZGNvbS5jb20+IHdyb3RlOgo+IENhbGwgc3RydG9sb3dlcigpIHJhdGhlciB0aGFuIHdhbGtpbmcg
dGhlIHN0cmluZyBleHBsaWNpdGx5IHRvIGNvbnZlcnQKPiBpdCB0byBsb3dlcmNhc2UuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYXJrdXMgTWF5ZXIgPG1tYXllckBicm9hZGNvbS5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9maXJtd2FyZS5jIHwgNyArLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2NvcmUvZmlybXdhcmUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9maXJtd2FyZS5jCj4gaW5kZXggMzRl
Y2Q0YS4uYzUwNTk0YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L2NvcmUvZmlybXdhcmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29y
ZS9maXJtd2FyZS5jCj4gQEAgLTM2LDE2ICszNiwxMSBAQCBudmttX2Zpcm13YXJlX2dldChzdHJ1
Y3QgbnZrbV9kZXZpY2UgKmRldmljZSwgY29uc3QgY2hhciAqZnduYW1lLAo+ICB7Cj4gICAgICAg
ICBjaGFyIGZbNjRdOwo+ICAgICAgICAgY2hhciBjbmFtZVsxNl07Cj4gLSAgICAgICBpbnQgaTsK
Pgo+ICAgICAgICAgLyogQ29udmVydCBkZXZpY2UgbmFtZSB0byBsb3dlcmNhc2UgKi8KPiAgICAg
ICAgIHN0cm5jcHkoY25hbWUsIGRldmljZS0+Y2hpcC0+bmFtZSwgc2l6ZW9mKGNuYW1lKSk7Cj4g
ICAgICAgICBjbmFtZVtzaXplb2YoY25hbWUpIC0gMV0gPSAnXDAnOwo+IC0gICAgICAgaSA9IHN0
cmxlbihjbmFtZSk7Cj4gLSAgICAgICB3aGlsZSAoaSkgewo+IC0gICAgICAgICAgICAgICAtLWk7
Cj4gLSAgICAgICAgICAgICAgIGNuYW1lW2ldID0gdG9sb3dlcihjbmFtZVtpXSk7Cj4gLSAgICAg
ICB9Cj4gKyAgICAgICBzdHJ0b2xvd2VyKGNuYW1lKTsKClRoaXMgZnVuY3Rpb24gZG9lc24ndCBz
ZWVtIHRvIGV4aXN0IGFzIG9mIG5leHQtMjAxNjA3MDEsIHdoZXJlIGhhdmUKeW91IGZvdW5kIGl0
PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
