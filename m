From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Date: Fri, 14 Jun 2019 08:43:13 +0200
Message-ID: <20190614064313.GM7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190614004314.GD783-J5EW/p2F9lUlb2qzJQmr9q2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6NDM6MTVQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+IDxzaWdoPiAgeWVzIGJ1dCB0aGUgZWFybGllciBwYXRjaDoKPiAKPiBbUEFUQ0ggMDMvMjJd
IG1tOiByZW1vdmUgaG1tX2Rldm1lbV9hZGRfcmVzb3VyY2UKPiAKPiBSZW1vdmVzIHRoZSBvbmx5
IHBsYWNlIHR5cGUgaXMgc2V0IHRvIE1FTU9SWV9ERVZJQ0VfUFVCTElDLgo+IAo+IFNvIEkgdGhp
bmsgaXQgaXMgb2suICBGcmFua2x5IEkgd2FzIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgcmVtb3Zl
IHRoZSBwdWJsaWMKPiB0eXBlIGFsdG9nZXRoZXIgYnV0IGNvbmNlcHR1YWxseSBpdCBzZWVtcyBv
ay4gIEJ1dCBJIGRvbid0IHNlZSBhbnkgdXNlcnMgb2YgaXQKPiBzby4uLiAgc2hvdWxkIHdlIGdl
dCByaWQgb2YgaXQgaW4gdGhlIGNvZGUgcmF0aGVyIHRoYW4gdHVybmluZyB0aGUgY29uZmlnIG9m
Zj8KClRoYXQgd2FzIG15IG9yaWdpbmFsIGlkZWEuICBCdXQgdGhlbiBhZ2FpbiBKZXJvbWUgc3Bl
bnQgYSBsb3Qgb2YgZWZmb3J0CnB1dHRpbmcgaG9va3MgZm9yIGl0IGFsbCBvdmVyIHRoZSBtbSBh
bmQgaXQgd291bGQgc2VlbSBhIGxpdHRsZSByb290CnRvIGp1c3QgcmlwIHRoaXMgb3V0IEFTQVAu
ICBJJ2xsIGdpdmUgaXQgc29tZSBtb3JlIHRpbWUsIGJ1dCBpdCBpdCBkb2Vzbid0CmdldCB1c2Vk
IGFmdGVyIGEgZmV3IG1vcmUga2VybmVsIHJlbGVhc2VzIHdlIHNob3VsZCBudWtlIGl0LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
