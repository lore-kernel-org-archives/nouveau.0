From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Proposal for a DRM-compliant GPU command scheduler
Date: Fri, 16 Sep 2011 16:58:32 +0200
Message-ID: <20110916145832.GF2873@phenom.ffwll.local>
References: <003901cc73fe$0b6e09b0$224a1d10$@il.is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <003901cc73fe$0b6e09b0$224a1d10$@il.is.s.u-tokyo.ac.jp>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Shinpei KATO <shinpei@il.is.s.u-tokyo.ac.jp>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi,

I haven't attended xdc in chicago, but I've read through your slides and
looked a bit at the code. We're planing to implement gpu scheduling for
intel gpus, too, so I'm pretty interested in this area. Comments:

- your code seems to rather thightly integrated with how nvidia hw works.
  I'm not sure whether it's a good fit for other hw, especially if/when
  there's better support from the hw for context switching.

- by the looks of it, scheduling happens via: gpu completion irq handler
  -> realtime thread -> waking up of the blocked process that got put to
  sleep before command submission. There's also a fastpath that does not
  block the command submission if the scheduler allows the process to run
  immediately. I fear this has quite high overhead and the scheduler
  design doesn't seem to allow clever tricks like issuing gpu batchbuffers
  eagerly and patching up execution after the fact (if e.g. a previous
  batchbuffer used up too much time). Your argument that the scheduler
  completely disables itself is also a bit void - contemporary desktop and
  mobile systems always have mutliple clients: A compositor and the
  clients, sometimes there's even an X process rearing its ugly head ;-)

- Imo your code needs quite some clean-up. I've noticed e.g. that it
  doesn't use the linux struct list_head functions. It also seems to
  re-implement a waitqueue/completions in a (racy) way.

- Imo the area that would most benefit from a shared gpu scheduler
  infrastructure is the userspace interface, so that a common set of tools
  can be used accross different drivers. Your solutions to configure the
  scheduler seems to be to read a file in /etc from the kernel module
  which is ... a bit ugly, to say the least.

In short it'd be awesome if you can help in creating a gpu scheduler
infrastructure for linux. But unfortunately your current code is imo
pretty far away from something that could be merged.

Yours, Daniel

On Thu, Sep 15, 2011 at 04:20:13PM -0700, Shinpei KATO wrote:
> Hi,
> 
> I am the main developer of the TimeGraph GPU command scheduler, which was
> presented at XDC 2011 in Chicago a few days ago.
> Please let me propose this approach to scheduling GPU-accelerated processes
> with DRM.
> 
> This GPU scheduler will help to prioritize and isolate multiple
> GPU-accelerated processes executing concurrently for protecting important
> GPU workload in multi-tasking environments. It is designed and implemented
> at the DRM level as a "drm_sched" component. Each architecture-dependent
> driver (nouveau, radeon, i915, etc.) is also required to call the scheduling
> functions provided by this drm_sched component accordingly. Nothing needs to
> be changed in user-space runtimes.
> The priorities and resource limits can be specified through
> "/proc/driver/drm_sched/#PID/{sched_policy,resv_policy,priority,runtime,peri
> od}" and/or "/etc/drm_sched.spec". Other user interfaces could also be
> possible.
> The impact of prioritization and isolation on protecting important
> GPU-accelerated processes from competing GPU workload is quite significant
> (e.g., 3-D games can run at a 10x~ faster rate, using our GPU scheduler,
> when heavy workload is competing the GPU). Performance interference among
> GPU-accelerated processes can also be well-controlled.
> We can activate this GPU scheduler only when multiple processes use the GPU.
> Hence *nothing* would be harmful for a standalone execution.
> I felt that the audience at XDC 2011 was pretty supportive for this idea.
> 
> TimeGraph is developed in a collaborative project with Carnegie Mellon
> University, University of California Santa Cruz, and University of Tokyo.
> The project website is: http://rtml.ece.cmu.edu/projects/timegraph/
> 
> The documentation about how it works is:
> http://rtml.ece.cmu.edu/projects/timegraph/raw-attachment/wiki/documentation
> /drm_sched_rtgpu.pdf
> More information is available at:
> http://rtml.ece.cmu.edu/projects/timegraph/wiki/documentation
> 
> The instruction to install our Nouveau-based prototype driver is:
> http://rtml.ece.cmu.edu/projects/timegraph/wiki/install
> For convenience of development, the GPU scheduler is provided as an
> independent kernel module (https://gitorious.org/rtgpu/timegraph), but it
> can also be part of DRM.
> You will also need the Nouveau-tree Linux kernel patched for drm_sched
> (https://gitorious.org/rtgpu/linux-rtgpu). Please see the instruction above.
> There are not so many changes applied to the current kernel code, as you can
> quickly reference at:
> http://rtml.ece.cmu.edu/projects/timegraph/attachment/wiki/install/linux-rtg
> pu.patch
> 
> I would appreciate any comments and feedback from you.
> 
> Best Regards,
> - Shinpei Kato
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
