From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: [PATCH mesa v2 3/3] nouveau: codegen: LOAD: Take src
	swizzle into account
Date: Fri, 22 Apr 2016 09:08:11 +0200
Message-ID: <CAAxE2A5V82mQQxC0Gif3SC=CcUv++DDaTNy4EmVgiqCkKP5inw@mail.gmail.com>
References: <1461242362-1281-1-git-send-email-hdegoede@redhat.com>
 <1461242362-1281-3-git-send-email-hdegoede@redhat.com>
 <CAKb7UviLsGdRWyqATCHRGnOT-CWKh6hsz0TqL1RQGFyY1fbWPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UviLsGdRWyqATCHRGnOT-CWKh6hsz0TqL1RQGFyY1fbWPw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBBcHIgMjEsIDIwMTYgYXQgNzowNCBQTSwgSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1PiB3cm90ZToKPiBbK3JhZGVvbiBmb2xrXQo+Cj4gTWFyZWssIE5pY29sYWksIEJh
cyAtIHBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGUgZG9jIGNoYW5nZSBhbmQgbGV0IHVzCj4ga25v
dyBpZiB5b3UgdGhpbmsgdGhpcyB3aWxsIGNhdXNlIGEgcHJvYmxlbSBmb3IgcmFkZW9uLgo+Cj4g
SGFucyBpcyBzb2x2aW5nIHRoZSBpc3N1ZSB0aGF0IGhlIHdhbnRzIHRvIHN3aXp6bGUgdGhlIGRh
dGEgbG9hZGVkCj4gZnJvbSB0aGUgaW1hZ2UvYnVmZmVyL3doYXRldmVyIGJlZm9yZSBzdGlja2lu
ZyBpdCBpbnRvIHRoZSBkc3QKPiByZWdpc3Rlci4KCklzIHRoaXMgc29tZXRoaW5nIHN0L21lc2Eg
bmVlZHMgb3IganVzdCBub3V2ZWF1PyBJZiBqdXN0IG5vdXZlYXUgbmVlZHMKaXQsIEkgZG9uJ3Qg
c2VlIGEgcG9pbnQgaW4gdXBkYXRpbmcgdGhlIFRHU0kgc3BlYywgc2luY2Ugbm91dmVhdSBjYW4K
anVzdCBhZGQgdGhlIHN3aXp6bGUgd2hlbiB0cmFuc2xhdGluZyBmcm9tIFRHU0kuCgpNYXJlawpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwptZXNhLWRldiBt
YWlsaW5nIGxpc3QKbWVzYS1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbWVzYS1kZXYK
