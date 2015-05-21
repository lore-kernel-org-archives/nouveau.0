From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fix a wrong use of a logical operator in
	drmmode_output_dpms()
Date: Thu, 21 May 2015 14:40:41 +1000
Message-ID: <CAPM=9tyH-Xo09iAQ=0F-Vk8YtEDQkaaeLdDnmOwpDkEdC2t=sw@mail.gmail.com>
References: <1432134538-13701-1-git-send-email-samuel.pitoiset@inria.fr>
 <555CC056.4020006@mni.thm.de>
 <CAKb7Uvhy-o3-iAZD+EJLhhHVDGc_Zvm=-exna8waTa9QV_CVvA@mail.gmail.com>
 <555CC3C1.3010102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <555CC3C1.3010102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMjEgTWF5IDIwMTUgYXQgMDM6MjYsIFNhbXVlbCBQaXRvaXNldCA8c2FtdWVsLnBpdG9pc2V0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDA1LzIwLzIwMTUgMDc6MTMgUE0sIElsaWEgTWly
a2luIHdyb3RlOgo+Pgo+PiBUaGlzIGlzIG9idmlvdXNseSBhIGJ1ZywgYnV0IG9uZSB0aGF0IGhh
cyBiZWVuIHRoZXJlIGZvciBzb21lIHRpbWUuCj4+IFBsZWFzZSBmaWd1cmUgb3V0IHdoYXQgdGhp
cyBpcyBndWFyZGluZywgYW5kIGNvbmZpcm0gdGhhdCB0aGUgZmVhdHVyZQo+PiBjb250aW51ZXMg
dG8gd29yay4KPgo+Cj4gU3VyZSwgYnV0IGRvIHlvdSBoYXZlIGFueSBpZGVhcyBob3cgdG8gdGVz
dCB0aGlzIHBhcnQgb2YgdGhlIEREWCA/Cj4gSXQncyB0aGUgZmlyc3QgdGltZSBJIHBsYXkgd2l0
aCBpdC4uLgo+CgpJdCdzIGZpbmUsIHRoZSBjb2RlIGp1c3QgYXZvaWRzIGdvaW5nIGludG8gdGhl
IG5hbWUgY2hlY2tzIGlmIHRoZSB0eXBlCmlzbid0IGEgZW51bSwKaXQgd29uJ3QgYnJlYWsgYW55
dGhpbmcgYWN0dWFsbHkgZml4aW5nIGl0LgoKVGhlIGZpeCBpcwoKUmV2aWV3ZWQtYnk6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
