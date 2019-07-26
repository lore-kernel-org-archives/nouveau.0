From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: hmm_range_fault related fixes and legacy API removal
 v3
Date: Fri, 26 Jul 2019 06:57:01 +0200
Message-ID: <20190726045701.GB21532@lst.de>
References: <20190724065258.16603-1-hch@lst.de>
 <20190726001622.GL7450@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190726001622.GL7450-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTI6MTY6MzBBTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgZG9uJ3Qgc2VlIFJhbHBoJ3MgdGVzdGVkIGJ5LCBkbyB5b3UgdGhpbmsgaXQg
Y2hhbmdlZCBlbm91Z2ggdG8KPiByZXF1aXJlIHRlc3RpbmcgYWdhaW4/IElmIHNvLCBSYWxwaCB3
b3VsZCB5b3UgYmUgc28ga2luZD8KClRoZSBjaGFuZ2VzIHdlcmUgZmFpcmx5IHNtYWxsLCBidXQg
SSBkaWRuJ3QgZmVlbCB0byBjYXJyeSBpdCBvdmVyIGdpdmVuCnRoYXQgdGhlcmUgd2VyZSBjaGFu
Z2VzIGFmdGVyIGFsbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
