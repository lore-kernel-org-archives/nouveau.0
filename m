From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42160] New: [NV4e] Mouse pointer disappears randomly
 after resuming from GNOME screensaver
Date: Mon, 24 Oct 2011 12:57:36 +0000
Message-ID: <bug-42160-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42160

             Bug #: 42160
           Summary: [NV4e] Mouse pointer disappears randomly after
                    resuming from GNOME screensaver
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: delete-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 52686
  --> https://bugs.freedesktop.org/attachment.cgi?id=52686
dmesg output

Description of problem:

Using Xorg with nouveau driver, the mouse pointer disappears after resuming
from the GNOME screensaver or inactivity.
The mouse still works,  I can click anywhere in the screen but the pointer is
not seen.

Bug is present in Fedora 15 and Fedora 16 beta.

Version-Release number of selected component (if applicable):

xorg-x11-drv-nouveau-0.0.16-27.20110720gitb806e3f.fc16.x86_64
kernel-3.1.0-0.rc6.git0.0.fc16.x86_64

How reproducible:
Always

Steps to Reproduce:
1. Install Fedora 15/16 in a PC with Geforce 6150
2. Leave the computer running some time
3. 

Actual results:
After inactivity or screensaver (not determined yet) the mouse pointer
disappears.

Expected results:
Mouse pointer always alive.

Additional info:

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
