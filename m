From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29714] New: Corrupted image (running stripes) on
 Quadro NVS 3100M (HP EliteBook 8440p)
Date: Fri, 20 Aug 2010 14:08:37 -0700 (PDT)
Message-ID: <bug-29714-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29714

           Summary: Corrupted image (running stripes) on Quadro NVS 3100M
                    (HP EliteBook 8440p)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: homyur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=38027)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38027)
Output of dmesg on Linux kernel version 2.6.32

Notebook: HP EliteBook 8440p (VQ667EA#ACB).
Graphics: Nvidia Quadro NVS 3100M (GT218M, NV50).
OS: Ubuntu 10.04.1 LTS (Linux 2.6.32-24 #41), Ubuntu 10.10 Alpha 3 (Linux
2.6.35-14 #19, Linux 2.6.36-999 #201008190908).

After initializing nouveau driver, image is transformed into running stripes.
If screen shows text, stripes are thin. If screen shows desktop, stripes are
thick, colored, and fill entire screen.
With binary Nvidia drivers, this problem is not available.
Outputs of dmesg is attached.

Thanks.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
