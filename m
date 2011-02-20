From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34508] New: [grub x86_64-efi] Macbook 5,
 2 - conflicting fb hw usage nouveaufb vs EFI VGA - removing generic
 driver
Date: Sun, 20 Feb 2011 14:14:24 -0800 (PST)
Message-ID: <bug-34508-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34508

           Summary: [grub x86_64-efi] Macbook 5,2 - conflicting fb hw
                    usage nouveaufb vs EFI VGA - removing generic driver
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dest-vb1CFJ/PVqUHz/9yF02f9g@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have a MacBook 5,2 equiped with a Nvidia 9400M. On this machine, I have the
following bug https://bugs.launchpad.net/acpi/+bug/341230 which is also
reported here : http://bugzilla.kernel.org/show_bug.cgi?id=13170

Basically, due to this bug, the OS doesn't boot unless the option maxcpus=1 is
set in grub2. Some people say they managed to have both cores when they built
grub2 for x86_64 for efi.

This is what I've done with grub2 1.99rc1. I run Ubuntu 10.10 Desktop 64bits.
I managed to boot the kernel but when the timestamp is at ~2 seconds, I hit a
bug with this error: "fb: conflicting fb hw usage nouveaufb vs EFI VGA -
removing generic driver".

The screen freezes except the top which has a sort of green-ish square overlay.
From there, the only thing I can do is to turn the computer off.

I did some googling but I haven't come accross a similar problem. Maybe
https://bugs.freedesktop.org/show_bug.cgi?id=29171 is a start.

Please tell me how I could provide more informations. I don't experience this
bug when I boot the kernel from grub in a "BIOS-way".

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
