From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 44052] New: desktop freezes
Date: Thu, 22 Dec 2011 13:34:49 +0000
Message-ID: <bug-44052-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=44052

             Bug #: 44052
           Summary: desktop freezes
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: wto.wit01-hi6Y0CQ0nG0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 54688
  --> https://bugs.freedesktop.org/attachment.cgi?id=54688
created by dmesg

caused by an "infinite loop" in kernel/nouveau/xserver filling the kernel log
with "fail ttm_validate...." messages.

Debian wheezy AMD64 
Nvidia GeForce 6150
both kernel 3.0.0-* as well as kernel 3.1.0-*

the issue occurred after a monthly system upgrade (xorg.... from 2:1.11.2.901-1
to 2:1.11.1.902-1); before this upgrade the system went smoothely (without any
xorg.conf...)

I run a second PC using the same SW version (same upgrades....) but with a
newer MB (GeForce 8200). On the GeForce8200-system the kernel 3.1.0-* not only
freezes but crashes whereas kernel 3.0.0-* only periodically shows a message
"drm EDID checksunm error...." 

all attachments are related to the GeForce 6150 system:
kernel_log.txt....dmesg
lspci.txt.........lspci -k
dpkg.txt..........dpkg -l
Xorg.0.log........copy from /var/log/....
xorg.conf

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
