From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25393] New: Repeated "EDID checksum is invalid"
 erros with varying remainders on NV43
Date: Wed,  2 Dec 2009 05:08:43 -0800 (PST)
Message-ID: <bug-25393-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25393

           Summary: Repeated "EDID checksum is invalid" erros with varying
                    remainders on NV43
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: TomasMiljenovic-Ah+7SPImtolBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=31654)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31654)
dmesg | tail -n 150

I'm experiencing X crashes, graphical corruption and sudden deactivations of a
VGA monitor using nouveau and dual head with my NV43.  I'm seeing the following
from dmesg each time:
    [drm:edid_is_valid] *ERROR* EDID checksum is invalid, remainder is N
    [drm:edid_is_valid] *ERROR* Raw EDID:
for varying N.  There can be one or several consecutive occurrences of EDID
errors for each problem.  The remainder displayed (N) is not constant in the
latter case.  Every printed raw EDID appears correct however.

Though commonly occurring when starting an X session or resuming from suspend,
this also happens at seemingly random intervals with no apparent correlation
with my uptime or how long my X server's been running.  Graphical corruption is
only visible after s2ram.

N.B. Using current Fedora 12 packages, no modifications.  Problems did not
occur with Fedora 11 snapshots.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
