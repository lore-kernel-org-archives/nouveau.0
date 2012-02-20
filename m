From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [PATCH 9/9] dri2: Fix corner case crash for swaplimit
	> 1
Date: Mon, 20 Feb 2012 06:17:27 +0100
Message-ID: <4F41D767.3070302@tuebingen.mpg.de>
References: <1329349524-11650-1-git-send-email-mario.kleiner@tuebingen.mpg.de>	
	<1329349524-11650-10-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1329385574.2859.409.camel@thor.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329385574.2859.409.camel-2h6evNeVVYGs1BDpvl8NfQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?UTF-8?B?TWljaGVsIETDpG56ZXI=?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMDIvMTYvMjAxMiAxMDo0NiBBTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gT24gRG9uLCAy
MDEyLTAyLTE2IGF0IDAwOjQ1ICswMTAwLCBNYXJpbyBLbGVpbmVyIHdyb3RlOgo+PiBJZiBhIHN3
YXBsaW1pdD4gIDEgaXMgc2V0IG9uIGEgc2VydmVyIHdoaWNoCj4+IHN1cHBvcnRzIHRoZSBzd2Fw
bGltaXQgYXBpIChYT3JnIDEuMTIuMCspLAo+PiB0aGUgZm9sbG93aW5nIGNhbiBoYXBwZW46Cj4+
Cj4+IDEuIENsaWVudCBjYWxscyBnbFhTd2FwQnVmZmVyc01zY09NTCgpIHdpdGggYQo+PiAgICAg
c3dhcCB0YXJnZXQ+ICAxIHZibGFuayBpbiB0aGUgZnV0dXJlLCBvciBhCj4+ICAgICBjbGllbnQg
Y2FsbHMgZ2xYU3dhcGJ1ZmZlcnMoKSB3aGlsZSB0aGUgc3dhcAo+PiAgICAgaW50ZXJ2YWwgaXMg
c2V0IHRvPiAgMSAodW51c3VhbCBidXQgcG9zc2libGUpLgo+Pgo+PiAyLiBub3V2ZWF1X2RyaTJf
ZmluaXNoX3N3YXAoKSBpcyB0aGVyZWZvcmUgY2FsbGVkCj4+ICAgICBvbmx5IGF0IHRoZSB0YXJn
ZXQgdmJsYW5rLCBpbnN0ZWFkIG9mIGltbWVkaWF0ZWx5Lgo+Pgo+PiAzLiBCZWNhdXNlIG9mIHRo
ZSBkZWZlcnJlZCBleGVjdXRpb24gb2YKPj4gICAgIG5vdXZldV9kcmkyX2ZpbmlzaF9zd2FwKCks
IHRoZSBPcGVuR0wgY2xpZW50Cj4+ICAgICBjYW4gY2FsbCB4LXNlcnZlcnMgRFJJMkdldEJ1ZmZl
cnNXaXRoRm9ybWF0KCkKPj4gICAgIGJlZm9yZSBub3V2ZWF1X2RyaTJfZmluaXNoX3N3YXAoKSBl
eGVjdXRlcyBhbmQKPj4gICAgIGl0IGRlbGV0ZXMgcGl4bWFwcyB0aGF0IHdvdWxkIGJlIG5lZWRl
ZCBieQo+PiAgICAgbm91dmVhdV9kcmkyX2ZpbmlzaF9zd2FwKCkgLS0+ICBTZWdmYXVsdCAtLT4g
IENyYXNoLgo+Cj4gUGl4bWFwcyBhcmUgcmVmZXJlbmNlIGNvdW50ZWQsIHNvIGl0IHNob3VsZCBi
ZSBwb3NzaWJsZSB0byBmaXggdGhpcyB2aWEKPiBwcm9wZXIgcmVmZXJlbmNlIGNvdW50aW5nLgo+
Cj4KClRoYW5rcyBmb3IgdGhlIHRpcC4gSSdsbCB0cnkgdGhhdC4KCi1tYXJpbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
