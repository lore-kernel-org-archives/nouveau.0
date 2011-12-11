From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Sun, 11 Dec 2011 06:32:47 +0000
Message-ID: <bug-34554-8800-6mSgVGBTWS@http.bugs.freedesktop.org/>
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

--- Comment #21 from chr[] <cr2005-OFU6aHfy9zqzQB+pC5nmwQ@public.gmane.org> 2011-12-10 22:32:47 PST ---
Hi!

I got the same problem on my MacBook Pro 6,2

System: debian 64bit, with X backport packages (xorg-server 2:1.10.4-1~bpo60+1)
kernel: 3.2.0-rc2 from nouveau/master

I used the nouveau driver for a long time now, and it works pretty well
(xrandr, external display, suspend, hibernate perfect). I also can play games
like "sauerbraten" with some minor bugs.

I tried to find out, if it can run StarCraft II with wine: It can't. The X
Server gracefully died and that corrupted the EDID of the LVDS display:

kernel: [  471.507583] [drm:drm_edid_block_valid] *ERROR* EDID checksum is
invalid, remainder is 217
kernel: [  471.507587] Raw EDID:
kernel: [  471.507590]      00 ff ff ff ff ff ff 00 06 10 bb 9c 00 00 00 00
kernel: [  471.507594]      00 13 01 03 80 21 15 78 0a 50 c5 98 58 52 8e 00
kernel: [  471.507597]      25 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
kernel: [  471.507600]      01 01 01 01 01 01 7c 2e 90 a0 60 1a 1e 40 30 20
kernel: [  471.507603]      36 00 4b cf 10 00 00 18 00 00 00 01 00 06 10 30
kernel: [  471.507606]      00 00 00 00 00 00 00 00 0a 20 00 00 00 fe 00 4c
kernel: [  471.507609]      50 31 35 34 57 45 33 2d 54 4c 42 31 00 00 00 fe
kernel: [  471.507612]      00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 dd
kernel: [  471.507619] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
kernel: [  471.507624] [drm] nouveau 0000:01:00.0: DDC responded, but no EDID
for LVDS-1

Symtoms:
on boot, black screen after the boot sound.
Blind select boot option of refit works:

osx comes up but:
* suspend broken
* starcraft does not launch at all
* external display not detected
* seems to run on nivida card only, no more with the intel gpu

linux comes up, but:
* internal LVDS stays black
* external display works
* *ERROR* EDID checksum spam in system log

I found the correct EDID in an older Xorg.log. Byte 1f flipped from 0x27 to
0x00.

I was able to fix this with Andy Getz's program: 1000 Thanks !!!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
