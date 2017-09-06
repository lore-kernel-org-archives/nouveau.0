From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Nouveau] [PATCH] [RESEND] drm/nouveau/clk: fix gcc-7
 -Wint-in-bool-context warning
Date: Wed, 6 Sep 2017 23:40:59 +0200
Message-ID: <CAK8P3a3iAX2EkYKxu+xdjcWBJepwWesxbvF5fyosd7Aup8=WqA@mail.gmail.com>
References: <20170906135628.3513172-1-arnd@arndb.de>
 <CAEXux-YvOeosEpZ9jCUsyLG2PUY=97KHcWDZJHxbZpo_paDu9w@mail.gmail.com>
 <CAK8P3a3_2JfEOncxwRfV1qGiMcsxQu+=N6gnXnu04fLGok7mQg@mail.gmail.com>
 <CAEXux-YrqdiGPxkzPUdLxVS7kW1Q-x0KhibA=NGy3Hzm49tb_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEXux-YrqdiGPxkzPUdLxVS7kW1Q-x0KhibA=NGy3Hzm49tb_w@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Karol Herbst <karolherbst@gmail.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBTZXAgNiwgMjAxNyBhdCAxMDoxNSBQTSwgS2Fyb2wgSGVyYnN0IDxrYXJvbGhlcmJz
dEBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDYsIDIwMTcgYXQgMTA6MTEgUE0sIEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Pj4gYnV0IHdpdGggYSBiZXR0ZXIg
bmFtZSBmb3IgImRlbm9taW5hdG9yIi4KPj4KPj4gSSBkb24ndCBrbm93IHdoYXQgTSBhbmQgUCBh
Y3R1YWxseSBhcmUgaW4gdGhpcyBmdW5jdGlvbiwgc28gSSBjb3VsZG4ndAo+PiBjb21lIHVwIHdp
dGggYSBtdWNoIGJldHRlciBuYW1lIGVpdGhlciwgaG93IGFib3V0IHNpbXBseSAnZGl2aXNvcic/
Cj4+Cj4KPiB3aGF0IGFib3V0ICJNUCI/IE0gYW5kIFAgYXJlIHNpbXBseSBkaXZpZGVycyBmb3Ig
dGhlIFBMTCBjb25maWd1cmF0aW9uCj4gYW5kIHRoZXJlIGFyZSB0d28gb2YgdGhlbS4gSSB0aGlu
ayAiUCIgaXMgdGhlIHBvc3QgZGl2aWRlci4KPgoKRmluZSB3aXRoIG1lLiBUaGF0IHdhcyBhY3R1
YWxseSB3aGF0IEkgaW5pdGlhbGx5IGRpZCBhZnRlciB5b3VyIHJlcGx5IGFuZAp0aGVuIGNoYW5n
ZWQgaXQgdG8gZGl2aXNvci4gSSd2ZSBjaGFuZ2VkIGl0IGJhY2sgbm93IGFuZCBzZW50IHRoZSBu
ZXcKdmVyc2lvbi4KCiAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
