From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21023] NV34GL: fails to properly set up DVI
Date: Mon,  6 Apr 2009 12:39:09 -0700 (PDT)
Message-ID: <20090406193909.2562A130058@annarchy.freedesktop.org>
References: <bug-21023-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21023-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21023





--- Comment #13 from Bill Nottingham <notting-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>  2009-04-06 12:39:08 PST ---
(In reply to comment #11)

> 1) I now see you reported against
> xorg-x11-drv-nouveau-0.0.12-10.20090310git8f9a580.fc11.i586.  While it probably
> won't fix anything, could you use
> xorg-x11-drv-nouveau-0.0.12-21.20090403git11be9a9.fc11 (or even
> git://anongit.freedesktop.org/nouveau/xf86-video-nouveau), so at least the code
> I'm looking at is relevant to the symptoms? :)

It's been upgraded as time goes on - it's running
xorg-x11-drv-nouveau-0.0.12-22.20090404git836d985.fc11.i586 now.

> 2) try putting `Option "randr12" "off"' in the Device section of your xorg.conf
> -- this makes nouveau use almost the same code as nv for bringing up displays,
> so if this doesn't work there's something subtle going on.

Yes, that fixes it.

> 3) there's a few other relevant regs that "radeontool regs" doesn't dump;
> please do "./radeontool regmatch REGISTER" under nv and nouveau for REGISTER
> being: 0x00600804 0x00602804 0x00680608 0x00682608 0x00680630 0x00682630
> 0x00680634 and 0x00682634 .  For any of these where there's a difference
> between the drivers, you could try regset using the "nv" value like before,
> when running nouveau, and see if things get fixed.


diff -u rr-nv rr-nouveau
--- rr-nv       2009-04-06 15:24:57.000000000 -0400
+++ rr-nouveau  2009-04-06 15:25:58.000000000 -0400
@@ -1,7 +1,7 @@
-0x00600804     0x00000000 (0)
+0x00600804     0x00000002 (2)
 0x00602804     0x00000000 (0)
 0x00680608     0xf0010000 (-268369920)
-0x00682608     0x00000000 (0)
+0x00682608     0xf0000000 (-268435456)
 0x00680630     0x00000000 (0)
 0x00682630     0x00000000 (0)
 0x00680634     0x00000000 (0)

Setting 00600804 to 0 doesn't help. Setting 00682608 to 0 doesn't work (it
stays set to 0xf0000000).

> 4) assuming 1 & 3 don't fix it, and 2 works as expected, the next step is
> trying to eliminate most of the differences comparing the reg dumps;  would you
> prefer a patch to nouveau that does this (with later patches to bisect down to
> find which reg/regs need attention), or are you happy doing radeontool regset
> for 15-20 regs if I give you a list?

Sure, I can poke random values in.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
