From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27455] dualhead not working,
	second display always black
Date: Mon, 12 Apr 2010 07:54:32 -0700 (PDT)
Message-ID: <20100412145432.DD26A13005D@annarchy.freedesktop.org>
References: <bug-27455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27455

--- Comment #6 from Michael Schmitt <mschmitt-uoKmDypFOGPNLxjTenLetw@public.gmane.org> 2010-04-12 07:54:32 PDT ---
Created an attachment (id=34912)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=34912)
dump in singleuser mode

Sorry it took me so long to report back.

As asked on IRC I did run tvdump in singleusermode (no nouveau.ko loaded, no X
running). Two things I did notice there:

1.) (I guess directly related) when issued the tvdump command, the screen did
not refresh anymore from that point on. I could see the new prompt and type
"reboot" (which was shown as I typed it) but the blinking cursor was one line
under it and no rebooting (changing runlevel, stopping bla, killing foo,
rebooting, ...) messages were printed on the screen, but the box did
successfully reboot. To investigate this (if tvdump did cause a segfault or
worse) I did start in singleuser mode again, ran tvdump without piping the
output to a file, and again no screerefresh, and as ctrl-alt-del did not reboot
the box after several 10s of seconds I did power it off (maybe too early...).
Anyway, dump is attached.

2.) (I am almost certain this is another bug and unrelated) As this time was
the first time I did reboot the box without playing around with nv vs. nvidia
vs. nouveau, in other words a complete "nouveau only session from bootup to
shutdown / reboot" I noticed what I have seen before (but before I did play
alot with the different graphic drivers so I thought that could happen). It
seems the graphic chip was left in a somewhat unclean state. The BIOS messages
and grub were utterly damaged and almost completely unreadable (I could glimpse
at least half of one kernel line in the grub menu). After a complete powerdown
all was well again.
Should I report this as a new bug? At least I did not find an existing bug
about a similar issue.

regards
Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
