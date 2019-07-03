From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
Date: Wed, 3 Jul 2019 20:03:08 +0200
Message-ID: <20190703180308.GA13656@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-23-hch@lst.de> <20190703180125.GA18673@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190703180125.GA18673-uk2M96/98Pc@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDE6MjVQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IENocmlzdG9waCwgSSBndWVzcyB5b3UgZGlkbid0IG1lYW4gdG8gc2VuZCB0aGlz
IGJyYW5jaCB0byB0aGUgbWFpbGluZwo+IGxpc3Q/Cj4gCj4gSW4gYW55IGV2ZW50IHNvbWUgb2Yg
dGhlc2UsIGxpa2UgdGhpcyBvbmUsIGxvb2sgb2J2aW91cyBhbmQgSSBjb3VsZAo+IHN0aWxsIGdy
YWIgYSBmZXcgZm9yIGhtbS5naXQuCj4gCj4gTGV0IG1lIGtub3cgd2hhdCB5b3UnZCBsaWtlIHBs
ZWFzZQo+IAo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
CgpUaGFua3MuICBJIHdhcyBnb2luZyB0byBzZW5kIHRoaXMgc2VyaWVzIG91dCBhcyBzb29uIGFz
IHlvdSBoYWQKYXBwbGllZCB0aGUgcHJldmlvdXMgb25lLiAgTm93IHRoYXQgaXQgbGVha2VkIEkn
bSBoYXBweSB0byBjb2xsZWN0CnJldmlld3MuICBCdXQgd2hpbGUgSSd2ZSBnb3QgeW91ciBhdHRl
bnRpb246ICB0aGUgcmRtYS5naXQgaG1tCmJyYW5jaCBpcyBzdGlsbCBhdCB0aGUgLXJjNyBtZXJn
ZSBhbmQgZG9lbid0IGhhdmUgbXkgc2VyaWVzLCBpcyB0aGF0CmludGVudGlvbmFsPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
