From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29455] Nouveau TV-out incorrectly detecting load on
	NV18
Date: Wed, 11 Aug 2010 11:44:40 -0700 (PDT)
Message-ID: <20100811184440.3AFEC130118@annarchy.freedesktop.org>
References: <bug-29455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29455

--- Comment #1 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-08-11 11:44:39 PDT ---
(In reply to comment #0)
> Nouveau is detecting and enabling TV-out, even though nothing is plugged in to
> it.
> 
> This causes the non-X terminals to only offer reduced resolution in the upper
> left corner of the display, and also has a few implications for X. Overall my
> problem seems very similar to bug #26800 .
> 
> I'm afraid I can't help much in solving this problem, for my knowledge of
> kernel internals is close to non-existent, and anyway PowerPC is not supported
> by the Nvidia binary driver.
> 
> I don't care much about the non-X terminals' resolution, but there is one
> annoying problem in X: Firefox (or Iceweasel in Debian) only expands its
> bookmarks menu within the small area in the upper left corner of the screen.
> Also the background in GDM and Gnome is show in reduced resolution in that
> corner, in addition to a full screen version.
> 
> I can get rid of the problems in X by calling "xrandr --output TV-1 --off". A
> permanent fix is the following simple /etc/X11/xorg.conf:
> 
> Section "Monitor" 
>        Identifier      "TV-1"
>        Option          "Ignore" "True" 
> EndSection 
> 
> The problem occurs with Ubuntu 10.04 (Kernel 2.6.33, nouveau
> 0.15+git20100219+9b4118d-0ubuntu5) and with Debian sid (Kernel 2.6.35, nouveau
> 0.16+git20100518+4b8f1a0-1).
> 
> I keep getting messages like this in the Kernel log:
> 
> [ 6399.294705] [drm] nouveau 0000:00:10.0: Output TV-1 is running on CRTC 1
> using output B
> [ 6399.498411] [drm] nouveau 0000:00:10.0: Load detected on output B
> [ 6399.730419] [drm] nouveau 0000:00:10.0: Load detected on output B
> [ 6399.934411] [drm] nouveau 0000:00:10.0: Load detected on output B
> [ 6400.126411] [drm] nouveau 0000:00:10.0: Load detected on output B
> 
> (from Debian)
> 
> [  124.508970] [drm] nouveau 0000:00:10.0: Load detected on output B
> [  150.448932] [drm] nouveau 0000:00:10.0: Load detected on output B
> [  232.721150] [drm] nouveau 0000:00:10.0: Load detected on output B
> [  232.727489] [drm] nouveau 0000:00:10.0: Setting dpms mode 3 on TV encoder
> (output 2)
> [  243.165175] [drm] nouveau 0000:00:10.0: Load detected on output B
> 
> (from Ubuntu)

Ideally you'd take an mmiotrace from the nvidia blob to fix this. I understand
that it's not an option in this case -- a video BIOS dump and a register dump
*might* be enough though: [1] has instructions on dumping video BIOSes, and you
can use [2] after a fresh boot, before loading nouveau.ko to get a register
dump.
Full kernel logs may be useful too.

[1] http://nouveau.freedesktop.org/wiki/DumpingVideoBios
[2] http://cgit.freedesktop.org/~currojerez/tvdump/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
