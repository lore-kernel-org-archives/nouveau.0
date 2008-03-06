From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14856] New: Black screen w/ RandR12 enabled
Date: Thu,  6 Mar 2008 09:59:47 -0800 (PST)
Message-ID: <bug-14856-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14856

           Summary: Black screen w/ RandR12 enabled
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: lucaotta-whZMOeQn8C0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=14879)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14879)
Xorg log, randr disabled, only laptop digital panel

When enabling RandR12 on my laptop the screen is black, though it is backlit.
I can switch to VT and back to Xserver without any problem.

If I attach a crt monitor, both displays don't work. The analog monitor
complaints about out of range frequency, while the lvds is white (instead of
black).
Again, I have no problem in switching to VT.

My laptop has an nForce chipset.

lspci -v
01:00.0 VGA compatible controller: nVidia Corporation NV36 [GeForce FX Go5700]
(rev a1) (prog-if 00 [VGA])
        Subsystem: Acer Incorporated [ALI] Unknown device 0059
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 16
        Memory at d1000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (32-bit, prefetchable) [size=256M]
        Capabilities: <access denied>

lspci -nn
01:00.0 VGA compatible controller [0300]: nVidia Corporation NV36 [GeForce FX
Go5700] [10de:0348] (rev a1)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
