From: Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fix for vblank on nvc0
Date: Mon, 12 Nov 2012 15:30:21 -0600
Message-ID: <CAES2CiYwSChUaDp1Z=5W0t34D54D7HfqH2cqvWXuWxUW69szTw@mail.gmail.com>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
	<50995728.8080305@canonical.com> <20121111182617.GA15689@joi.lan>
	<20121111183519.GA2959@joi.lan> <50A009B8.2080107@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8f3bafe33c079404ce5302b6
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50A009B8.2080107-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--e89a8f3bafe33c079404ce5302b6
Content-Type: text/plain; charset=ISO-8859-1

I had Sven test this patch... he said it works.  I think chipset
number test was executing code that we thought was only either 0x50 or
0xc0, but was actually more specific with things like 0x92.

On Sun, Nov 11, 2012 at 2:25 PM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> Op 11-11-12 19:35, Marcin Slusarz schreef:
>> On Sun, Nov 11, 2012 at 07:26:17PM +0100, Marcin Slusarz wrote:
>>> On Tue, Nov 06, 2012 at 07:30:00PM +0100, Maarten Lankhorst wrote:
>>>>
>>>> Op 06-11-12 15:48, Kelly Doran schreef:
>>>>> The vblank on nvc0 was not working correctly and would freeze X, I managed
>>>>> to track it down and fix it with some help from m.b.lankhorst, see
>>>>> https://bugs.freedesktop.org/show_bug.cgi?id=56692 for details.
>>>>>
>>>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>>>>
>>>> I recommended the bar flush since nvd0 does as well, and there might be a small race
>>>> otherwise.
>>>>
>>>> Can this still get in before final 3.7 release?
>>> This patch breaks vblank here (nv92) completely.
> Does removing the bar flush help?
>
> ~Maarte

--e89a8f3bafe33c079404ce5302b6
Content-Type: application/octet-stream; name="vblank-fix1.patch"
Content-Disposition: attachment; filename="vblank-fix1.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h9g3vm3n0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2NvcmUvZW5naW5lL2Rpc3AvbnY1
MC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvY29yZS9lbmdpbmUvZGlzcC9udjUwLmMKaW5k
ZXggMDVhOTA5YS4uMTViMTgyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
Y29yZS9lbmdpbmUvZGlzcC9udjUwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvY29y
ZS9lbmdpbmUvZGlzcC9udjUwLmMKQEAgLTQ5LDEzICs0OSw3IEBAIG52NTBfZGlzcF9pbnRyX3Zi
bGFuayhzdHJ1Y3QgbnY1MF9kaXNwX3ByaXYgKnByaXYsIGludCBjcnRjKQogCQlpZiAoY2hhbi0+
dmJsYW5rLmNydGMgIT0gY3J0YykKIAkJCWNvbnRpbnVlOwogCi0JCWlmIChudl9kZXZpY2UocHJp
diktPmNoaXBzZXQgPT0gMHg1MCkgewotCQkJbnZfd3IzMihwcml2LCAweDAwMTcwNCwgY2hhbi0+
dmJsYW5rLmNoYW5uZWwpOwotCQkJbnZfd3IzMihwcml2LCAweDAwMTcxMCwgMHg4MDAwMDAwMCB8
IGNoYW4tPnZibGFuay5jdHhkbWEpOwotCQkJYmFyLT5mbHVzaChiYXIpOwotCQkJbnZfd3IzMihw
cml2LCAweDAwMTU3MCwgY2hhbi0+dmJsYW5rLm9mZnNldCk7Ci0JCQludl93cjMyKHByaXYsIDB4
MDAxNTc0LCBjaGFuLT52YmxhbmsudmFsdWUpOwotCQl9IGVsc2UgeworCQlpZiAobnZfZGV2aWNl
KHByaXYpLT5jaGlwc2V0ID49IDB4YzApIHsKIAkJCW52X3dyMzIocHJpdiwgMHgwMDE3MTgsIDB4
ODAwMDAwMDAgfCBjaGFuLT52YmxhbmsuY2hhbm5lbCk7CiAJCQliYXItPmZsdXNoKGJhcik7CiAJ
CQludl93cjMyKHByaXYsIDB4MDYwMDBjLApAQCAtNjMsNiArNTcsMTcgQEAgbnY1MF9kaXNwX2lu
dHJfdmJsYW5rKHN0cnVjdCBudjUwX2Rpc3BfcHJpdiAqcHJpdiwgaW50IGNydGMpCiAJCQludl93
cjMyKHByaXYsIDB4MDYwMDEwLAogCQkJCWxvd2VyXzMyX2JpdHMoY2hhbi0+dmJsYW5rLm9mZnNl
dCkpOwogCQkJbnZfd3IzMihwcml2LCAweDA2MDAxNCwgY2hhbi0+dmJsYW5rLnZhbHVlKTsKKwkJ
fSBlbHNlIHsKKwkJCW52X3dyMzIocHJpdiwgMHgwMDE3MDQsIGNoYW4tPnZibGFuay5jaGFubmVs
KTsKKwkJCW52X3dyMzIocHJpdiwgMHgwMDE3MTAsIDB4ODAwMDAwMDAgfCBjaGFuLT52Ymxhbmsu
Y3R4ZG1hKTsKKwkJCWJhci0+Zmx1c2goYmFyKTsKKwkJCWlmIChudl9kZXZpY2UocHJpdiktPmNo
aXBzZXQgPT0gMHg1MCkgeworCQkJCW52X3dyMzIocHJpdiwgMHgwMDE1NzAsIGNoYW4tPnZibGFu
ay5vZmZzZXQpOworCQkJCW52X3dyMzIocHJpdiwgMHgwMDE1NzQsIGNoYW4tPnZibGFuay52YWx1
ZSk7CisJCQl9IGVsc2UgeworCQkJCW52X3dyMzIocHJpdiwgMHgwNjAwMTAsIGNoYW4tPnZibGFu
ay5vZmZzZXQpOworCQkJCW52X3dyMzIocHJpdiwgMHgwNjAwMTQsIGNoYW4tPnZibGFuay52YWx1
ZSk7CisJCQl9CiAJCX0KIAogCQlsaXN0X2RlbCgmY2hhbi0+dmJsYW5rLmhlYWQpOwo=
--e89a8f3bafe33c079404ce5302b6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--e89a8f3bafe33c079404ce5302b6--
