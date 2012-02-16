From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 9/9] dri2: Fix corner case crash for swaplimit
	> 1
Date: Thu, 16 Feb 2012 10:46:14 +0100
Message-ID: <1329385574.2859.409.camel@thor.local>
References: <1329349524-11650-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1329349524-11650-10-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329349524-11650-10-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gRG9uLCAyMDEyLTAyLTE2IGF0IDAwOjQ1ICswMTAwLCBNYXJpbyBLbGVpbmVyIHdyb3RlOiAK
PiBJZiBhIHN3YXBsaW1pdCA+IDEgaXMgc2V0IG9uIGEgc2VydmVyIHdoaWNoCj4gc3VwcG9ydHMg
dGhlIHN3YXBsaW1pdCBhcGkgKFhPcmcgMS4xMi4wKyksCj4gdGhlIGZvbGxvd2luZyBjYW4gaGFw
cGVuOgo+IAo+IDEuIENsaWVudCBjYWxscyBnbFhTd2FwQnVmZmVyc01zY09NTCgpIHdpdGggYQo+
ICAgIHN3YXAgdGFyZ2V0ID4gMSB2YmxhbmsgaW4gdGhlIGZ1dHVyZSwgb3IgYQo+ICAgIGNsaWVu
dCBjYWxscyBnbFhTd2FwYnVmZmVycygpIHdoaWxlIHRoZSBzd2FwCj4gICAgaW50ZXJ2YWwgaXMg
c2V0IHRvID4gMSAodW51c3VhbCBidXQgcG9zc2libGUpLgo+IAo+IDIuIG5vdXZlYXVfZHJpMl9m
aW5pc2hfc3dhcCgpIGlzIHRoZXJlZm9yZSBjYWxsZWQKPiAgICBvbmx5IGF0IHRoZSB0YXJnZXQg
dmJsYW5rLCBpbnN0ZWFkIG9mIGltbWVkaWF0ZWx5Lgo+IAo+IDMuIEJlY2F1c2Ugb2YgdGhlIGRl
ZmVycmVkIGV4ZWN1dGlvbiBvZgo+ICAgIG5vdXZldV9kcmkyX2ZpbmlzaF9zd2FwKCksIHRoZSBP
cGVuR0wgY2xpZW50Cj4gICAgY2FuIGNhbGwgeC1zZXJ2ZXJzIERSSTJHZXRCdWZmZXJzV2l0aEZv
cm1hdCgpCj4gICAgYmVmb3JlIG5vdXZlYXVfZHJpMl9maW5pc2hfc3dhcCgpIGV4ZWN1dGVzIGFu
ZAo+ICAgIGl0IGRlbGV0ZXMgcGl4bWFwcyB0aGF0IHdvdWxkIGJlIG5lZWRlZCBieQo+ICAgIG5v
dXZlYXVfZHJpMl9maW5pc2hfc3dhcCgpIC0tPiBTZWdmYXVsdCAtLT4gQ3Jhc2guCgpQaXhtYXBz
IGFyZSByZWZlcmVuY2UgY291bnRlZCwgc28gaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGZpeCB0
aGlzIHZpYQpwcm9wZXIgcmVmZXJlbmNlIGNvdW50aW5nLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVs
IETDpG56ZXIgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgaHR0cDovL3d3dy5hbWQuY29t
CkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICB8ICAgICAgICAgIERlYmlhbiwgWCBh
bmQgRFJJIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
