From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] New: The new nouveau kernel module fails to
 use my monitor's native resolution
Date: Fri,  9 Sep 2011 13:51:31 -0700 (PDT)
Message-ID: <bug-40747-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40747

           Summary: The new nouveau kernel module fails to use my
                    monitor's native resolution
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=51019)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=51019)
Problematic boot with vanilla 3.0.4

Up until a while ago, the nouveau kernel module allowed me to move my 1600x1200
monitor from the VGA port to the DVI port of my card (before that I used the
`nv' X driver which wasn't able to setup the DVI output with the needed
resolution).  So all was well.
But starting a while ago (not sure when), the nouveau driver started to fail to
use my monitor's native resolution (it uses 1280x960 rather than 1600x1200). 
I'm using Debian built kernels usually and saw the difference somewhere between
Debian's 2.6.32-5 and 2.6.39-2.

To make sure the problem is not on Debian's side, I compiled my own vanilla
3.0.4 kernel (compiled with the same .config as Debian's), which showed the
same problem.

Debian maintainers told me (see debian bug#631582) to send you the dmesg log
with drm.debug=6, so here are three such boot logs: the successful one with
Debian's 2.6.32-5, the unsuccessful one with vanilla 3.0.4, and finally the
half-successful one with Debian's 3.0.0-1 combined with a "video=1600x1200"
argument, which gives me the right resolution (tho with a warning from my
monitor that I'm using a "non optimal" mode, and my monitor (samsung 214t)
seems to think I'm using a 1920x1200 mode for some odd reason).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
