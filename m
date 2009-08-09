From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] New: Regression: Nvidia Geforce 7300 (NV4B)
 fails to suspend
Date: Sun,  9 Aug 2009 01:24:31 -0700 (PDT)
Message-ID: <bug-23223-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23223

           Summary: Regression: Nvidia Geforce 7300 (NV4B) fails to suspend
           Product: xorg
           Version: 7.2
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=28444)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=28444)
Dmesg just after I completed startup.

The card suspended fine when I was still able to use malc0's
0001-merge-nv40fp.patch . But after the shift to another drm git, KMS must be
enabled to be able to hibernate. I have KMS enabled now, and hibernate hangs at
the first line. (like: Freezing system or something (let me know if you need
the exact sentence)). On IRC, pq said that bisecting was hard (but doable), but
it was better to report it first and see what comments I get. Attached are a
bunch of files, which (I think) are hopefully useful. Especially the file
dmesgwhens2disk seems useful. At first glance the numbers don't seem to change,
but eventually they do...

                              Let met know if you need more info :)

drm (master-compat): 781edc5696881d268781300961fbe99390fe21f9
ddx:77d6bcfb45fca069aafdca0687760d668acd185a

Btw, the kernel documentation says that you need to modprobe nouveau modeset=1
(to enable KMS) . BUT, the nouveau module is already probed by *something else
in my system*. Adding nouveau.modeset=1 to my grub.conf enables it as well o.0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
