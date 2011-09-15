From: "Shinpei KATO" <shinpei@il.is.s.u-tokyo.ac.jp>
Subject: Proposal for a DRM-compliant GPU command scheduler
Date: Thu, 15 Sep 2011 16:20:13 -0700
Message-ID: <003901cc73fe$0b6e09b0$224a1d10$@il.is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Language: en-us
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi,

I am the main developer of the TimeGraph GPU command scheduler, which was
presented at XDC 2011 in Chicago a few days ago.
Please let me propose this approach to scheduling GPU-accelerated processes
with DRM.

This GPU scheduler will help to prioritize and isolate multiple
GPU-accelerated processes executing concurrently for protecting important
GPU workload in multi-tasking environments. It is designed and implemented
at the DRM level as a "drm_sched" component. Each architecture-dependent
driver (nouveau, radeon, i915, etc.) is also required to call the scheduling
functions provided by this drm_sched component accordingly. Nothing needs to
be changed in user-space runtimes.
The priorities and resource limits can be specified through
"/proc/driver/drm_sched/#PID/{sched_policy,resv_policy,priority,runtime,peri
od}" and/or "/etc/drm_sched.spec". Other user interfaces could also be
possible.
The impact of prioritization and isolation on protecting important
GPU-accelerated processes from competing GPU workload is quite significant
(e.g., 3-D games can run at a 10x~ faster rate, using our GPU scheduler,
when heavy workload is competing the GPU). Performance interference among
GPU-accelerated processes can also be well-controlled.
We can activate this GPU scheduler only when multiple processes use the GPU.
Hence *nothing* would be harmful for a standalone execution.
I felt that the audience at XDC 2011 was pretty supportive for this idea.

TimeGraph is developed in a collaborative project with Carnegie Mellon
University, University of California Santa Cruz, and University of Tokyo.
The project website is: http://rtml.ece.cmu.edu/projects/timegraph/

The documentation about how it works is:
http://rtml.ece.cmu.edu/projects/timegraph/raw-attachment/wiki/documentation
/drm_sched_rtgpu.pdf
More information is available at:
http://rtml.ece.cmu.edu/projects/timegraph/wiki/documentation

The instruction to install our Nouveau-based prototype driver is:
http://rtml.ece.cmu.edu/projects/timegraph/wiki/install
For convenience of development, the GPU scheduler is provided as an
independent kernel module (https://gitorious.org/rtgpu/timegraph), but it
can also be part of DRM.
You will also need the Nouveau-tree Linux kernel patched for drm_sched
(https://gitorious.org/rtgpu/linux-rtgpu). Please see the instruction above.
There are not so many changes applied to the current kernel code, as you can
quickly reference at:
http://rtml.ece.cmu.edu/projects/timegraph/attachment/wiki/install/linux-rtg
pu.patch

I would appreciate any comments and feedback from you.

Best Regards,
- Shinpei Kato
