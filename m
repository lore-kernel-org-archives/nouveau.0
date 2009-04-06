From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21023] NV34GL: fails to properly set up DVI
Date: Mon,  6 Apr 2009 11:30:53 -0700 (PDT)
Message-ID: <20090406183054.13326130057@annarchy.freedesktop.org>
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





--- Comment #11 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-04-06 11:30:52 PST ---
(In reply to comment #10)
> > Does "nv" still work successfully following nouveau having been
> > used?
> 
> Yes.

Well that narrows it down thankfully, but sadly those two registers were the
obvious candidates, so there's going to be some more investigation required.

0) an Xorg.0.log of nouveau *including* X shut-down (or a switch to VT
actually) would help.  If there's any line containing "Parsing digital output
script table" that has a different number than 0xB555, attach a copy of your
video bios ( http://nouveau.freedesktop.org/wiki/DumpingVideoBios -- the "dd"
method should suffice)

1) I now see you reported against
xorg-x11-drv-nouveau-0.0.12-10.20090310git8f9a580.fc11.i586.  While it probably
won't fix anything, could you use
xorg-x11-drv-nouveau-0.0.12-21.20090403git11be9a9.fc11 (or even
git://anongit.freedesktop.org/nouveau/xf86-video-nouveau), so at least the code
I'm looking at is relevant to the symptoms? :)

2) try putting `Option "randr12" "off"' in the Device section of your xorg.conf
-- this makes nouveau use almost the same code as nv for bringing up displays,
so if this doesn't work there's something subtle going on.

3) there's a few other relevant regs that "radeontool regs" doesn't dump;
please do "./radeontool regmatch REGISTER" under nv and nouveau for REGISTER
being: 0x00600804 0x00602804 0x00680608 0x00682608 0x00680630 0x00682630
0x00680634 and 0x00682634 .  For any of these where there's a difference
between the drivers, you could try regset using the "nv" value like before,
when running nouveau, and see if things get fixed.

4) assuming 1 & 3 don't fix it, and 2 works as expected, the next step is
trying to eliminate most of the differences comparing the reg dumps;  would you
prefer a patch to nouveau that does this (with later patches to bisect down to
find which reg/regs need attention), or are you happy doing radeontool regset
for 15-20 regs if I give you a list?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
