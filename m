From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Tue, 29 Mar 2011 23:22:19 -0700 (PDT)
Message-ID: <20110330062219.73D7713004F@annarchy.freedesktop.org>
References: <bug-34554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34554

Andy Getz <suertreus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |suertreus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #7 from Andy Getz <suertreus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-03-29 23:22:18 PDT ---
TL;DR (short) version:

I have seen very, very similar symptoms on two Dell (D620, XPS M1710) laptops
running nouveau since about the same time.  The laptop panels no longer work
properly in Linux, in BIOS, or in Windows 7, however in one case (D620), proper
fiddling with the BIOS display select hotkey during POST results in partial
functionality under certain circumstances.

Like the OP, I get EDID blocks with an invalid first byte (often 0xa9 or 0xa1)
and/or invalid leading 0x 00ff ffff ffff ff00 reported in dmesg.

I think this is the same issue described in #4552.

Given the amount of my hardware that I believe to have been affected, I am
hereby offering as a bounty a hardware donation of ~200 USD worth of
at-least-sort-of relevant hardware of his/her choosing to any developer able to
resolve this in such a way that my laptop panels start working again, in the
interest of keeping him/her well stocked with hardware to hack.  If you're up
to your eyeballs in cards to work on, I'll ship to another hacker of your
choosing or consider a favorite charity.


Long version:

I don't remember when the problems began, but it would have been within a week
or two of the OP's 19 February date.  First the M1710's panel, and then,
several days later, the D620's panel began to misbehave.

The M1710 will not drive its panel or any external monitor (DVI or VGA) in
BIOS, Linux, or Windows 7 after booting with the panel is connected to the
motherboard LVDS plug.  Booting with the LVDS unplugged allows me to use
external DVI and/or VGA monitors as normal, however even reconnecting the LVDS
at this point does not restore panel functionality.  In either case, the panel
backlight seems to turn on at the proper times, but no image is displayed on
the screen.

The D620 experienced similar symptoms with the exception that the internal
panel could occasionally be coaxed into working in Windows, especially when
connected to the Dell panel as described below.  Pressing the Fn+F8 output
select key combination an appropriate number of times during POST would
reliably restore LVDS output as long as at least one other monitor was
connected, and LVDS output would persist after the other monitor was
disconnected, allowing laptop-style operation until reboot.  In either of these
cases in which the LVDS panel's operation could be restored, both BIOS and
whichever operating system I would subsequently boot would appear confused
about the panel's logical size and the display would appear cropped until I
manually set the display to 1440x900, the LVDS panel's native mode.  To add
insult to injury, the D620's backlight burned out about a week after the other
problems began, but that is only related inasmuch as it makes further tinkering
difficult and unrewarding.

Both laptops were routinely operated in an out of a variety of Dell docking
stations around the time of the failures.  One dock is connected to an old 17"
Dell panel via DVI, and VGA was sometimes connected instead/in addition after
symptoms began for diagnostic purposes.  Two additional docks are connected by
DVI to an IOGEAR GCS1104 4-port DVI/USB/2.1 audio KVM switch, which as best I
can tell supports capturing the EDID block from the attached monitor and
replaying it to the attached PCs as necessary to simulate its physical
connection.  This switch is connected to an Acer panel via DVI.  I have also
tried both systems undocked with only the internal panel plugged in, and with
various combinations of the Dell and Acer panels plugged into the DVI and VGA
ports on the laptops themselves.  Internal panel functionality is similarly
impaired across configurations except as noted above

Both machines have been running in-kernel nouveau since some time before the
problems began.  Both kernels are patched with Gentoo patches, Grsecurity, and
TuxOnIce, however the in-kernel graphics stack is probably very similar to the
corresponding vanilla kernel since none of those patches seems likely to much
affect it.
The M1710 was running x86_64 2.6.36.2 at the time of the failure on a Dell
OEM'd G71 (PCI ID 10de:0297).  Its internal panel is 1920x1200.
The D620 was running x86 2.6.37 at the time of the failure on a Dell OEM'd G72M
(PCI ID 10de:01d7).  Its internal panel is 1440x900.
Both machines have since been upgraded to 2.6.37.2.

Both machines report EDID errors dozens of times in dmesg.  Often the error is
obviously in the first byte, which is often 0xa8 or 0xa1 instead of 0x00, which
results in the checksum being incorrect and the signature invalid.  Sometimes
the EDID appears to be garbage, and sometimes the reported garbage or the
visible defect in the reported EDID changes from message to message in dmesg. 
Tomorrow I will reboot and attach clean dmesg logs showing representative
samples of the error messages.  I will also try booting from vanilla 2.6.28.2
tomorrow and see what I get.

Both machines report syntactically correct EDIDs in response to xrandr
--verbose, however the reported EDIDs do not match the attached displays but
rather correspond to other displays currently or previously attached.

I will attach everything I can think of tomorrow; please let me know what
additional information I can provide.  As stated above, I think this issue is
the same as or at least related to #4552.  Finally, I am totally serious about
donating hardware to whoever is able to help fix my laptop panels.  Just
imagine yourself driver hacking on that new card or testing multi-head with
that extra monitor =).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
