From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41892] New: The mouse turns into an 128x128 square
 and GPU locks up on NV34
Date: Mon, 17 Oct 2011 15:44:53 +0000
Message-ID: <bug-41892-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41892

             Bug #: 41892
           Summary: The mouse turns into an 128x128 square and GPU locks
                    up on NV34
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: albertpool-2BgBnwcziRhmR6Xm/wNWPw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


XFX GeForce FX 5200
VGA connected ADI Microscan LM-1564 monitor
ASRock K7S41GX motherboard
Linux Mint 11 Gnome

Occasionally on NV34, the mouse changes into a white square of 128x128 with
some black blur on it. X locks up, though I can still move the mouse. When I
close or restart X the GPU locks up completely; the screen turns black and
stays black. SysRq magic keys still work to reboot; restarting X through
Alt-SysRq-K does not work. Happens on 2.6.38 and 3.0.4 kernels - I am now
running 3.1-rc9 to see if it solves the problem. It has not yet occurred with
that kernel but I am only running it for a couple of hours now.

The problem does not happen with my NV05 (Micro-Star MS-8806).

When it occurs again, I'll try to ssh into the computer to get a dmesg & xorg
log.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
