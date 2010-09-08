From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30086] New: Nouveau fails with unreadable EDID
Date: Wed,  8 Sep 2010 04:55:47 -0700 (PDT)
Message-ID: <bug-30086-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30086

           Summary: Nouveau fails with unreadable EDID
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alci-R1JjGarguu0dnm+yROfE0A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


On a Sony VPCCW2S1E laptop, EDID seems to be somehow unreadable:

get-edid: get-edid version 2.0.0
 Performing real mode VBE call
 Interrupt 0x10 ax=0x4f00 bx=0x0 cx=0x0
 Function supported
 Call successful

 VBE version 300
 VBE string at 0x11100 "NVIDIA"

VBE/DDC service about to be called
 Report DDC capabilities

 Performing real mode VBE call
 Interrupt 0x10 ax=0x4f15 bx=0x0 cx=0x0
 Function supported
 Call successful

 Monitor and video card combination does not support DDC1 transfers
 Monitor and video card combination does not support DDC2 transfers
 0 seconds per 128 byte EDID block transfer
 Screen is not blanked during DDC transfer

Reading next EDID block

VBE/DDC service about to be called
 Read EDID

 Performing real mode VBE call
 Interrupt 0x10 ax=0x4f15 bx=0x1 cx=0x0
 Function supported
 Call failed

The EDID data should not be trusted as the VBE call failed
Error: output block unchanged


Video card is a GT 330 M:

01:00.0 VGA compatible controller: nVidia Corporation GT216 [GeForce GT 330M]
(rev a2) (prog-if 00 [VGA controller])
    Subsystem: Sony Corporation Device 9072
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at e2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Memory at e0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at d000 [size=128]
    Expansion ROM at e3000000 [disabled] [size=512K]
    Capabilities: <access denied>
    Kernel driver in use: nvidia
    Kernel modules: nvidia-current, nouveau, nvidiafb


When loading, nouveau driver can't find the laptop's LCD screen, and display is
black.
Notice that proprietary NVidia driver has the same problem, but it offers a
workaround with the customEDID option:

Option "CustomEDID" "DFP-0:/etc/X11/SNY05FA.bin"


Nouveau does not seem to have such an option... Is there a workaround for
nouveau? Or is there a way to find why the EDID cannot be read?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
