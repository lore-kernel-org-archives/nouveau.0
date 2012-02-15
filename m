From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46059] bad NV50 only works with "nomodeset" kernel
	parameter
Date: Wed, 15 Feb 2012 11:47:54 +0000
Message-ID: <bug-46059-8800-tecsPr67nZ@http.bugs.freedesktop.org/>
References: <bug-46059-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46059-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46059

--- Comment #3 from Chatty <mail-998mvGPAGeuzQB+pC5nmwQ@public.gmane.org> 2012-02-15 03:47:54 PST ---
Hi Emil,

the blob fails at "could not load nvidia kernel module", unfortunately dmesg doesn't show anything about that. Again, I know the card is damaged somehow (had
it repaired a few times, but problems reoccur always). But odd thing is, it still works in VESA mode - only 1024x768, but it works.

When using your kernel parameter it dmesg stops here:
[   16.190148] [drm] Initialized drm 1.1.0 20060810
[   17.009568] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   17.009574] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   17.011184] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x086500a2)
[   17.015638] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[   17.104300] [drm] nouveau 0000:01:00.0: ... BIOS checksum invalid
[   17.104304] [drm] nouveau 0000:01:00.0: No known BIOS signature found

Once there was Video BIOS update from HP which came as PC BIOS update which supports the assumption PCIROM BIOS is correct. But due to the hw failure the VBIOS
does not get copied into the right location. I guess if it could be supplied from file it might work a treat.

Latest BIOS is in here: http://ftp.hp.com/pub/softpaq/sp48001-48500/sp48024.exe

Btw, Windows 7 VESA driver is able to switch to 1440x900 (native display resolution) - NVidia driver fails to load as well.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
