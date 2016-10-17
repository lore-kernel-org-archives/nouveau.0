From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] nvc0: rename BEGIN_IMC0 to IMMED_NVC0
Date: Mon, 17 Oct 2016 11:31:39 +0200
Message-ID: <4dc8fb1b-c0e9-0503-141b-fe427abcbefe@gmail.com>
References: <1476645274-9939-1-git-send-email-imirkin@alum.mit.edu>
 <1476645274-9939-3-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1476645274-9939-3-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

UmV2aWV3ZWQtYnk6IFNhbXVlbCBQaXRvaXNldCA8c2FtdWVsLnBpdG9pc2V0QGdtYWlsLmNvbT4K
Ck9uIDEwLzE2LzIwMTYgMDk6MTQgUE0sIElsaWEgTWlya2luIHdyb3RlOgo+IEZvciBjb25zaXN0
ZW5jeSB3aXRoIG1lc2EuIEl0IHdhc24ndCB1c2VkIGFueXdoZXJlIHByZXZpb3VzbHkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4gLS0tCj4g
IHNyYy9ub3V2ZWF1X2xvY2FsLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3NyYy9ub3V2ZWF1X2xvY2FsLmgg
Yi9zcmMvbm91dmVhdV9sb2NhbC5oCj4gaW5kZXggM2RlNjlhMi4uZGQ0OTM5NSAxMDA2NDQKPiAt
LS0gYS9zcmMvbm91dmVhdV9sb2NhbC5oCj4gKysrIGIvc3JjL25vdXZlYXVfbG9jYWwuaAo+IEBA
IC0yMzcsNyArMjM3LDcgQEAgQkVHSU5fTklDMChzdHJ1Y3Qgbm91dmVhdV9wdXNoYnVmICpwdXNo
LCBpbnQgc3ViYywgaW50IG10aGQsIGludCBzaXplKQo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSB2
b2lkCj4gLUJFR0lOX0lNQzAoc3RydWN0IG5vdXZlYXVfcHVzaGJ1ZiAqcHVzaCwgaW50IHN1YmMs
IGludCBtdGhkLCBpbnQgZGF0YSkKPiArSU1NRURfTlZDMChzdHJ1Y3Qgbm91dmVhdV9wdXNoYnVm
ICpwdXNoLCBpbnQgc3ViYywgaW50IG10aGQsIGludCBkYXRhKQo+ICB7Cj4gIAlQVVNIX0RBVEEg
KHB1c2gsIDB4ODAwMDAwMDAgfCAoZGF0YSA8PCAxNikgfCAoc3ViYyA8PCAxMykgfCAobXRoZCAv
IDQpKTsKPiAgfQo+CgotLSAKLVNhbXVlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
