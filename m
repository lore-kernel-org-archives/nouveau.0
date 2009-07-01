From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22572] New: X doesn't start: "Prepare for
	strangeness..."
Date: Wed,  1 Jul 2009 00:19:01 -0700 (PDT)
Message-ID: <bug-22572-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22572

           Summary: X doesn't start: "Prepare for strangeness..."
           Product: xorg
           Version: unspecified
          Platform: Other
               URL: https://bugzilla.redhat.com/show_bug.cgi?id=504464
        OS/Version: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shahamit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                CC: shahamit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


I've reported this bug at the Red Hat bugzilla for the issue I face in Fedora
11.

I've given the details at the link:
https://bugzilla.redhat.com/show_bug.cgi?id=504464

Some kernel messages I see are:
nouveau: nouveau_fifo_free: freeing fifo 1
nouveau: Failed to idle channel 1. Prepare for strangeness..
nouveau: PFIFO_DMA_PUSHER - Ch 1
nouveau: nouveau_fifo_free: freeing fifo 0
nouveau: PFIFO_DMA_PUSHER - Ch 1

The Xorg.0.log files are attached in the bugzilla link mentioned above.

driver version: xorg-x11-drv-nouveau-0.0.12-36.20090514git9656762.fc11.x86_64


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
