From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35360] nouveau: no space while hiding cursor
Date: Tue, 22 Mar 2011 10:22:17 -0700 (PDT)
Message-ID: <20110322172217.3F54F13004F@annarchy.freedesktop.org>
References: <bug-35360-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35360-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35360

--- Comment #2 from Robert White <rwhite-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> 2011-03-22 10:22:17 PDT ---
I have started getting this as well.

This is a single-headed laptop running 64bit system running linux-2.6.38-gentoo
kernel compiled with gcc 4.5.2 p1.1. [there are four outputs available I think
but only one is connected.]

All components are from the gentoo x11 overlay (so they are fresh fetches from
the git tree as of my last rebuild several days ago). I am not sure how to get
the git signatures.

I am using gallium and i have disabled classic (since it wouldnt' compile as
some files were missing form the git commit.)

My system has been up for a day, and the screen has been going blank and back
(normally, e.g. blank screen saver) while there is full-blown KDE 4.6 running
and a VMWare instance running in non-unity mode.

I was going to git fetch and rebuild but I figured that since the system is
still running fine despite the message i could sit on the configuration for a
while in case there is something I can collect for the devs...?

There are _no_ corresponding messages in Xorg.0.log. It's last message was the
final messages of a normal startup, which in my case was

[  3747.106] (--) SynPS/2 Synaptics TouchPad: touchpad found

and that was quite a long time ago.

Uptime: 10:04:01 up 1 day,  6:05, 11 users,  load average: 0.25, 0.24, 0.19

[107527.262456] [drm] nouveau 0000:01:00.0: no space while hiding cursor
[107542.332665] [drm] nouveau 0000:01:00.0: no space while hiding cursor
[107671.592721] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_TPDMA - VM: Trapped
write at 0041ef9d00 status 0000cb20 channel 2 (0x00000ce0)
[107671.592729] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_TPDMA_2D - TP 0 -
Unknown fault at address 0041ef9d00
[107671.592736] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_TPDMA_2D - TP 0 - e0c:
00000000, e18: 00000000, e1c: 01740000, e20: 00000011, e24: 0c030000
[107671.592743] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[107671.592752] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2 (0x0000ce0000) subc 2
class 0x502d mthd 0x0860 data 0x72727272
[107701.958991] [drm] nouveau 0000:01:00.0: no space while hiding cursor
[107718.031554] [drm] nouveau 0000:01:00.0: no space while hiding cursor

My system tempratures are all nominal (not that it matters)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
