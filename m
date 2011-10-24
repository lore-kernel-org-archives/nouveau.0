From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42168] New: false reporting of GL_MAX_TEXTURE_SIZE
 for nvidia geforce 9800 gt
Date: Mon, 24 Oct 2011 17:20:24 +0000
Message-ID: <bug-42168-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42168

             Bug #: 42168
           Summary: false reporting of GL_MAX_TEXTURE_SIZE for nvidia
                    geforce 9800 gt
    Classification: Unclassified
           Product: Mesa
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jimmac-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org


The driver claims to only support GL_MAX_TEXTURE_SIZE=4096 when the hardware
limit seems to be 8192. The limit is used by GNOME 3
(gnome-session-check-accelerated-helper) as a pre check to being able to run
gnome-shell, preventing me from using a 1600x1200 + 2560x1440px monitor setup.
If, however, I attach the secondary monitor after the session starts up, the
hardware seems to be perfectly capable of running the 3D accelerated
environment across both displays with no glitches and artifacts. 

This is on Fedora 16 and the card is recognised as "nVidia Corporation G92
[GeForce 9800 GT] (rev a2)"

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
