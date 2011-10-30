From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42384] X fails on NV11 with Error allocating scanout
	buffer: 0
Date: Sun, 30 Oct 2011 16:06:24 +0000
Message-ID: <bug-42384-8800-323ku1Rpkr@http.bugs.freedesktop.org/>
References: <bug-42384-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-42384-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42384

--- Comment #5 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> 2011-10-30 09:06:24 PDT ---
You're absolutely right. The VRAM is 16Mb. I was misled by the GART aperture
being 64Mb.

No need for the hack. I managed to get it working by setting the framebuffer to
8bpp at the lowest resolution listed in the modelines from the Xorg log
(640x350). I can then get X working at full resolution as long as I use 16bpp.
These together account for <4Mb, so something is being profligate with the
VRAM, but it works, so I'm happy. Thankyou for your help.

For the record, I put the following on the end of the kernel line in grub.conf:
    video=LVDS-1:640x350-8

and my xorg.conf looks like this:

Section "Device"
        Identifier      "n"
        Driver          "nouveau"
EndSection

Section "Screen"
        Identifier      "n"
        Device          "n"
        DefaultDepth    16

        SubSection "Display"
                Depth   16
                Modes   "1600x1200"
        EndSubSection
EndSection

I'll attach new logs.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
