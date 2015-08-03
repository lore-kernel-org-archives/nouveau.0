From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "enable dri3 support without glamor" causes
 gnome-shell regression on nv4x
Date: Mon, 3 Aug 2015 17:24:52 +0200
Message-ID: <55BF87C4.50505@gmail.com>
References: <55BA23AF.1040308@redhat.com>
 <CAKb7Uvh97tFMq5c=sW4GD7pciFNiriM8TwgZ3KKu5vYiyhfzpQ@mail.gmail.com>
 <55BF665A.4020600@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <55BF665A.4020600-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMDMuMDguMjAxNSAxNTowMiwgSGFucyBkZSBHb2VkZSB3cm90ZToKPiBIaSwKPiAKPiBPbiAz
MC0wNy0xNSAxNjowOSwgSWxpYSBNaXJraW4gd3JvdGU6Cj4+IEZXSVcgdGhpcyBpcyBhIGZhaWwg
b24gbnY1MCsgYXMgd2VsbC4gU2VlIGZvciBleGFtcGxlCj4+IGh0dHBzOi8vYnVncy5mcmVlZGVz
a3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTkxNDQ1Cj4+Cj4+IE15IHN1c3BpY2lvbiBpcyB0aGF0
IHRoaXMgaXMgZHVlIHRvIHRoZSBsYWNrIG9mIFBVU0hfS0lDSyBpbiB0aGUgKkRvbmUKPj4gZXhh
IGhhbmRsZXJzIC0tIHdvcmtzIGZpbmUgd2l0aCBEUkkyLCBidXQgRFJJMyBoYXMgbm8gc3luY2hy
b25pemF0aW9uCj4+IGFuZCBzbyB0aGUgY29tbWFuZHMgbmV2ZXIgZ2V0IGZsdXNoZWQgb3V0LiBF
YXNpbHkgdmVyaWZpZWQgYnkgc3RpY2tpbmcKPj4gUFVTSF9LSUNLJ3MgZXZlcnl3aGVyZS4KPiAK
PiBJIGRvIG5vdCBiZWxpZXZlIHRoYXQgdGhhdCBpcyB0aGUgcHJvYmxlbSwgaW4gbXkgY2FzZSBp
dCBjbGVhcmx5Cj4gc2VlbXMgdG8gYmUgYSBwaXRjaCAvIHN3aXp6bGUgcHJvYmxlbSByYXRoZXIg
dGhlbiBhIHN5bmNocm9uaXphcmlvbgo+IHByb2JsZW0sIGhlcmUgaXMgd2hhdCBteSBkZXNrdG9w
IHdpdGggZ25vbWUgc2hlbGwgbG9va3MgbGlrZSB3aGVuCj4gdXNpbmcgRFJJMjoKPiAKPiBodHRw
czovL2ZlZG9yYXBlb3BsZS5vcmcvfmp3cmRlZ29lZGUvbnY0Ni1nbm9tZS1zaGVsbC1nb29kLmpw
Zwo+IAo+IEFuZCB0aGlzIGlzIHdoYXQgaXQgbG9va3MgbGlrZSB3aGVuIHVzaW5nIERSSTM6Cj4g
Cj4gaHR0cHM6Ly9mZWRvcmFwZW9wbGUub3JnL35qd3JkZWdvZWRlL252NDYtZ25vbWUtc2hlbGwt
YmFkLmpwZwo+IAoKWW91IGNhbiB0ZWxsLCBqdXN0IGJ5IGxvb2tpbmcgYXQgZ2FyYmxlZCBwYXR0
ZXJuLCB3aGF0IGlzIHRoZSBhY3R1YWxseSBwcm9ibGVtIT8KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
