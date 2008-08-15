From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16033] [Randr12] DPI calculation ludicrously
	incorrect
Date: Fri, 15 Aug 2008 14:48:41 -0700 (PDT)
Message-ID: <20080815214841.EAFCF2DCDD6@annarchy.freedesktop.org>
References: <bug-16033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16033-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16033


Frans Pop <elendil-EIBgga6/0yRmR6Xm/wNWPw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |elendil-EIBgga6/0yRmR6Xm/wNWPw@public.gmane.org




--- Comment #1 from Frans Pop <elendil-EIBgga6/0yRmR6Xm/wNWPw@public.gmane.org>  2008-08-15 14:48:40 PST ---
I'm seeing the same issue on my new laptop (HP 1510p running Debian Lenny).
Initially DPI was getting set to (96, 96), which is too low for my laptop's LCD
screen. Apparently because the laptop's display does not provide size info.

From the Xorg log:
(II) intel(0): Output VGA disconnected
(II) intel(0): Output LVDS connected
(II) intel(0): Output TV disconnected
(II) intel(0): Output LVDS using initial mode 1280x800
(II) intel(0): Monitoring connected displays enabled
(II) intel(0): detected 512 kB GTT.
(II) intel(0): detected 7676 kB stolen memory.
(==) intel(0): video overlay key set to 0x101fe
(==) intel(0): Will not try to enable page flipping
(==) intel(0): Triple buffering disabled
(==) intel(0): Intel XvMC decoder disabled
(==) intel(0): Using gamma correction (1.0, 1.0, 1.0)
(==) intel(0): DPI set to (96, 96)


I had already been playing with a second monitor connected for which I needed
the "Virtual" option. Using info from the Debian wiki I added the correct
display size setting for LVDS, after which my xorg.conf had:

Section "Device"
        Identifier      "Intel GM965 Video Controller"
        Option          "Monitor-LVDS"  "Internal Panel"
        Option          "Monitor-VGA"   "External VGA Monitor"
EndSection

Section "Monitor"
        Identifier      "Internal Panel"
        DisplaySize     261 163         # 10.2x6.3"
EndSection

Section "Monitor"
        Identifier      "External VGA Monitor"
EndSection

Section "Screen"
        Identifier      "Default Screen"
        Monitor         "Internal Panel"

        Subsection "Display"
                Virtual         3000 2000
        EndSubSection
EndSection

After restarting the X server this resulted in:
(II) intel(0): Output VGA disconnected
(II) intel(0): Output LVDS connected
(II) intel(0): Output TV disconnected
(II) intel(0): Output LVDS using initial mode 1280x800
(II) intel(0): Monitoring connected displays enabled
(II) intel(0): detected 512 kB GTT.
(II) intel(0): detected 7676 kB stolen memory.
(==) intel(0): video overlay key set to 0x101fe
(==) intel(0): Will not try to enable page flipping
(==) intel(0): Triple buffering disabled
(==) intel(0): Intel XvMC decoder disabled
(==) intel(0): Using gamma correction (1.0, 1.0, 1.0)
(**) intel(0): Display dimensions: (261, 163) mm
(**) intel(0): DPI set to (291, 311)

Given that only the LVDS is connected the DPI should be (125, 126) based on the
LVDS mode and the display dimensions. The actual DPI is way too high and can be
shown to be calculated from the (dummy) Virtual mode (for example: 3000 / (261
/ 10 / 2.54) = 291).

Even if multiple displays are connected the Virtual setting is not a useful
value as it only defines the _maximum_ area that can be used by combining
monitors and not the _actual_ area.

Note that if I also add the external VGA monitor in the Screen section, the DPI
will default to (96, 96) again. But if I list them in reverse order (external
VGA first and LVDS second), I get the above values again.
Seems like the display dimensions of the last monitor are used, regardless of
what is actually connected.

Cheers,
FJP


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
