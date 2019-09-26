From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] Is Nouveau really using the io_reserve_lru?
Date: Fri, 27 Sep 2019 07:44:19 +1000
Message-ID: <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
References: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCAyNCBTZXAgMjAxOSBhdCAyMjoxOSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgZ3V5cywKPgo+IHdoaWxlIHdv
cmtpbmcgdGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVuY3Rpb25hbGl0eSBJIHN0dW1ibGVkIG92ZXIg
dGhlCj4gaW9fcmVzZXJ2ZV9scnUuCj4KPiBCYXNpYyBpZGVhIGlzIHRoYXQgd2hlbiB0aGlzIGZs
YWcgaXMgc2V0IHRoZSBkcml2ZXItPmlvX21lbV9yZXNlcnZlKCkKPiBjYWxsYmFjayBjYW4gcmV0
dXJuIC1FQUdBSU4gcmVzdWx0aW5nIGluIHVubWFwcGluZyBvZiBvdGhlciBCT3MuCj4KPiBCdXQg
Tm91dmVhdSBkb2Vzbid0IHNlZW0gdG8gcmV0dXJuIC1FQUdBSU4gaW4gdGhlIGNhbGwgcGF0aCBv
Zgo+IGlvX21lbV9yZXNlcnZlIGFueXdoZXJlLgpJIGJlbGlldmUgdGhpcyBpcyBhIGJ1ZyBpbiBO
b3V2ZWF1LiAgV2UgKnNob3VsZCogYmUgcmV0dXJuaW5nIC1FQUdBSU4KaWYgd2UgZmFpbCB0byBm
aW5kIHNwYWNlIGluIEJBUjEgdG8gbWFwIHRoZSBCTyBpbnRvLgoKQmVuLgo+Cj4gU28gaXMgdGhp
cyB1bnVzZWQgb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0
aWFuLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
Tm91dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
