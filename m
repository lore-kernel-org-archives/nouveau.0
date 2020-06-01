From: dinghao.liu@zju.edu.cn
Subject: Re: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new
Date: Mon, 1 Jun 2020 13:21:27 +0800 (GMT+08:00)
Message-ID: <b3db4d2.ddd1e.1726e53d54b.Coremail.dinghao.liu@zju.edu.cn>
References: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
 <CACAvsv73wZK_pKk4TDHaTeBUqxYHvK0KhLQBgPC8Be_VviY2jg@mail.gmail.com>
 <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu@zju.edu.cn>
 <CACAvsv5kcUC_kOfMPxqY-irSAexmhm=WKO8Vk=wTZWdsbaartw@mail.gmail.com>
 <CACAvsv5t2gWDae_8b0-fH9e8fzgmxfiUtZTPeFuhmKXDFAmvGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACAvsv5t2gWDae_8b0-fH9e8fzgmxfiUtZTPeFuhmKXDFAmvGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: kjlu@umn.edu, David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Markus.Elfring@web.de
List-Id: nouveau.vger.kernel.org

PiA+IElmIHRoZXJlJ3MgKmFueSogZXJyb3IsIGl0J2xsIGNoZWNrIHRoZSBwb2ludGVyLCBpZiBp
dCdzIG5vbi1OVUxMLAo+ID4gaXQnbGwgY2FsbCB0aGUgZGVzdHJ1Y3Rvci4gIElmIGt6YWxsb2Mo
KSBmYWlscywgdGhlIHBvaW50ZXIgd2lsbCBiZQo+ID4gTlVMTCwgdGhlcmUncyBubyBkb3VibGUt
ZnJlZSBidWcuICAqZXZlcnkqIHN1YmRldiBpcyB3cml0dGVuIHRoaXMgd2F5Cj4gPiB0byBhdm9p
ZCBkdXBsaWNhdGluZyBjbGVhbnVwIGxvZ2ljLgo+IEFjdHVhbGx5LCBnbTIwYl9jbGtfbmV3X3Nw
ZWVkbzAoKSBtYXkgaGF2ZSBhIGJ1ZyBoZXJlIGlmIGt6YWxsb2MoKQo+IGZhaWxzIGFzIGl0IGRv
ZXNuJ3Qgb3ZlcndyaXRlIHRoZSBwcmV2aW91cyBwb2ludGVyIGZyb20KPiBnbTIwYl9jbGtfbmV3
KCkuICBUaGF0IHdob2xlIGN0b3IoKSBzZXF1ZW5jZSBpcyB3cml0dGVuIGEgbGl0dGxlCj4gc3Ry
YW5nZWx5Lgo+IAoKSXQncyBjbGVhciB0byBtZSwgdGhhbmsgeW91ciBmb3IgeW91ciBleHBsYW5h
dGlvbiEgQXMgZm9yIApnbTIwYl9jbGtfbmV3X3NwZWVkbzAoKSwgSSB0aGluayBpdHMgYnVnIHBh
dHRlcm4gaXMgbm90IHZlcnkgCmNsZWFyLiBNYXliZSB3ZSBzaG91bGQga2VlcCBpdCB1bnRpbCB3
ZSBmaW5kIGFuIHVzZSBjaGFpbiB0aGF0CmNvdWxkIGxlYWQgdG8gYSBidWcuCgpSZWdhcmRzLApE
aW5naGFvCg==
