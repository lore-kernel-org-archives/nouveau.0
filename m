From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
Date: Fri, 28 Jun 2019 10:10:12 -0700
Message-ID: <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 28, 2019 at 10:08 AM Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
>
> On Fri, Jun 28, 2019 at 10:02 AM Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org> wrote:
> >
> > On Fri, Jun 28, 2019 at 09:27:44AM -0700, Dan Williams wrote:
> > > On Fri, Jun 28, 2019 at 8:39 AM Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org> wrote:
> > > >
> > > > On Wed, Jun 26, 2019 at 02:27:15PM +0200, Christoph Hellwig wrote:
> > > > > The functionality is identical to the one currently open coded in
> > > > > device-dax.
> > > > >
> > > > > Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> > > > > Reviewed-by: Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > > > >  drivers/dax/dax-private.h |  4 ----
> > > > >  drivers/dax/device.c      | 43 ---------------------------------------
> > > > >  2 files changed, 47 deletions(-)
> > > >
> > > > DanW: I think this series has reached enough review, did you want
> > > > to ack/test any further?
> > > >
> > > > This needs to land in hmm.git soon to make the merge window.
> > >
> > > I was awaiting a decision about resolving the collision with Ira's
> > > patch before testing the final result again [1]. You can go ahead and
> > > add my reviewed-by for the series, but my tested-by should be on the
> > > final state of the series.
> >
> > The conflict looks OK to me, I think we can let Andrew and Linus
> > resolve it.
> >
>
> Andrew's tree effectively always rebases since it's a quilt series.
> I'd recommend pulling Ira's patch out of -mm and applying it with the
> rest of hmm reworks. Any other git tree I'd agree with just doing the
> late conflict resolution, but I'm not clear on what's the best
> practice when conflicting with -mm.

Regardless the patch is buggy. If you want to do the conflict
resolution it should be because the DEVICE_PUBLIC removal effectively
does the same fix otherwise we're knowingly leaving a broken point in
the history.
