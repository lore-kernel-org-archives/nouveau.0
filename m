From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Wed, 13 Jul 2011 04:03:24 -0700 (PDT)
Message-ID: <20110713110324.CB4091302F3@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #58 from Volker Kuhlmann <list0570-wUU9E3n5/m4qAMOr+u8IRA@public.gmane.org> 2011-07-13 04:03:19 PDT ---
Uuggh, this seems to be a serious problem, even when using nvidia.ko.
Why? Because xorg seems to probe drivers on startup, and somehow managing to
load the nouveau module even when I want to use the nvidia module. The nouveau
module then fails to unload properly (use count is always at least 1, and stays
1 even after changing to runlevel 3 and killing xorg).

I could reliably hang the system just by logging out from kdm. Syslog is full
of nouveau problems - why, given that I am using nvidia?
When renaming all instances of nouveau.ko under /lib/modules the hangs
disappeared.

This has always been there and seems to have zilch effect:

> ls -l /etc/modprobe.d/nvidia.conf 
-rw-r--r-- 1 root root 18 2011-04-29 22:55 /etc/modprobe.d/nvidia.conf
> cat /etc/modprobe.d/nvidia.conf
blacklist nouveau

Symptoms are random freezes requiring a hardware reset, but always involving
some graphics operation. I can detect no other hardware malfunction, and lockup
behaviour is not characteristic of general hardware faults (e.g. ram, cpu,
disk).

My reset button is really polished now ;-((

System details:
openSUSE 11.4 with all updates installed,
currently that is kernel kernel-desktop-2.6.37.6-0.5.1.x86_64
xorg-x11-server-7.6_1.9.3-15.24.2.x86_64
The problem seems worse with
kernel-desktop-2.6.39.2-36.1.x86_64

01:00.0 VGA compatible controller: nVidia Corporation GT216 [GeForce GT 220]
(rev a2)

Mobo is Gigabyte GA-880GA-UD3H with
NB/SB: AMD 880G / SB850
USB 2.0 + 3.0, SATA 3Gb + 6Gb (prob not relevant)
The chipset also contains an integrated ATI Radeon HD 4250 (which works fine on
the OSS radeon driver, with the limits of the driver).
Phenom II X6 1090T CPU

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
