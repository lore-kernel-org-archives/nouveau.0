From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36422] New: unable to hibernate with nouveau and
 NV11 [bisected]
Date: Wed, 20 Apr 2011 05:57:07 -0700 (PDT)
Message-ID: <bug-36422-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36422

           Summary: unable to hibernate with nouveau and NV11 [bisected]
           Product: xorg
           Version: unspecified
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: csights-97jfqw80gc6171pxa8y+qA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,
   This is a kernel bug and i've opened a report there.
https://bugzilla.kernel.org/show_bug.cgi?id=33582

but i heard that opening a bug here was appropriate.  if not, i :(, please
close.

   I'm able to successfully hibernate while using nouveau with kernel version
2.6.35 (and before) but unable to hibernate in 2.6.36 (and after up to
2.6.39-rc2).
   I am not using X.  From the console I test whether hibernate is possible
using "pm-hibernate".
   I've bisected this and located a range of possible commits which changed
this behavior.  
last known good: d17f395cdcec39033a481f96d75e8b3d3c41d43a
first known bad: 816544b21b020bdb9dcb9a5003fe3e1f109e8698
   Between these commits the kernel would not compile.


   This is the nVidia card in the machine.
02:00.0 VGA compatible controller: nVidia Corporation NV11 [GeForce2 MX/MX 400]
(rev b2) (prog-if 00 [VGA controller])
        Subsystem: nVidia Corporation Device 0054
        Flags: bus master, 66MHz, medium devsel, latency 32, IRQ 11
        Memory at dc000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (32-bit, prefetchable) [size=128M]
        [virtual] Expansion ROM at dd000000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 2.0

Let me know if I can provide more info or test patches!

Thanks,  Chad.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
