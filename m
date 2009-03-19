From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] NV31 lockup
Date: Wed, 18 Mar 2009 21:01:38 -0700 (PDT)
Message-ID: <20090319040138.4FB80130058@annarchy.freedesktop.org>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20341





--- Comment #6 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-03-18 21:01:37 PST ---
Here's a copy of the e-mail I just sent.

Regards,
Jason

-----

Howdy,

This dump is in reference to fd.o bugzilla ticket 20341.  According to the
submission guidelines, you need the following information:

> uname -a
Linux anduril 2.6.28.8 #2 PREEMPT Wed Mar 18 12:25:17 CDT 2009 i686 AMD
Athlon(tm) Processor AuthenticAMD GNU/Linux

> dmesg | grep -A 5 -i nvidia 
nvidia: module license 'NVIDIA' taints kernel.
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 3
PCI: setting IRQ 3 as level-triggered
nvidia 0000:01:00.0: PCI INT A -> Link[LNKA] -> GSI 3 (level, low) -> IRQ 3
NVRM: loading NVIDIA UNIX x86 Kernel Module  173.14.18  Mon Mar  2 12:17:40 PST
2009

The Nvidia board in question has one each of a DVI, S-Video, and VGA
connectors.  A Sun 24" LCD is attached on the DVI port.  I'm not sure what is
meant by "what display mode you used" but I always boot to a VGA
(non-framebuffer) console if that's what you want.

A kernel rebuild was required since the old 2.6.27.2 didn't have debugfs
included.  I took the opportunity to upgrade to 2.6.28.8.

The testing procedure involved increasing the trace entries to 12000000 before
events were no longer dropped.

Enabling MMIO tracing would always lock the system when X was started.  On a
freshly booted system, the lockup would happen extremely early in X startup,
resulting in no data beyond the initial PCIDEV entries being written to the
text file.  I was able to start capturing data by first "priming" the graphics
hardware by starting X, exiting, unloading nvidia.ko, then setting up the MMIO
trace knobs and restarting X.

NVidia's GLX implementation combined with the running tracer seemed to freeze X
midway through startup.  By disabling GLX, I was able to reach a window
manager.  X promptly froze afterward due to reasons unknown.

Despite all this, I'm hoping there is enough data to determine how the blob
sets up AGP for my system.  If not, I'll be happy to make another attempt.

Thanks,
Jason


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
