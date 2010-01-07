From: r.spliet-+WoPDYjVzZevezkx17PYy4RWq/SkRNHw@public.gmane.org
Subject: [Discussion] User controls for PowerManagement
Date: Thu,  7 Jan 2010 22:44:24 +0100
Message-ID: <1262900664.4b4655b8c25cc@netmail.leidenuniv.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

With some progress in PowerManagement support (there's a patch nearly done for
reading the P-tables, written mostly by xexaxo, derived from thunderbirds
nvclock, with 0x40 adjustments from myself) in my opinion it's time to think
about the user aspect of this.
My personal idea for GPU scaling was similar to that of CPU scaling in
appearance eventually. When you look at the cpufreq-applet for Gnome, you see
the choice between every supported CPU speed, and an option for Automatic
scaling. To make an application like this possible nouveau needs to communicate
with users.
I was thinking a procfs or sysfs node for outputting a readable table with
possible modes like:

03: CPU=135MHz,Shdr=135MHz,Mem=135MHz,Vlt=0.8V,Fan=80%;
...

the node name would be something like pm_supported. Another node named
pm_current could output the current mode (for instance 03), and be writable to
set the desired mode. Mode numbers will be the identifier given by
pm_supported, found in the powermode table. A third node would then be required
to set auto scaling on or off (called pm_auto ?). All those nodes could
eventually be placed in a separate subdirectory (pm?)

1. joi pointed out that procfs is deprecated, and I should use sysfs instead.
There are two reasons to use procfs:
- DRM has a pointer to the right DRM subfolder (/proc/drm/<card number>) which
can be obtained by drm_device.control->proc_root. Ofcourse, if there's
something similar for sysfs available, then there's no problem. Otherwise
procfs simply saves a lot of hassle as long as DRM still promotes procfs to the
device drivers.
- sysfs was designed for "one value per node". The output of the pm_supported
node would be an entire table. Is this on par with the design of sysfs?
So: procfs or sysfs?

2. It sounds sensible to me to have one scaling algorithm (whatever that may
become... first things first). When you can scale you can have the maximum
performance as soon as you need it... so the aim should be maximum powersaving
at all time, without sacrificing on performance. Agreed, or should there be
several "auto" modes for different situations?

RSpliet
