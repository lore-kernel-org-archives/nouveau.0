From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35876] New: Hard GPU hang on nvidia
Date: Fri,  1 Apr 2011 08:58:47 -0700 (PDT)
Message-ID: <bug-35876-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35876

           Summary: Hard GPU hang on nvidia
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Created an attachment (id=45137)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45137)
git snapshot

Hardware: Geforce 8400M GS - (0x086700a2)
          Acer Aspire 5720G

Userspace: Git tips of all components except Xserver.
          In attached file, you see the latest commits of each tree

Kernel drm version: dd34154f9bd75d13caefffd9d6086a1d23a45856
          drm/nouveau: use static vidshift of 2 on volt 0x30 tables


This already happened here many times.
Just 2D usage of compiz is enough.
I will eventually test if even just 2D usage can trigger this.

I get this in the kernel log:

<3>[17638.684109] [drm] nouveau 0000:01:00.0: vm flush timeout: engine 0
<3>[17644.904441] [drm] nouveau 0000:01:00.0: PRAMIN flush timeout
<6>[17645.869768] [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x04000000 - Ch 2
<3>[17645.966182] [drm] nouveau 0000:01:00.0: vm flush timeout: engine 5

(Extracted using ram based "black-box", a fixed area in the system memory I
read after a crash.)

System freezes fully.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
