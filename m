From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15502] New: Unknown LVDS configuration bits
Date: Mon, 14 Apr 2008 11:30:15 -0700 (PDT)
Message-ID: <bug-15502-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15502

           Summary: Unknown LVDS configuration bits
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: low
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pee-ohqclPCdsT1AfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15914)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15914)
xorg log

I upgraded to test a new git build of nouveau and with the new code X does not
start. It worked fine with the normal VT change glitches up to that point.

I the last few lines in the xorg log are:

II) NOUVEAU(0): Found LVDS manufacturer table revision 4.0
(EE) NOUVEAU(0): LVDS table revision not currently supported
(EE) NOUVEAU(0): Pointers to flat panel table invalid
(II) NOUVEAU(0): Found TMDS table revision 2.0
(WW) NOUVEAU(0): TMDS table script pointers not stubbed
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Display Configuration Block version 4.0 found
(II) NOUVEAU(0): DCB header length 27, with 10 possible entries
Raw DCB entry 0: 01000323 00010034
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(EE) NOUVEAU(0): 1364: No valid modes.
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib64/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(II) Unloading /usr/lib64/xorg/modules//libint10.so
(EE) Screen(s) found, but none have a usable configuration.

lspci -v

01:00.0 VGA compatible controller: nVidia Corporation Unknown device 040c (rev
a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Unknown device 20d9
        Flags: bus master, fast devsel, latency 0, IRQ 10
        Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at 2000 [size=128]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0
Enable-
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information <?>


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
