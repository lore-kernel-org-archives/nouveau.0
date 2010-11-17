From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31676] New: garbled text after loading nouveau
 module on EFI boot; X driver thinks there are no connected outputs
Date: Wed, 17 Nov 2010 02:49:08 -0800 (PST)
Message-ID: <bug-31676-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31676

           Summary: garbled text after loading nouveau module on EFI boot;
                    X driver thinks there are no connected outputs
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bjt23-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=40329)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=40329)
dmesg output as I modprobe nouveau

Hopefully this isn't too similar or the same as #29171.  I have one of he new
11" MacBook Air machines (MacBookAir3,1) with the 320M chipset (PCI id 0x08a2,
NVAF I believe).

I'm booting in EFI mode using grub2, as this machine appears to have issues
setting up the SATA controller in BIOS emulation mode.  I've booted in BIOS
mode and done a dump of the video BIOS and int10 vector, which I'm loading via
grub2's "loadbios" command.

I'm running 2.6.37-rc2 with a bunch of hw-specific patches applied (as well as
a patch to boot in EFI physical rather than virtual mode, which unbreaks PCI),
the 16 Nov nouveau-drm snapshot from pq's webdir on people.fd.o, and
xf86-video-nouveau git rev 1143e7a.

First I modprobe nouveau.  Screen flashes, and it looks kinda garbled and
messed up.  I can vaguely see the cursor flashing, and I can ssh in.  I'll
attach dmesg output.  From that it looks like it's not finding connected
outputs, and it's using a fallback 1024x768 res (the LCD panel's native res is
1366x768).

From there I try to start X, and it looks like it has the same problem, unable
to find a connected output, and then the server segfaults.

Also possibly of note: I'm unable to get the nvidia proprietary driver to work
either (it just claims it can't initialize the card at all and bails).

Please let me know if there's any more information I can provide.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
