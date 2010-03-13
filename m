From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27064] New: Nouveau fails to start X. This is a
 Nvidia G210m, the laptop is an asus UL50vt
Date: Sat, 13 Mar 2010 14:28:59 -0800 (PST)
Message-ID: <bug-27064-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=27064

           Summary: Nouveau fails to start X. This is a Nvidia G210m, the
                    laptop is an asus UL50vt
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: stantonmab-4eys/+AIQ4OVc3sceRu5cw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


This is a dual graphics laptop.  It has a Nvidia g210m and a intel x4500. 
Nouveau KMS is enabled via the kernel staging drivers and Intel KMS is disabled
via the kernel. The nouveau module is loading by default.  

When I boot my computer, the Kernel modeset never actually happens.  I have the
December nouveau firmware package installed, but I get error messages.


Here is the error messages

[    6.636822] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    6.636838] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    6.636865] nouveau 0000:01:00.0: setting latency timer to 64
[    6.639651] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013cb6e900 (20091214/exresop-590)
[    6.639660] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20091214/dswexec-445)
[    6.639668] ACPI Error (psparse-0537): Method parse/execution failed
[\_SB_.PCI0.VGA_._DSM] (Node ffff88013fa5d120), AE_AML_OPERAND_TYPE
[    6.639745] ACPI Error (psparse-0537): Method parse/execution failed
[\_SB_.PCI0.P0P1.VGA_._DSM] (Node ffff88013fa5eac0), AE_AML_OPERAND_TYPE
[    6.639803] [drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 12291
[    6.640552] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x0a8a00a2)
[    6.642081] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    6.642101] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    6.642103] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PROM
[    6.642121] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    6.642123] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PCIROM
[    6.642188] nouveau 0000:01:00.0: Invalid ROM contents
[    6.642217] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    6.642219] [drm] nouveau 0000:01:00.0: No valid BIOS image found
[    6.642340] nouveau 0000:01:00.0: PCI INT A disabled



minimal Xorg config

Section "Device"
    Driver         "nouveau"
    BusId          "PCI:1:0:0"
EndSection


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
