From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52398] New: nouveau: DPMS permanently turns off
 display when starting X.org, text console works fine
Date: Mon, 23 Jul 2012 21:25:32 +0000
Message-ID: <bug-52398-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=52398

             Bug #: 52398
           Summary: nouveau: DPMS permanently turns off display when
                    starting X.org, text console works fine
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 64544
  --> https://bugs.freedesktop.org/attachment.cgi?id=64544
Kernel log (dmesg)

Hi,

I have been running Debian Linux on a Apple PowerMac G4 "Quicksilver" (Model:
M8493) with the following main hardware specifications:

- PowerPC G4 7450, 867 MHz
- 1GB main memory
- nVidia GeForce GeForce2 MX/MX 400 (NV11) AGP video adapter

Software environment:

- Debian Linux PowerPC unstable
- Kernel 3.4.4 (from Debian experimental)
- nouveau X.org driver 1.0.1
- libdrm: 2.4.33
- mesa: 8.0.3

Problem description:

When using nouveau, the video adapter permanently turns off the attached
display through DPMS. This cannot be reversed and I do not get back video until
I reboot the machine by logging in through SSH. I can neither switch to a
virtual text console using <Ctrl>+<Alt>+<F1..Fn>.

The video output is fine when preventing X from starting and using just a
virtual text console (KMS works fine as well).

xrandr does not any displays attached, see attached logfiles and xrandr output.

I'm attaching the following files:

- kernel log (dmesg)
- Xorg.0.log
- lspci output
- xrandr --verbose output
- vbios.rom (cp "/proc/device-tree/pci@f0000000/NVDA,Parent@10/NVDA,BMP"
~/vbios.rom)

If you need any further input, please let me know. The machine is a sole test
machine, so I'm happy to try any code from git or run any quirky code.

Cheers,

Adrian

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
