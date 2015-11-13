From: Hans de Goede <hdegoede@redhat.com>
Subject: llvm TGSI backend (WIP) questions
Date: Fri, 13 Nov 2015 14:46:52 +0100
Message-ID: <5645E9CC.1040401@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Francisco Jerez <currojerez@riseup.net>, Samuel Pitoiset <samuel.pitoiset@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

SGkgQWxsLAoKU28gYXMgZGlzY3Vzc2VkIEkndmUgc3RhcnRlZCB3b3JraW5nIG9uIGEgVEdTSSBi
YWNrZW5kIGZvcgpsbHZtIHRvIHVzZSBhcyBhIHdheSB0byBnZXQgY29tcHV0ZSBnb2luZyBvbiBu
b3V2ZWF1IChhbmQgb3RoZXIgZ3B1LXMpLgoKSSdtIHN0aWxsIGxlYXJuaW5nIGFsbCB0aGUgaW5z
IGFuZCBvdXRzIG9mIGxsdm0gc28gSSBkbyBub3QgaGF2ZQptdWNoIHRvIHNob3cgeWV0LgoKSSd2
ZSByZWJhc2VkIEZyYW5jaXNjbydzIChjdXJybydzKSBsYXRlc3QgdmVyc2lvbiBvbiB0b3Agb2Yg
bGx2bQp0cnVuaywgYW5kIGFkZGVkIGEgY29tbWl0IG9uIHRvcCB0byBhY3R1YWwgZ2V0IGl0IGJ1
aWxkIHdpdGggdGhlCmxhdGVzdCB0cnVuay4gU28gY3VycmVudGx5IEknbSBhdCB0aGUgcG9pbnQg
d2hlcmUgSSd2ZSBqdXN0CnRha2VuIEZyYW5jaXNjbydzIGNvZGUsIGFuZCBtYWRlIGl0IGNvbXBp
bGUsIG5vIG1vcmUgYW5kIG5vIGxlc3MuCgpJIGhhdmUgYSBnaXQgcmVwbyB3aXRoIHRoaXMgd29y
ayBhdmFpbGFibGUgaGVyZToKCmh0dHA6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+andyZGVnb2Vk
ZS9sbHZtLwoKU28gdGhlIG5leHQgc3RlcCB3b3VsZCBiZSB0byB0ZXN0IHRoaXMgYW5kIHNlZSBp
ZiBpdCBhY3R1YWxseQpkb2VzIGFueXRoaW5nLCBxdWVzdGlvbnM6CgoxKSBEb2VzIGFueW9uZSBo
YXZlIGEgc2ltcGxlIHRlc3QgY2FzZSAvIGNvbW1hbmQgd2hlcmUgSSBjYW4KaW52b2tlIGp1c3Qg
bGx2bSBhbmQgZ2V0IFRHU0kgYXNtIG91dHB1dCB0byBjaGVjayA/CgoyKSBBc3N1bWluZyBJIGdl
dCB0aGUgYWJvdmUgdG8gKHNvbWV3aGF0KSB3b3JrLCBpcyB0aGVyZSBhCndheSB0byBtYWtlIGxs
dm0gc2hvdyB0aGUgb3V0cHV0IG9mIHRoZSB2YXJpb3VzIGludGVybWVkaWF0ZQpwYXNzZXMgaW4g
YSBodW1hbiByZWFkYWJsZSBmb3JtID8KClJlZ2FyZHMsCgpIYW5zCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCm1lc2EtZGV2IG1haWxpbmcgbGlzdAptZXNh
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==
