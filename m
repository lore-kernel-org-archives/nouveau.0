From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Discussion] User controls for PowerManagement
Date: Sun, 10 Jan 2010 12:43:02 +0200
Message-ID: <20100110104302.GB4769@x200>
References: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>
	<20100110123340.7840da75@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100110123340.7840da75-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jan 10, 2010 at 12:33:40PM +0200, Pekka Paalanen wrote:
> Adding dri-devel@ to CC.
> 
> On Thu,  7 Jan 2010 22:44:24 +0100
> r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org wrote:
> 
> > With some progress in PowerManagement support (there's a patch
> > nearly done for reading the P-tables, written mostly by xexaxo,
> > derived from thunderbirds nvclock, with 0x40 adjustments from
> > myself) in my opinion it's time to think about the user aspect of
> > this. My personal idea for GPU scaling was similar to that of CPU
> > scaling in appearance eventually. When you look at the
> > cpufreq-applet for Gnome, you see the choice between every
> > supported CPU speed, and an option for Automatic scaling. To make
> > an application like this possible nouveau needs to communicate
> > with users. I was thinking a procfs or sysfs node for outputting
> > a readable table with possible modes like:
> > 
> > 03: CPU=135MHz,Shdr=135MHz,Mem=135MHz,Vlt=0.8V,Fan=80%;

Ick!

> > the node name would be something like pm_supported. Another node
> > named pm_current could output the current mode (for instance 03),
> > and be writable to set the desired mode. Mode numbers will be the
> > identifier given by pm_supported, found in the powermode table. A
> > third node would then be required to set auto scaling on or off
> > (called pm_auto ?). All those nodes could eventually be placed in
> > a separate subdirectory (pm?)
> > 
> > 1. joi pointed out that procfs is deprecated, and I should use
> > sysfs instead.

/proc is not deprecated per se, you simply shouldn't expose everything
you know to userspace, because it will be impossible to remove later.

In fact you can expose nothing, just implement gpu-ondemand and
gpu-performance and that would be it.
