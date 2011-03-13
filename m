From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] New: nouveau fails to load BIOS on EFI boot.
Date: Sun, 13 Mar 2011 03:50:05 -0700 (PDT)
Message-ID: <bug-35267-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35267

           Summary: nouveau fails to load BIOS on EFI boot.
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: freedesktop.org-6Pg49yFQ+vvtRgLqZ5aouw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=44410)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=44410)
full dmesg output

I try use nouveau on my gentoo. As this is a MacBook, i installed Grub2 and
boot directly in EFI mode (eg, no BIOS simulation.... i think).
At loading the nouveau driver, it fails due to no valid BIOS found.

The relevant error message is (dmesg output attached):nouveau 0000:01:00.0:
enabling device (0002 -> 0003)
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x084700a2)
checking generic (80060000 960000) vs hw (80000000 10000000)
fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing generic driver
Console: switching to colour dummy device 80x25
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PCIROM
nouveau 0000:01:00.0: Invalid ROM contents
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from ACPI
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: No valid BIOS image found
nouveau 0000:01:00.0: PCI INT A disabled

From this point I do not get any graphical output anymore (but i can ssh into
the host). (On a side note: can i somehow tell the kernel to switch back to
efifb?)

I tried this with the gentoo-sources (36-rc5 kernel), with the git-sources
(38-rc2 and rc3 kernel) always getting the same problem in dmesg.
I too tried use nouveau as a module or compiled into the kernel, no difference.

I tried tell grub to use "fakebios", but it did not worked (or I did somethng
wrong, im not that familiar with grub/efi/bios)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
