From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: nouveau. swiotlb: coherent allocation failed for device
 0000:01:00.0 size=2097152
Date: Tue, 19 Dec 2017 14:45:05 +0100
Message-ID: <e1b8dd62-4423-2b51-9634-e8938801b5d9@gmail.com>
References: <1513620418.7113.51.camel@gmx.de>
 <a083d576-215f-eb76-278b-741fc65fb138@mni.thm.de>
 <f447948f-cfad-f4ea-4c41-54e42a733c16@daenzer.net>
 <a96f755f-a20b-a177-ead1-7b79acbb1250@daenzer.net>
Reply-To: christian.koenig@amd.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <a96f755f-a20b-a177-ead1-7b79acbb1250@daenzer.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>, Mike Galbraith <efault@gmx.de>
Cc: nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

QW0gMTkuMTIuMjAxNyB1bSAxMTozOSBzY2hyaWViIE1pY2hlbCBEw6RuemVyOgo+IE9uIDIwMTct
MTItMTkgMTE6MzcgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+PiBPbiAyMDE3LTEyLTE4IDA4
OjAxIFBNLCBUb2JpYXMgS2xhdXNtYW5uIHdyb3RlOgo+Pj4gT24gMTIvMTgvMTcgNzowNiBQTSwg
TWlrZSBHYWxicmFpdGggd3JvdGU6Cj4+Pj4gR3JlZXRpbmdzLAo+Pj4+Cj4+Pj4gS2VybmVsIGJv
dW5kIHdvcmtsb2FkcyBzZWVtIHRvIHRyaWdnZXIgdGhlIGJlbG93IGZvciB3aGF0ZXZlciByZWFz
b24uCj4+Pj4gIMKgwqBJIG9ubHkgc2VlIHRoaXMgd2hlbiBiZWF0aW5nIHVwIE5GUy4gwqBUaGVy
ZSB3YXMgYSBrd29ya2VyIHdha2V1cAo+Pj4+IGxhdGVuY3kgaXNzdWUsIGJ1dCB3aXRoIGEgYmFu
ZGFpZCBhcHBsaWVkIHRvIGZpeCB0aGF0IHVwLCBJIGNhbiBzdGlsbAo+Pj4+IHRyaWdnZXIgdGhp
cy4KPj4+Cj4+PiBIaSwKPj4+Cj4+PiBpIGhhdmUgc2VlbiB0aGlzIG9uZSBhcyB3ZWxsIHdpdGgg
bXkgc3lzdGVtLCBidXQgaSBjb3VsZCBub3QgZmluZCBhbgo+Pj4gZWFzeSB3YXkgdG8gdHJpZ2dl
ciBpdCBmb3IgYmlzZWN0aW5nIHB1cnBvc2UuIElmIHlvdSBjYW4gdHJpZ2dlciBpdAo+Pj4gY29u
dmVuaWVudGx5LCBhIGJpc2VjdCB3b3VsZCBiZSBuaWNlIQo+PiBJJ20gc2VlaW5nIHRoaXMgKHdp
dGggdGhlIGFtZGdwdSBhbmQgcmFkZW9uIGRyaXZlcnMpIHdoZW4gcmVzdGljIHRha2VzIGEKPj4g
YmFja3VwLCBjcmVhdGluZyBtZW1vcnkgcHJlc3N1cmUuIEkgaGFwcGVuIHRvIGhhdmUganVzdCBm
aW5pc2hlZAo+PiBiaXNlY3RpbmcsIHRoZSByZXN1bHQgaXM6Cj4+Cj4+IDY0OGJjMzU3NDcxNjQw
MGFjYzA2Zjk5OTE1ODE1ZjgwZDk1NjM3ODMgaXMgdGhlIGZpcnN0IGJhZCBjb21taXQKPj4gY29t
bWl0IDY0OGJjMzU3NDcxNjQwMGFjYzA2Zjk5OTE1ODE1ZjgwZDk1NjM3ODMKPj4gQXV0aG9yOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IERhdGU6ICAgVGh1
IEp1bCA2IDA5OjU5OjQzIDIwMTcgKzAyMDAKPj4KPj4gICAgICBkcm0vdHRtOiBhZGQgdHJhbnNw
YXJlbnQgaHVnZSBwYWdlIHN1cHBvcnQgZm9yIERNQSBhbGxvY2F0aW9ucyB2Mgo+Pgo+PiAgICAg
IFRyeSB0byBhbGxvY2F0ZSBodWdlIHBhZ2VzIHdoZW4gaXQgbWFrZXMgc2Vuc2UuCj4+Cj4+ICAg
ICAgdjI6IGZpeCBjb21tZW50IGFuZCB1c2UgaWZkZWYKPj4KPj4KPiBCVFcsIEkgaGF2ZW4ndCBu
b3RpY2VkIGFueSBiYWQgZWZmZWN0cyBvdGhlciB0aGFuIHRoZSBkbWVzZyBzcGxhdHMsIHNvCj4g
bWF5YmUgaXQncyBqdXN0IG5vaXNlIGFib3V0IHRyYW5zaWVudCBmYWlsdXJlcyBmb3Igd2hpY2gg
dGhlcmUgaXMgYQo+IHByb3BlciBmYWxsYmFjayBpbiBwbGFjZS4KClllYWgsIEkgdGhpbmsgdGhh
dCBpcyBleGFjdGx5IHdoYXQgaGFwcGVucyBoZXJlLgoKV2UgdHJ5IHRvIGFsbG9jYXRlIGEgaHVn
ZSBwYWdlLCBidXQgZmFpbCBhbmQgc28gZmFsbCBiYWNrIHRvIHVzaW5nIAptdWx0aXBsZSA0ayBw
YWdlcyBpbnN0ZWFkLgoKR29pbmcgdG8gc2VuZCBvdXQgYSBwYXRjaCB0byBzdXBwcmVzcyB0aGUg
d2FybmluZy4KClRoYW5rcyBmb3IgYmlzZWN0aW5nIHRoaXMsCkNocmlzdGlhbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
