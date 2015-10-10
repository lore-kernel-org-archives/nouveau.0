From: Samuel Pitoiset <samuel.pitoiset@gmail.com>
Subject: Re: [Nouveau] [PATCH] nv50,
 nvc0: don't base decisions on available pushbuf space
Date: Sat, 10 Oct 2015 22:29:56 +0200
Message-ID: <56197544.2020207@gmail.com>
References: <1444468187-13868-1-git-send-email-imirkin@alum.mit.edu>
 <561969F1.9080706@gmail.com>
 <CAKb7UvgWEKVA1TWqU-Bcu=VmunnXot_Sqp11F7XC_mOowVqTUw@mail.gmail.com>
 <56196D35.2040203@gmail.com>
 <CAKb7UvhaZn2tK9ejZ7ard79gHuxoWJRi+hLU=P6+psZSqT-sZA@mail.gmail.com>
 <56197346.4030606@gmail.com>
 <CAKb7Uvh0iBztSNw-vH1d5bamKX4YHR=rhkwX-9W5o-VedCNjYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvh0iBztSNw-vH1d5bamKX4YHR=rhkwX-9W5o-VedCNjYQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "10.0" <mesa-stable@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

CgpPbiAxMC8xMC8yMDE1IDEwOjE3IFBNLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBPbiBTYXQsIE9j
dCAxMCwgMjAxNSBhdCA0OjIxIFBNLCBTYW11ZWwgUGl0b2lzZXQKPiA8c2FtdWVsLnBpdG9pc2V0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDEwLzEwLzIwMTUgMDk6NTggUE0sIElsaWEgTWly
a2luIHdyb3RlOgo+Pj4gT24gU2F0LCBPY3QgMTAsIDIwMTUgYXQgMzo1NSBQTSwgU2FtdWVsIFBp
dG9pc2V0Cj4+PiA8c2FtdWVsLnBpdG9pc2V0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBP
biAxMC8xMC8yMDE1IDA5OjQyIFBNLCBJbGlhIE1pcmtpbiB3cm90ZToKPj4+Pj4gT24gU2F0LCBP
Y3QgMTAsIDIwMTUgYXQgMzo0MSBQTSwgU2FtdWVsIFBpdG9pc2V0Cj4+Pj4+IDxzYW11ZWwucGl0
b2lzZXRAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4+IFRoaXMgcGF0Y2ggbG9va3MgZmluZSBleGNl
cHQgdGhhdCBpdCBzaG91bGQgYmUgYSBiaXQgbW9yZSBub3JtYWxpemVkLiBJCj4+Pj4+PiBtZWFu
LCBzb21ldGltZXMgeW91IGJyZWFrIHdoZW4gUFVTSF9TUEFDRSBmYWlscywgc29tZXRpbWVzIG5v
dC4gU2FtZQo+Pj4+Pj4gZm9yCj4+Pj4+PiBQVVNIX1NQQUNFIGNhbGxzLCBzb21ldGltZXMgeW91
IGFkZCBpdCBzb21ldGltZXMgbm90Lgo+Pj4+PiBNZWguIFdlIG5lZWQgdG8gZ2V0IG91ciBlcnJv
ciBjaGVja2luZyBzaXR1YXRpb24gc3RyYWlnaHQsIGJ1dCB0aGlzCj4+Pj4+IGlzbid0IHRoZSBw
YXRjaCB0byBkbyBpdCBpbi4KPj4+Pgo+Pj4+IFllYWgsIGJ1dCB0aGlzIG5lZWRzIHRvIGJlIGNs
YXJpZmllZC4KPj4+IFdoYXQgZG9lcz8KPj4KPj4gSSBtZWFuLCB3ZSBzaG91bGQgZWl0aGVyIHVz
ZSBQVVNIX1NQQUNFIGV2ZXJ5d2hlcmUgb3Igbm90IGF0IGFsbCwgYW5kIGFsd2F5cwo+PiBicmVh
a3MgKG9yIG5vdCkgd2hlbiBQVVNIX1NQQUNFIGZhaWxzLgo+PiBUaGF0J3MgcmVhbGx5IGEgbWlu
b3IgaXNzdWUuCj4gSXQncyBhY3R1YWxseSBhIG1ham9yIGlzc3VlLiBFcnJvci1oYW5kbGluZyBp
cyBwcmFjdGljYWxseQo+IG5vbi1leGlzdGVudC4gVGhlcmUgYXJlIGEgY291cGxlIG9mIHNwb3Rz
IGhlcmUgYW5kIHRoZXJlLCBidXQgaXQKPiBkb2Vzbid0IHJlYWxseSBzY2FsZSB1cC4gSSBndWVz
cyBJIChzZW1pLSlhY2NpZGVudGFsbHkgcmVtb3ZlZCBhCj4gY291cGxlIG9mIHNwb3RzIHRoYXQg
ZXJyb3IgY2hlY2tlZCwgYnV0LCBhZ2FpbiwgbWVoLiBEb2luZyB0aGlzIGZvcgo+IHJlYWwgd2ls
bCByZXF1aXJlIHNvbWUgY2FyZWZ1bCB0aG91Z2h0LgoKWWVhaCwgb2theS4gU28gd2UgcmVhbGx5
IG5lZWQgdG8gaW1wcm92ZSBlcnJvci1oYW5kbGluZy4gOikKCj4gICAgLWlsaWEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCm1lc2EtZGV2IG1haWxpbmcg
bGlzdAptZXNhLWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==
