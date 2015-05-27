From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fix a wrong use of a logical operator in
	drmmode_output_dpms()
Date: Wed, 27 May 2015 13:23:37 +0200
Message-ID: <5565A939.7060800@gmail.com>
References: <1432134538-13701-1-git-send-email-samuel.pitoiset@inria.fr>	<555CC056.4020006@mni.thm.de>	<CAKb7Uvhy-o3-iAZD+EJLhhHVDGc_Zvm=-exna8waTa9QV_CVvA@mail.gmail.com>	<555CC3C1.3010102@gmail.com>
 <CAPM=9tyH-Xo09iAQ=0F-Vk8YtEDQkaaeLdDnmOwpDkEdC2t=sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tyH-Xo09iAQ=0F-Vk8YtEDQkaaeLdDnmOwpDkEdC2t=sw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

CgpPbiAwNS8yMS8yMDE1IDA2OjQwIEFNLCBEYXZlIEFpcmxpZSB3cm90ZToKPiBPbiAyMSBNYXkg
MjAxNSBhdCAwMzoyNiwgU2FtdWVsIFBpdG9pc2V0IDxzYW11ZWwucGl0b2lzZXRAZ21haWwuY29t
PiB3cm90ZToKPj4KPj4gT24gMDUvMjAvMjAxNSAwNzoxMyBQTSwgSWxpYSBNaXJraW4gd3JvdGU6
Cj4+PiBUaGlzIGlzIG9idmlvdXNseSBhIGJ1ZywgYnV0IG9uZSB0aGF0IGhhcyBiZWVuIHRoZXJl
IGZvciBzb21lIHRpbWUuCj4+PiBQbGVhc2UgZmlndXJlIG91dCB3aGF0IHRoaXMgaXMgZ3VhcmRp
bmcsIGFuZCBjb25maXJtIHRoYXQgdGhlIGZlYXR1cmUKPj4+IGNvbnRpbnVlcyB0byB3b3JrLgo+
Pgo+PiBTdXJlLCBidXQgZG8geW91IGhhdmUgYW55IGlkZWFzIGhvdyB0byB0ZXN0IHRoaXMgcGFy
dCBvZiB0aGUgRERYID8KPj4gSXQncyB0aGUgZmlyc3QgdGltZSBJIHBsYXkgd2l0aCBpdC4uLgo+
Pgo+IEl0J3MgZmluZSwgdGhlIGNvZGUganVzdCBhdm9pZHMgZ29pbmcgaW50byB0aGUgbmFtZSBj
aGVja3MgaWYgdGhlIHR5cGUKPiBpc24ndCBhIGVudW0sCj4gaXQgd29uJ3QgYnJlYWsgYW55dGhp
bmcgYWN0dWFsbHkgZml4aW5nIGl0Lgo+Cj4gVGhlIGZpeCBpcwo+Cj4gUmV2aWV3ZWQtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpPa2F5LCB0aGFua3MgRGF2ZS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
