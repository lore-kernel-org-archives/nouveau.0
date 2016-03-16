From: Samuel Pitoiset <samuel.pitoiset@gmail.com>
Subject: Re: [PATCH mesa 3/6] nouveau: codegen: gk110: Make
 emitSTORE offset handling identical to emitLOAD
Date: Wed, 16 Mar 2016 11:28:16 +0100
Message-ID: <56E93540.500@gmail.com>
References: <1458120239-27659-1-git-send-email-hdegoede@redhat.com>
 <1458120239-27659-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1458120239-27659-3-git-send-email-hdegoede@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Hans de Goede <hdegoede@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

UmV2aWV3ZWQtYnk6IFNhbXVlbCBQaXRvaXNldCA8c2FtdWVsLnBpdG9pc2V0QGdtYWlsLmNvbT4K
Ck9uIDAzLzE2LzIwMTYgMTA6MjMgQU0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gTWFrZSB0aGUg
c3RvcmUgb2Zmc2V0IGhhbmRsaW5nIGluIENvZGVFbWl0dGVyR0sxMTA6OmVtaXRTVE9SRSBpZGVu
dGljYWwKPiB0byB0aGUgb25lIGluIENvZGVFbWl0dGVyR0sxMTA6OmVtaXRMT0FEIGhhbmRsaW5n
Lgo+Cj4gVGhpcyBpcyBqdXN0IGEgY2xlYW51cCwgaXQgZG9lcyBub3QgY2F1c2UgYW55IGZ1bmN0
aW9uYWwgY2hhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+Cj4gLS0tCj4gICBzcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdl
bi9udjUwX2lyX2VtaXRfZ2sxMTAuY3BwIHwgNCArLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0v
ZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9lbWl0X2drMTEwLmNwcCBiL3NyYy9nYWxs
aXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZW1pdF9nazExMC5jcHAKPiBpbmRl
eCAwZDdkOTVlLi43MGYzYzNmIDEwMDY0NAo+IC0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91
dmVhdS9jb2RlZ2VuL252NTBfaXJfZW1pdF9nazExMC5jcHAKPiArKysgYi9zcmMvZ2FsbGl1bS9k
cml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2VtaXRfZ2sxMTAuY3BwCj4gQEAgLTE2NTUs
MTAgKzE2NTUsOCBAQCBDb2RlRW1pdHRlckdLMTEwOjplbWl0U1RPUkUoY29uc3QgSW5zdHJ1Y3Rp
b24gKmkpCj4gICAgICAgICBicmVhazsKPiAgICAgIH0KPgo+IC0gICBpZiAoaS0+c3JjKDApLmdl
dEZpbGUoKSAhPSBGSUxFX01FTU9SWV9HTE9CQUwpCj4gLSAgICAgIG9mZnNldCAmPSAweGZmZmZm
ZjsKPiAtCj4gICAgICBpZiAoY29kZVswXSAmIDB4Mikgewo+ICsgICAgICBvZmZzZXQgJj0gMHhm
ZmZmZmY7Cj4gICAgICAgICBlbWl0TG9hZFN0b3JlVHlwZShpLT5kVHlwZSwgMHgzMyk7Cj4gICAg
ICAgICBpZiAoaS0+c3JjKDApLmdldEZpbGUoKSA9PSBGSUxFX01FTU9SWV9MT0NBTCkKPiAgICAg
ICAgICAgIGVtaXRDYWNoaW5nTW9kZShpLT5jYWNoZSwgMHgyZik7Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYgbWFpbGluZyBsaXN0Cm1l
c2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==
