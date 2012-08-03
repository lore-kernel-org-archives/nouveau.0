From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53101] New: Fedora 17 "PFIFO - playlist update
	failed" on boot
Date: Fri, 03 Aug 2012 17:53:25 +0000
Message-ID: <bug-53101-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53101

             Bug #: 53101
           Summary: Fedora 17 "PFIFO - playlist update failed" on boot
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mog55356-5veXjMIWDG/QI89fQ/gtADe48wsgrGvP@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 65099
  --> https://bugs.freedesktop.org/attachment.cgi?id=65099
Kernel log from boot

Problem:
    Can no longer start x server.

Steps to reproduce:
    1. Boot the computer
Expected behaviour:
    User expects to reach the login prompt.
Actual behaviour:
    X Server fails to start

History:
    Updated to latest kernel on Fedora 17 x86_64: Linux version
3.5.0-2.fc17.x86_64 (mockbuild-pT0yeVfQFYmUpIjiNHrHsa8bZ1dH7QcMqApY+AHhFKvYtjvyW6yDsg@public.gmane.org) (gcc version
4.7.0 20120507 (Red Hat 4.7.0-5) (GCC) ) #1 SMP Mon Jul 30 14:48:59 UTC 2012
    Rebooted
    Saw fedora begin to boot up, but instead of being presented with a login
screen I saw noise/leftover images from previous boot
    X server terminated and I saw some nouveau errors on screen:
        [   43.155163] [drm] nouveau 0000:01:00.0: PFIFO - playlist update
failed
        [   53.020045] [drm] nouveau 0000:01:00.0: Failed to idle channel 1.
        [   57.019076] [drm] nouveau 0000:01:00.0: PFIFO - playlist update
failed
        [   60.017783] [drm] nouveau 0000:01:00.0: Failed to idle channel 2.
        [   64.016807] [drm] nouveau 0000:01:00.0: PFIFO - playlist update
failed
    The screen then went back to noise/leftovers for a few seconds, then
displayed those error messages again in sequence
    This continued endlessly until I boot with the previous kernel.

Hardware information:
    The model is a GTX 580m. According to the wiki, this is an NVCE (GF114).
    sudo lspci -v | less found this:
        01:00.0 VGA compatible controller: nVidia Corporation Device 1211 (rev
a1) (prog-if 00 [VGA controller])
            Subsystem: CLEVO/KAPOK Computer Device 7100
            Flags: bus master, fast devsel, latency 0, IRQ 16
            Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
            Memory at e8000000 (64-bit, prefetchable) [size=128M]
            Memory at f0000000 (64-bit, prefetchable) [size=64M]
            I/O ports at e000 [size=128]
            Expansion ROM at f6000000 [disabled] [size=512K]
            Capabilities: [60] Power Management version 3
            Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
            Capabilities: [78] Express Endpoint, MSI 00
            Capabilities: [b4] Vendor Specific Information: Len=14 <?>
            Capabilities: [100] Virtual Channel
            Capabilities: [128] Power Budgeting <?>
            Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1
Len=024 <?>
            Kernel driver in use: nouveau

Attached files:
    messages.txt
        This is the kernel log from the boot with the new kernel. The Fatal X
server error and the PFIFO errors can be found near the end of the log. If I
had let the computer keep running, the last few messages would have looped,
presumably endlessly.
        NOTE: THE LOG CAN ALSO BE ACCESSED HERE - http://pastebin.com/rrVddzgq

Thank you for taking the time to look into this matter. Please let me know if
you require any additional information.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
