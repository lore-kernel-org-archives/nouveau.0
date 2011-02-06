From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33967] New: No image on a VGA screen attached to DVI
 with a dvi to vga adaptor on NVa3 card..
Date: Sun,  6 Feb 2011 09:09:53 -0800 (PST)
Message-ID: <bug-33967-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33967

           Summary: No image on a VGA screen attached to DVI with a dvi to
                    vga adaptor on NVa3 card..
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: GatoLoko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=42994)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=42994)
dmesg log

On a dualhead system, the second screen (a VGA CRT with a DVI adaptor) never
shows anything, remaining in power save mode since boot until shutdown.

I disconnected the other screen, forcing this one to show the bios and boot
messages, and once while the kernel is loading, the screen goes off. The system
is reachable through ssh and seems to be working right.

When both screens are connected, xrandr shows info about both of them. I can
change resolutions on both of them, change the refresh rate on both of them,
... but no image on the screen connected to DVI.

Booting windows, dualhead works, and both screens show proper
images/resolutions/refresh.

Looking at xrandr output, it seems the connectors naming is wrong.
The screen connected to VGA is shown as connected to "DVI-I-1" and the one
connected to DVI is shown as connected to "VGA-1"

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
