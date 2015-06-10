From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fix a wrong use of a logical operator in
	drmmode_output_dpms()
Date: Wed, 10 Jun 2015 23:47:46 +0200
Message-ID: <5578B082.3050608@gmail.com>
References: <1432134538-13701-1-git-send-email-samuel.pitoiset@inria.fr>	<555CC056.4020006@mni.thm.de>	<CAKb7Uvhy-o3-iAZD+EJLhhHVDGc_Zvm=-exna8waTa9QV_CVvA@mail.gmail.com>	<555CC3C1.3010102@gmail.com>
 <CAPM=9tyH-Xo09iAQ=0F-Vk8YtEDQkaaeLdDnmOwpDkEdC2t=sw@mail.gmail.com>
 <5565A939.7060800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5565A939.7060800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

UHVzaGVkLgoKT24gMDUvMjcvMjAxNSAwMToyMyBQTSwgU2FtdWVsIFBpdG9pc2V0IHdyb3RlOgo+
Cj4KPiBPbiAwNS8yMS8yMDE1IDA2OjQwIEFNLCBEYXZlIEFpcmxpZSB3cm90ZToKPj4gT24gMjEg
TWF5IDIwMTUgYXQgMDM6MjYsIFNhbXVlbCBQaXRvaXNldCA8c2FtdWVsLnBpdG9pc2V0QGdtYWls
LmNvbT4gCj4+IHdyb3RlOgo+Pj4KPj4+IE9uIDA1LzIwLzIwMTUgMDc6MTMgUE0sIElsaWEgTWly
a2luIHdyb3RlOgo+Pj4+IFRoaXMgaXMgb2J2aW91c2x5IGEgYnVnLCBidXQgb25lIHRoYXQgaGFz
IGJlZW4gdGhlcmUgZm9yIHNvbWUgdGltZS4KPj4+PiBQbGVhc2UgZmlndXJlIG91dCB3aGF0IHRo
aXMgaXMgZ3VhcmRpbmcsIGFuZCBjb25maXJtIHRoYXQgdGhlIGZlYXR1cmUKPj4+PiBjb250aW51
ZXMgdG8gd29yay4KPj4+Cj4+PiBTdXJlLCBidXQgZG8geW91IGhhdmUgYW55IGlkZWFzIGhvdyB0
byB0ZXN0IHRoaXMgcGFydCBvZiB0aGUgRERYID8KPj4+IEl0J3MgdGhlIGZpcnN0IHRpbWUgSSBw
bGF5IHdpdGggaXQuLi4KPj4+Cj4+IEl0J3MgZmluZSwgdGhlIGNvZGUganVzdCBhdm9pZHMgZ29p
bmcgaW50byB0aGUgbmFtZSBjaGVja3MgaWYgdGhlIHR5cGUKPj4gaXNuJ3QgYSBlbnVtLAo+PiBp
dCB3b24ndCBicmVhayBhbnl0aGluZyBhY3R1YWxseSBmaXhpbmcgaXQuCj4+Cj4+IFRoZSBmaXgg
aXMKPj4KPj4gUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4K
PiBPa2F5LCB0aGFua3MgRGF2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
