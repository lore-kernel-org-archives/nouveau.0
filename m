From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 09/19] drm/radeon: handle lockup in delayed work, v2
Date: Mon, 04 Aug 2014 16:40:24 +0200
Message-ID: <53DF9B58.8000403@canonical.com>
References: <20140731153245.15061.63023.stgit@patser>
 <20140731153342.15061.54264.stgit@patser> <53DBC1EC.1010001@amd.com>
 <53DBD269.80807@canonical.com> <53DF462B.2060102@amd.com>
 <53DF4A7D.3040505@canonical.com> <53DF7516.2010408@amd.com>
 <53DF8BF2.4000309@canonical.com> <53DF9AC4.3010700@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53DF9AC4.3010700@amd.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, airlied@linux.ie
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com
List-Id: nouveau.vger.kernel.org

b3AgMDQtMDgtMTQgMTY6MzcsIENocmlzdGlhbiBLw7ZuaWcgc2NocmVlZjoKPj4gSXQnYSBwYWlu
IHRvIGRlYWwgd2l0aCBncHUgcmVzZXQuCj4KPiBZZWFoLCB3ZWxsIHRoYXQncyBub3RoaW5nIG5l
dy4KPgo+PiBJJ3ZlIG5vdyB0cmllZCBvdGhlciBzb2x1dGlvbnMgYnV0IHRoYXQgd291bGQgbWVh
biByZXZlcnRpbmcgdG8gdGhlIG9sZCBzdHlsZSBkdXJpbmcgZ3B1IGxvY2t1cCByZWNvdmVyeSwg
YW5kIG9ubHkgcnVubmluZyB0aGUgZGVsYXllZCB3b3JrIHdoZW4gIWxvY2t1cC4KPj4gQnV0IHRo
aXMgbWVhbnQgdGhhdCB0aGUgdGltZW91dCB3YXMgdXNlbGVzcyB0byBhZGQuIEkgdGhpbmsgdGhl
IGNsZWFuZXN0IGlzIGtlZXBpbmcgdGhlIHYyIHBhdGNoLCBiZWNhdXNlIHBvdGVudGlhbGx5IGFu
eSB3YWl0aW5nIGNvZGUgY2FuIGJlIGNhbGxlZCBkdXJpbmcgbG9ja3VwIHJlY292ZXJ5Lgo+Cj4g
VGhlIGxvY2t1cCBjb2RlIGl0c2VsZiBzaG91bGQgbmV2ZXIgY2FsbCBhbnkgd2FpdGluZyBjb2Rl
IGFuZCBWMiBkb2Vzbid0IHNlZW0gdG8gaGFuZGxlIGEgY291cGxlIG9mIGNhc2VzIGNvcnJlY3Rs
eSBlaXRoZXIuCj4KPiBIb3cgYWJvdXQgbW92aW5nIHRoZSBmZW5jZSB3YWl0aW5nIG91dCBvZiB0
aGUgcmVzZXQgY29kZT8KV2hhdCBjYXNlcyBkaWQgSSBtaXNzIHRoZW4/CgpJJ20gY3VyaW91cyBo
b3cgeW91IHdhbnQgdG8gbW92ZSB0aGUgZmVuY2Ugd2FpdGluZyBvdXQgb2YgcmVzZXQsIHdoZW4g
dGhlcmUgYXJlIHNvIG1hbnkgcGxhY2VzIHRoYXQgY291bGQgcG90ZW50aWFsbHkgd2FpdCwgbGlr
ZSByYWRlb25faWJfZ2V0IGNhbiBjYWxsIHJhZGVvbl9zYV9ib19uZXcgd2hpY2ggY2FuIGRvIGEg
d2FpdCwgb3IgcmFkZW9uX3JpbmdfYWxsb2MgdGhhdCBjYW4gd2FpdCBvbiByYWRlb25fZmVuY2Vf
d2FpdF9uZXh0LCBldGMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
