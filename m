From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
Date: Fri, 22 Nov 2019 12:30:52 +0100
Message-ID: <CACO55tue979AjxXO0MsOMVzUYvVaLh3rMDVg43=kqz=-OpW3Jw@mail.gmail.com>
References: <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <20191121125236.GX11621@lahna.fi.intel.com>
 <CAJZ5v0iMwhudB7O0hR-6KfRfa+_iGOY=t0Zzeh6+9OiTzeYJfA@mail.gmail.com>
 <20191121194942.GY11621@lahna.fi.intel.com>
 <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
 <CACO55tvFeTFo3gGdL02gnWMMk+AHPPb=hntkre0ZcA6WvKcV1A@mail.gmail.com>
 <CACO55tvkQyYYnCs71_nJuNFm4f8kkvBqje8WeZGph7X+2zO3aA@mail.gmail.com>
 <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAJZ5v0jNq77xPXxeYeq_JJBCfekVPVPOye1mZwpQi=+=MKSS7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mika Westerberg <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mario Limonciello <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTA6MDcgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDE6MTMgQU0g
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IHNvIHdoaWxl
IHRyeWluZyB0byB0ZXN0IHdpdGggZDNjb2xkIGRpc2FibGVkLCBJIG5vdGljZWQgdGhhdCBJIHJ1
bgo+ID4gaW50byB0aGUgZXhhY3Qgc2FtZSBlcnJvci4KPgo+IERvZXMgdGhpcyBtZWFuIHRoYXQg
eW91IGRpc2FibGVkIGQzY29sZCBvbiB0aGUgR1BVIHZpYSBzeXNmcyAodGhlCj4gImQzY29sZF9h
bGxvd2VkIiBhdHRyaWJ1dGUgd2FzIDApIGFuZCB0aGUgb3JpZ2luYWwgcHJvYmxlbSBzdGlsbAo+
IG9jY3VycmVkIGluIHRoYXQgY29uZmlndXJhdGlvbj8KPgoKeWVzLiBJbiBteSBwcmV2aW91cyB0
ZXN0aW5nIEkgd2FzIHBva2luZyBpbnRvIHRoZSBQQ0kgcmVnaXN0ZXJzIG9mIHRoZQpicmlkZ2Ug
Y29udHJvbGxlciBhbmQgdGhlIEdQVSBkaXJlY3RseSBhbmQgdGhhdCBuZXZlciBjYXVzZWQgYW55
Cmlzc3VlcyBhcyBsb25nIGFzIEkgbGltaXRlZCBpdCB0byBwdXR0aW5nIHRoZSBkZXZpY2VzIGlu
dG8gRDNob3QuCgo+ID4gQW5kIEkgdmVyaWZpZWQgdGhhdCB0aGUKPiA+IFxfU0IuUENJMC5QRUcw
LlBHMDAuX1NUQSByZXR1cm5zIDEsIHdoaWNoIGluZGljYXRlcyBpdCBzaG91bGQgc3RpbGwgYmUK
PiA+IHR1cm5lZCBvbi4KPgo+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhpcyBjb21tZW50
LCBzbyBjYW4geW91IGV4cGxhaW4gaXQgYSBiaXQgdG8KPiBtZSwgcGxlYXNlPwo+Cgp0aGF0J3Mg
dGhlIEFDUEkgbWV0aG9kIHRvIGZldGNoIHRoZSAic3RhdHVzIiBvZiB0aGUgcG93ZXIgcmVzb3Vy
Y2UsIGl0CnNob3VsZCByZXR1cm4gMCB3aGVuIHRoZSBkZXZpY2Ugd2FzIHBvd2VyZWQgb2ZmICh0
aGUgR1BVKSBhbmQgMQpvdGhlcndpc2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
