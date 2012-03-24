From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47790] New: sys-kernel/gentoo-sources-3.3.0 - black
 screen on second nouveau display
Date: Sat, 24 Mar 2012 04:21:56 +0000
Message-ID: <bug-47790-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47790

             Bug #: 47790
           Summary: sys-kernel/gentoo-sources-3.3.0 - black screen on
                    second nouveau display
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dan-eYclldcT4NIrZ0Rg1FI7rOTW4wlIGRCZ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


As per bug filed here : https://bugs.gentoo.org/show_bug.cgi?id=409243
Similar to report here :
http://groups.google.com/group/linux.kernel/browse_thread/thread/84bc3d6514bc4069/8cbfe199bbbdcdda?show_docid=8cbfe199bbbdcdda&pli=1
Possibly identical... I just noticed he appears to have exactly the same card.

Following an upgrade to Linux 3.3.0 (from 3.2.11) all output on second monitor
connected a single card( 01:00.0 VGA compatible controller: NVIDIA Corporation
NV36.2 [GeForce FX 5700] (rev a1)) is black/blank.

The system appears to believe a monitor is connected, it gets EDID, it shows up
in configuration utils, you can drag windows onto it (but not see them) etc.

I have since downgraded again (to 3.2.12) and all is well again.

All this was with the built in nouveau driver in the kernel, the Gentoo team
suggested using the external module (nouveau-drm-20120322) but this produces
exactly the same results.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
