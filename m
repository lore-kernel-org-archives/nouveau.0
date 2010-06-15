From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28524] Debian Testing Kernel Upgrade Enables KMS,
 Disables External Monitor
Date: Mon, 14 Jun 2010 17:15:07 -0700 (PDT)
Message-ID: <20100615001507.30FBE13008D@annarchy.freedesktop.org>
References: <bug-28524-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28524-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28524

GilbertSullivan <whirlygig-Wuw85uim5zDR7s880joybQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |major

--- Comment #2 from GilbertSullivan <whirlygig-Wuw85uim5zDR7s880joybQ@public.gmane.org> 2010-06-14 17:15:06 PDT ---
Following upgrade of xserver-common and xserver-xorg-core from 2:1.7.7-1 to
2:1.7-2 on 06/14/2010 the ensuing reboot saw the external DVI-connected LCD on
the port replicator cease to function on both kernels, whether or not nouveau
was blacklisted. It was failing at loading gdm on the new kernel, and I got
dumped at tty2 with the text-graphics dialog asking whether or not I wanted to
see the xorg log. (I could not choose yes or no, and tty2 was sluggish and
non-responsive to keyboard input.) Switching to tty1 enabled me to log on and
make configuration changes.

Removed the "blacklist nouveau" entry from /etc/modprobe.d/blacklist.conf since
the port replicator and external monitor are useless for now.

Drivers now being shown by query:

$ grep -B2 'Module class: X.Org Video Driver' /var/log/Xorg.0.log

(II) Module nouveau: vendor="X.Org Foundation"
    compiled for 1.7.7, module version = 0.0.15
    Module class: X.Org Video Driver
--
(II) Module nv: vendor="X.Org Foundation"
    compiled for 1.7.7, module version = 2.1.17
    Module class: X.Org Video Driver
--
(II) Module vesa: vendor="X.Org Foundation"
    compiled for 1.7.7, module version = 2.3.0
    Module class: X.Org Video Driver

Video behavior of the system (sans port replicator and external monitor, of
course) is very much improved, with workspace switching and log off prompt
happening instantly -- even with Xfce desktop compositing enabled. (Those
switches in that configuration used to require several seconds.)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
