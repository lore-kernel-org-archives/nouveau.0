From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18638] New: Nouveau fails totally on new Macbook
 Unibody 13.3" Ubuntu (xorg.0.log included)
Date: Thu, 20 Nov 2008 08:35:35 -0800 (PST)
Message-ID: <bug-18638-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18638

           Summary: Nouveau fails totally on new Macbook Unibody 13.3"
                    Ubuntu (xorg.0.log included)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: yerazunis-MXLR4ItNKm8@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=20470)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=20470)
X log of the nouveau fail on 

Nouveau fails totally on the new Macbook Unibody (macbook series 5.1).  It
gets only to the point of displaying a movable "X" cursor on a black screen,
then fails and drops back to asking what failsafe mode the user wants.  Simply
commenting out the    Driver "nouveau"    line in xorg.conf clears the problem
immediately (but drops us back to VESA modes).

This happens both on an X server restart and on a cold boot.
X itself is OK; both the VESA and Nvidia proprietary drivers work well 
enough.  The id of the card is (from lspci):
 ...
 02:00.0 VGA compatible controller: nVidia Corporation GeForce 9400M (rev b1)
 ...

The full Xorg.0.log of the failure is attached.  Enjoy.

     Bill Yerazunis


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
