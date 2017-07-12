From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Wed, 12 Jul 2017 07:37:56 -0400
Message-ID: <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1499858703.23742.25.camel@gmx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Galbraith <efault@gmx.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMTIsIDIwMTcgYXQgNzoyNSBBTSwgTWlrZSBHYWxicmFpdGggPGVmYXVsdEBn
bXguZGU+IHdyb3RlOgo+IE9uIFdlZCwgMjAxNy0wNy0xMiBhdCAxMTo1NSArMDIwMCwgTWlrZSBH
YWxicmFpdGggd3JvdGU6Cj4+IE9uIFR1ZSwgMjAxNy0wNy0xMSBhdCAxNDoyMiAtMDQwMCwgSWxp
YSBNaXJraW4gd3JvdGU6Cj4+ID4KPj4gPiBTb21lIGRpc3BsYXkgc3R1ZmYgZGlkIGNoYW5nZSBm
b3IgNC4xMyBmb3IgR00yMHgrIGJvYXJkcy4gSWYgaXQncyBub3QKPj4gPiB0b28gbXVjaCB0cm91
YmxlLCBhIGJpc2VjdCB3b3VsZCBiZSBwcmV0dHkgdXNlZnVsLgo+Pgo+PiBCaXNlY3Rpb24gc2Vl
bWluZ2x5IHdlbnQgZmluZSwgYnV0IHRoZSByZXN1bHQgaXMgb2RkLgo+Pgo+PiBlOThjNThlNTVm
NjhmODc4NWFlYmZhYjFmOGM5YTAzZDhkZTBhZmUxIGlzIHRoZSBmaXJzdCBiYWQgY29tbWl0Cj4K
PiBCdXQgaXQgcmVhbGx5IHJlYWxseSBpcyBiYWQuICBMb29raW5nIGF0IGdpdGsgZm9yayBpbiB0
aGUgcm9hZCBsZWFkaW5nCj4gdG8gaXQuLi4KPgo+IDUyZDlkMzhjMTgzYiBkcm0vc3RpOmZpeCBz
cGVsbGluZyBtaXN0YWtlOiAiY29tcG9tZW50IiAtPiAiY29tcG9uZW50IiAtIGdvb2QKPiBlNGU4
MThjYzJkN2MgZHJtOiBtYWtlIGRybV9wYW5lbC5oIHNlbGYtY29udGFpbmVkICAgICAgICAgICAg
ICAgICAgICAgLSBnb29kCj4gOWNmOGY1ODAyZjM5IGRybTogYWRkIG1pc3NpbmcgZGVjbGFyYXRp
b24gdG8gZHJtX2JsZW5kLmggICAgICAgICAgICAgIC0gZ29vZAo+Cj4gQmVmb3JlIHRoZSBnaXQg
aGlnaHdheSBzcGxpdHMsIGFsbCBpcyB3ZWxsLiAgVGhlIGxhbmUgd2l0aCBjb21taXRzCj4gd29y
a3MgZmluZSBhdCBib3RoIGVuZHMsIGJ1dCBlOThjNThlNTVmNjggaXMgYnVzdGVkLiAgTWVyZ2Ug
YXJmaWZhY3Q/CgpIbW1tLi4uIHRoYXQgdHJlZSBkb2VzIG5vdCBhcHBlYXIgdG8gaGF2ZSBnb3R0
ZW4gYSB2NC4xMiBiYWNrbWVyZ2UgYXQKYW55IHBvaW50LiBUaGUgbGFzdCBiYWNrbWVyZ2UgZnJv
bSBMaW51cyBhcyBmYXIgYXMgSSBjYW4gdGVsbCB3YXMKdjQuMTEtcmM3LiBDb3VsZCBiZSBhbiBp
bnRlcmFjdGlvbiB3aXRoIHNvbWUgb3V0LW9mLXRyZWUgY2hhbmdlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
