From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: dev_pagemap related cleanups
Date: Sat, 15 Jun 2019 11:09:09 -0700
Message-ID: <CAPcyv4jkDC3hRt_pj1e8j_OmzJ-wdumy-o1bN0ab=JVE_gfKdg@mail.gmail.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190614061333.GC7246@lst.de>
 <CAPcyv4jmk6OBpXkuwjMn0Ovtv__2LBNMyEOWx9j5LWvWnr8f_A@mail.gmail.com>
 <20190615083356.GB23406@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190615083356.GB23406-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jun 15, 2019 at 1:34 AM Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
>
> On Fri, Jun 14, 2019 at 06:14:45PM -0700, Dan Williams wrote:
> > On Thu, Jun 13, 2019 at 11:14 PM Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
> > >
> > > On Thu, Jun 13, 2019 at 11:27:39AM -0700, Dan Williams wrote:
> > > > It also turns out the nvdimm unit tests crash with this signature on
> > > > that branch where base v5.2-rc3 passes:
> > >
> > > How do you run that test?
> >
> > This is the unit test suite that gets kicked off by running "make
> > check" from the ndctl source repository. In this case it requires the
> > nfit_test set of modules to create a fake nvdimm environment.
> >
> > The setup instructions are in the README, but feel free to send me
> > branches and I can kick off a test. One of these we'll get around to
> > making it automated for patch submissions to the linux-nvdimm mailing
> > list.
>
> Oh, now I remember, and that was the bummer as anything requiring modules
> just does not fit at all into my normal test flows that just inject
> kernel images and use otherwise static images.

Yeah... although we do have some changes being proposed from non-x86
devs to allow a subset of the tests to run without the nfit_test
modules: https://patchwork.kernel.org/patch/10980779/

...so this prompts me to go review that patch.
