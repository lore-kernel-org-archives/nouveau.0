From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] New: Nouveau seems to have corrupted my
 laptop screen's EDID info
Date: Tue, 22 Feb 2011 02:09:22 -0800 (PST)
Message-ID: <bug-34554-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34554

           Summary: Nouveau seems to have corrupted my laptop screen's
                    EDID info
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: thib-QrglDn8ccD4xJeROf7iEAA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Nouveau seems (seems, it may have been a coincidence, or nouveau failure + hw
failure) to have corrupted my laptop's screen EDID info.
So, here is a nice log of what happened:


Now, a bit of background: I've been using almost exclusively Debian on this
laptop for about 4 years. I have been using nvidia blob, then nv, back to
nvidia blob, and finally nouveau, happily following (not too closely) git
versions.
Now, right after Debian Squeeze update, I've decided to stick with Debian
packages for kernel and X stuff, so, I'm using Debian's version since then.
I've been using nouveau from Debian/testing for two weeks or so without any
problem of any sort.
Then, on February 19, I've decided to try 3D, and so, have upgraded nouveau
(actually, libdrm-nouveau1a, X and drm stuff) to Debian/unstable versions, and
installed both linux-image-2.6.37-1-686 and libgl1-mesa-dri-experimental (that
contains the gallium3D part of nouveau).
I was able to play some GL-using games like Teeworlds, rRootage, Minetest, or
Inside a Star-filled Sky. I've, well, mostly played for a day or two, and then
went back to other occupations.

Then, on February 21, my screen suddenly turned black as I was working on my
own game project (something using pygame, that doesn't use GL in anyway, or at
least in any way I know of).
I was able to safely power off my computer by blindly logging in as root and
typing "poweroff".

Then, the real trouble begins. Upon reboot, the backlights are on, but the BIOS
doesn't show anything on the screen, nor GRUB does.
I'm then plugging in an external monitor and rebooting again. Still nothing on
the laptop's screen, but the external monitor shows the GRUB loading lines,
and... nothing.
Then, I've used a Debian Live USB stick, and syslinux booted, although it
showed me shitty graphics instead of the fancy boot menu. But anyway, it
worked. I then used the installation system present on the LiveUSB to change my
GRUB config and disable the whole graphical menu thing. It worked.

Now, one more reboot, still nothing on the laptop's screen, but Windows (XP)
booted and I was even able to play Quake Wars (on the external monitor,
though). I then tried to use the laptop's screen in windows. As soon as I
enabled it, it showed flickering vertical and horizontal lines on a black
background... When powering off, I was able to see the Windows logo a few time,
but it stayed for a fraction of second before being vertically distorted.

Now, back on Debian, it worked quite fine on the external monitor, too. I've
then reverted libdrm, X stuff and nouveau to Debian/testing versions and, upon
reboot, my screen worked fine.
But it works fine only with nouveau: BIOS, GRUB and windows still fail to use
the laptop's screen.

In addition, the logs show repeated reports of EDID corruptions, and the dumped
memory does actually change (see kern.log.unstable).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
