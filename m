From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] drm/nouveau/gr: mark gm107_grctx_generate_tpcid()
 static
Date: Tue, 30 Aug 2016 14:40:52 +0200
Message-ID: <201608301440.52481.arnd@arndb.de>
References: <1472475747-30296-1-git-send-email-baoyou.xie@linaro.org>
 <CAOw6vbL9C1o+-1w1=cuwazhS6CqhofsiBbBZjYvBsDT+_dcQ6A@mail.gmail.com>
 <CA+DQWkws5sJMnJagECjXdbEKOdFZ8LLbwm9ng6dYt26KUXUQRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CA+DQWkws5sJMnJagECjXdbEKOdFZ8LLbwm9ng6dYt26KUXUQRQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: Sean Paul <seanpaul@google.com>, nouveau@lists.freedesktop.org, xie.baoyou@zte.com.cn, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org

T24gVHVlc2RheSAzMCBBdWd1c3QgMjAxNiwgQmFveW91IFhpZSB3cm90ZToKPiBPbiAzMCBBdWd1
c3QgMjAxNiBhdCAwMDowMSwgU2VhbiBQYXVsIDxzZWFucGF1bEBnb29nbGUuY29tPiB3cm90ZToK
PiAKPiA+IE9uIE1vbiwgQXVnIDI5LCAyMDE2IGF0IDk6MDIgQU0sIEJhb3lvdSBYaWUgPGJhb3lv
dS54aWVAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+IFdlIGdldCAxIHdhcm5pbmcgd2hlbiBidWls
ZCBrZXJuZWwgd2l0aCBXPTE6Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2dyL2N0eGdtMTA3LmM6OTM3OjE6IHdhcm5pbmc6IG5vCj4gPiBwcmV2aW91cyBwcm90b3R5
cGUgZm9yICdnbTEwN19ncmN0eF9nZW5lcmF0ZV90cGNpZCcgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQo+ID4gPgo+ID4gPiBJbiBmYWN0LCB0aGlzIGZ1bmN0aW9uIGlzIG9ubHkgdXNlZCBpbiB0aGUg
ZmlsZSBpbiB3aGljaCBpdCBpcwo+ID4gPiBkZWNsYXJlZCBhbmQgZG9uJ3QgbmVlZCBhIGRlY2xh
cmF0aW9uLCBidXQgY2FuIGJlIG1hZGUgc3RhdGljLgo+ID4gPiBzbyB0aGlzIHBhdGNoIG1hcmtz
IHRoaXMgZnVuY3Rpb24gd2l0aCAnc3RhdGljJy4KPiA+ID4KPiA+Cj4gPiBJdCB3b3VsZCBtYWtl
IHRoaW5ncyBhIGxvdCBlYXNpZXIgaWYgeW91IGVpdGhlciBjb25zb2xpZGF0ZWQgYWxsIG9mCj4g
PiB0aGVzZSBzdGF0aWMgY2hhbmdlcyBpbnRvIG9uZSBwYXRjaCwgb3IgcmVsZWFzZWQgdGhlbSBh
cyBhIHNlcmllcy4KPiA+Cj4gPgo+IERvIHlvdSBtZWFuIHRoYXQgSSBuZWVkIHRvIGNvbnNvbGlk
YXRlIGFsbCBvZiB0aGVtIGludG8gb25lIHBhdGNoIHRoaXMKPiB0aW1lPyBvciBuZXh0IHRpbWU/
CgpJJ2Qgc3VnZ2VzdCBjb25zb2xpZGF0aW5nIHRoZSAnbm91dmVhdScgY2hhbmdlcyBpbnRvIGEg
c2luZ2xlIHBhdGNoLAphcyB0aGlzIGlzIG9uZSAodmVyeSBiaWcpIGRyaXZlciBhbmQgcmVzZW5k
IHRoYXQgb25lLgoKCUFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
