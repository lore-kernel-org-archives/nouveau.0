From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Date: Tue, 25 Jun 2019 11:44:28 +0000
Message-ID: <20190625114422.GA3118@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190620192648.GI12083@dhcp22.suse.cz>
 <20190625072915.GD30350@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190625072915.GD30350-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Content-ID: <9099450B868E3548B355AC3B0AFD1F5E-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDk6Mjk6MTVBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDk6MjY6NDhQTSArMDIwMCwgTWlj
aGFsIEhvY2tvIHdyb3RlOgo+ID4gT24gVGh1IDEzLTA2LTE5IDExOjQzOjIxLCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiA+ID4gVGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3
YXMgYWRkZWQgdG8gdGhlIHRyZWUsIGFuZCBkb2Vzbid0Cj4gPiA+IGFwcGVhciB0byBhY3R1YWxs
eSBiZSB1c2FibGUuICBNYXJrIGl0IGFzIEJST0tFTiB1bnRpbCBlaXRoZXIgYSB1c2VyCj4gPiA+
IGNvbWVzIGFsb25nIG9yIHdlIGZpbmFsbHkgZ2l2ZSB1cCBvbiBpdC4KPiA+IAo+ID4gSSB3b3Vs
ZCBnbyBldmVuIGZ1cnRoZXIgYW5kIHNpbXBseSByZW1vdmUgYWxsIHRoZSBERVZJQ0VfUFVCTElD
IGNvZGUuCj4gCj4gSSBsb29rZWQgaW50byB0aGF0IGFzIEkgbm93IGdvdCB0aGUgZmVlZGJhY2sg
dHdpY2UuICBJdCB3b3VsZAo+IGNyZWF0ZSBhIGNvbmZsaWN0IHdpdGggYW5vdGhlciB0cmVlIGNs
ZWFuaW5nIHRoaW5ncyB1cCBhcm91bmQgdGhlCj4gaXNfZGV2aWNlX3ByaXZhdGUgZGVmaW50aW9u
LCBidXQgb3RoZXJ3aXNlIEknZCBiZSBnbGFkIHRvIGp1c3QgcmVtb3ZlCj4gaXQuCj4gCj4gSmFz
b24sIGFzIHRoaXMgZ29lcyB0aHJvdWdoIHlvdXIgdHJlZSwgZG8geW91IG1pbmQgdGhlIGFkZGl0
aW9uYWwKPiBjb25mbGljdD8KCldoaWNoIHRyZWUgYW5kIHdoYXQgZG9lcyB0aGUgcmVzb2x1dGlv
biBsb29rIGxpa2U/CgpBbHNvLCBJIGRvbid0IHdhbnQgdG8gYmUgbWFraW5nIHRoZSBkZWNpc2lv
biBpZiB3ZSBzaG91bGQga2VlcC9yZW1vdmUKREVWSUNFX1BVQkxJQywgc28gbGV0J3MgZ2V0IGFu
IEFjayBmcm9tIEFuZHJldy9ldGM/CgpNeSBtYWluIHJlbHVjdGFuY2UgaXMgdGhhdCBJIGtub3cg
dGhlcmUgaXMgSFcgb3V0IHRoZXJlIHRoYXQgY2FuIGRvCmNvaGVyZW50LCBhbmQgSSB3YW50IHRv
IGJlbGlldmUgdGhleSBhcmUgY29taW5nIHdpdGggcGF0Y2hlcywganVzdAp0b28gc2xvd2x5LiBC
dXQgSSdkIGFsc28gcmF0aGVyIHRob3NlIHBlb3BsZSBkZWZlbmQgdGhlbXNlbHZlcyA6UAoKVGhh
bmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
