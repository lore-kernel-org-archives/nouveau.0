From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48890] New: dmesg full of DATA_ERROR
 SEMANTIC_PTSZ_OVER_LIMIT errors on nouveau driver
Date: Wed, 18 Apr 2012 12:12:18 +0000
Message-ID: <bug-48890-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48890

             Bug #: 48890
           Summary: dmesg full of DATA_ERROR SEMANTIC_PTSZ_OVER_LIMIT
                    errors on nouveau driver
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: askondro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 60270
  --> https://bugs.freedesktop.org/attachment.cgi?id=60270
dmesg log

I have a GTX260 (NV50 I guess) and currently I'm getting a lot of DATA_ERROR
SEMANTIC_PTSZ_OVER_LIMIT errors in dmesg.

Whenever I see that Chrome has some rendering issues I look in the dmesg log
file and see all the errors mentioned above.

I can't say for sure that only Chrome produces these errors... 

My system is:
Linux arch 3.4.0-1-mainline #1 SMP PREEMPT Mon Apr 16 23:30:21 CEST 2012 x86_64
Intel(R) Core(TM) i7 CPU 920 @ 2.67GHz GenuineIntel GNU/Linux

- mesa (latest from git)
- libdrm (latest from git)
- xf86-video-nouveau (latest from git)
- xserver 1.12.1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
