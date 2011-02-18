From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34429] New: Failure during resume on NV50:
 INIT_AUXCH: rd auxch fail -121
Date: Fri, 18 Feb 2011 00:55:57 -0800 (PST)
Message-ID: <bug-34429-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34429

           Summary: Failure during resume on NV50: INIT_AUXCH: rd auxch
                    fail -121
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: e-mail+freedesktop-xxErKMtOoaJY9F1qCS7Utw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=43511)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43511)
Kernel messages from boot thorugh suspend to resume

Upon return from suspend, the display turns white and stays that way. The X
server is unusable. Other VTs as well. The problem is 100% reproducible.

I'm using openSUSE 11.4 RC 1 on an HP 8440p with a NVS 3100m card (GT218M, thus
NV50-type). I reported first at
https://bugzilla.novell.com/show_bug.cgi?id=669932 and was asked to report
here. 

I'm using packages dating git20110210 from
http://download.opensuse.org/repositories/home:/jobermayr/openSUSE_Factory/x86_64/ 

Since the problem is reproduced every time, I would be happy to help if I can
provide debugging information. The installation currently is dedicated for this
sole purpose (I need suspend-resume in a would-be production system).

Bugs I found related but IMO still different enough to report this one:
https://bugs.freedesktop.org/show_bug.cgi?id=25762
https://bugs.freedesktop.org/show_bug.cgi?id=25410

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
