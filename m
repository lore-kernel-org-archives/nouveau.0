From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH mesa v2 3/3] nouveau: codegen: LOAD: Take src
 swizzle into account
Date: Fri, 22 Apr 2016 09:23:43 +0200
Message-ID: <5719D17F.3050503@redhat.com>
References: <1461242362-1281-1-git-send-email-hdegoede@redhat.com>
 <1461242362-1281-3-git-send-email-hdegoede@redhat.com>
 <CAKb7UviLsGdRWyqATCHRGnOT-CWKh6hsz0TqL1RQGFyY1fbWPw@mail.gmail.com>
 <CAAxE2A5V82mQQxC0Gif3SC=CcUv++DDaTNy4EmVgiqCkKP5inw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAAxE2A5V82mQQxC0Gif3SC=CcUv++DDaTNy4EmVgiqCkKP5inw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

SGksCgpPbiAyMi0wNC0xNiAwOTowOCwgTWFyZWsgT2zFocOhayB3cm90ZToKPiBPbiBUaHUsIEFw
ciAyMSwgMjAxNiBhdCA3OjA0IFBNLCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+
IHdyb3RlOgo+PiBbK3JhZGVvbiBmb2xrXQo+Pgo+PiBNYXJlaywgTmljb2xhaSwgQmFzIC0gcGxl
YXNlIGhhdmUgYSBsb29rIGF0IHRoZSBkb2MgY2hhbmdlIGFuZCBsZXQgdXMKPj4ga25vdyBpZiB5
b3UgdGhpbmsgdGhpcyB3aWxsIGNhdXNlIGEgcHJvYmxlbSBmb3IgcmFkZW9uLgo+Pgo+PiBIYW5z
IGlzIHNvbHZpbmcgdGhlIGlzc3VlIHRoYXQgaGUgd2FudHMgdG8gc3dpenpsZSB0aGUgZGF0YSBs
b2FkZWQKPj4gZnJvbSB0aGUgaW1hZ2UvYnVmZmVyL3doYXRldmVyIGJlZm9yZSBzdGlja2luZyBp
dCBpbnRvIHRoZSBkc3QKPj4gcmVnaXN0ZXIuCj4KPiBJcyB0aGlzIHNvbWV0aGluZyBzdC9tZXNh
IG5lZWRzIG9yIGp1c3Qgbm91dmVhdT8gSWYganVzdCBub3V2ZWF1IG5lZWRzCj4gaXQsIEkgZG9u
J3Qgc2VlIGEgcG9pbnQgaW4gdXBkYXRpbmcgdGhlIFRHU0kgc3BlYywgc2luY2Ugbm91dmVhdSBj
YW4KPiBqdXN0IGFkZCB0aGUgc3dpenpsZSB3aGVuIHRyYW5zbGF0aW5nIGZyb20gVEdTSS4KClRo
aXMgaXMgc29tZXRoaW5nIHdoaWNoIHRoZSBsbHZtIHRnc2kgYmFja2VuZCBuZWVkcywgd2hpY2gg
d2UgcGxhbiB0bwp1c2UgdG8gYWRkIG9wZW5jbCBzdXBwb3J0IHRvIG5vdXZlYXUuCgogRnJvbSB0
aGUgY29tbWl0IG1zZzoKCiJUaGUgbGx2bSBUR1NJIGJhY2tlbmQgdXNlcyBwb2ludGVycyBpbiBy
ZWdpc3RlcnMgYW5kIGRvZXMgdGhpbmdzIGxpa2U6CgpMT0FEIFRFTVBbMF0ueSwgTUVNT1JZWzBd
LCBURU1QWzBdCgpFeHBlY3RpbmcgdGhlIGRhdGEgYXQgYWRkcmVzcyBURU1QWzBdLnggdG8gZ2V0
IGxvYWRlZCB0bwpURU1QWzBdLnkuIEJ1dCB0aGlzIHdpbGwgY2F1c2UgdGhlIGRhdGEgYXQgVEVN
UFswXS54ICsgNCB0byBiZQpsb2FkZWQgaW5zdGVhZC4KClRoaXMgY29tbWl0IGFkZHMgc3VwcG9y
dCBmb3IgYSBzd2l6emxlIHN1ZmZpeCBmb3IgdGhlIDFzdCBzb3VyY2UKb3BlcmFuZCwgd2hpY2gg
YWxsb3dzIHVzaW5nOgoKTE9BRCBURU1QWzBdLnksIE1FTU9SWVswXS54eHh4LCBURU1QWzBdCgpB
bmQgYWN0dWFsbHkgZ2V0dGluZyB0aGUgZGVzaXJlZCBiZWhhdmlvciIKClJlZ2FyZHMsCgpIYW5z
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCm1lc2EtZGV2
IG1haWxpbmcgbGlzdAptZXNhLWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9tZXNhLWRldgo=
