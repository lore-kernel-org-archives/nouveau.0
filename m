From: poma <pomidorabelisima@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events
Date: Wed, 2 Dec 2015 06:40:32 +0100
Message-ID: <CAF+9+UPxVnRU_RJLTpr6qVFZU8A3oz9pzMF_yStjk5gBpharkg@mail.gmail.com>
References: <1446242140-6766-1-git-send-email-daniel.vetter@ffwll.ch>
 <5637147C.6010802@daenzer.net>
 <20151116151100.GU16848@phenom.ffwll.local>
 <CAF+9+UOe=vj0PGJZ21orH4BAkSYJO294qrJY_2vWTJvqQbi9ZQ@mail.gmail.com>
 <20151201155519.GW17050@phenom.ffwll.local>
 <565DD933.4010004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <565DD933.4010004@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, DRI Development <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Nouveau Dev <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBEZWMgMSwgMjAxNSBhdCA2OjMwIFBNLCBNYXJpbyBLbGVpbmVyCjxtYXJpby5rbGVp
bmVyLmRlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gV2hlbiB3ZSBhcmUgYXQgaXQsIHRoZSBvbmUgd2l0
aCB0aGUgdGl0bGUgIltQQVRDSF0gZHJtL25vdXZlYXU6IFVzZQo+IGRybV92Ymxhbmtfb24vb2Zm
IGNvbnNpc3RlbnRseSIgZnJvbSBEYW5pZWwsIHdoaWNoIGhhcyBhIHJldmlld2VkIGFuZCB0ZXN0
ZWQKPiBieSBtZSBhbHNvIG5ldmVyIG1hZGUgaXQgaW50byBub3V2ZWF1Lgo+Cj4gTWF5YmUgcGlj
ayB0aGF0IHVwIGFzIHdlbGw/Cj4KPiAtbWFyaW8KPgoKSWYgeW91IHJlZmVyIHRvCiJbMS8zXSBk
cm0vbm91dmVhdTogVXNlIGRybV92Ymxhbmtfb24vb2ZmIGNvbnNpc3RlbnRseSIKaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzUwNzcxCgp0aGlzIGlzIHRoZSByZXN1bHQ6
CnBhdGNoZWQgNC40LjAtMC5yYzMuZ2l0MC4xLmZjMjQueDg2XzY0IHdpdGggaXQsCmkuZS4gMS0z
LWRybS1ub3V2ZWF1LVVzZS1kcm1fdmJsYW5rX29uLW9mZi1jb25zaXN0ZW50bHkucGF0Y2gKCiMg
Y2F0IC92YXIvbG9nL1hvcmcuMC5sb2cKWyAgIDEyNi4zNjBdClguT3JnIFggU2VydmVyIDEuMTgu
MAouLi4KWyAgIDEyNi45MDldIChFRSkgW2RybV0gRmFpbGVkIHRvIG9wZW4gRFJNIGRldmljZSBm
b3IgcGNpOjAwMDA6MDI6MDAuMDogLTE5ClsgICAxMjYuOTA5XSAoRUUpIE5vIGRldmljZXMgZGV0
ZWN0ZWQuClsgICAxMjYuOTA5XSAoRUUpCkZhdGFsIHNlcnZlciBlcnJvcjoKWyAgIDEyNi45MDld
IChFRSkgbm8gc2NyZWVucyBmb3VuZChFRSkKWyAgIDEyNi45MDldIChFRSkKUGxlYXNlIGNvbnN1
bHQgLi4uLgouLi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
