From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33887] nouveau causes graphic corruption were you
 cant do anything
Date: Fri,  4 Feb 2011 05:59:12 -0800 (PST)
Message-ID: <20110204135912.D6DB613004D@annarchy.freedesktop.org>
References: <bug-33887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33887

--- Comment #1 from berbae <roger.berny-uXZ41zQLoH0@public.gmane.org> 2011-02-04 05:59:12 PST ---
I have the same display corruption with :

nVidia Corporation C73 [GeForce 7100 / nForce 630i] (rev a2)

Linux arch64 2.6.37-ARCH #1 SMP PREEMPT Sat Jan 29 20:00:33 CET 2011 x86_64
Pentium(R) Dual-Core CPU E5200 @ 2.50GHz GenuineIntel GNU/Linux

In the Arch Linux forum thread :
https://bbs.archlinux.org/viewtopic.php?id=112758

other persons mentioned the same problem. 
It seems to concern NV3x and NV4x chipsets.

It happens with the upgrades :

libdrm 2.4.22 -> 2.4.23
libgl 7.9.0.git20101207 -> 7.10
libva 1.0.6 -> 1.0.8
mesa 7.9.0.git20101207 -> 7.10
xf86-video-nouveau 0.0.16_git20100819 -> 0.0.16_git20101217

See also the bug report in the Arch Linux flyspray :
https://bugs.archlinux.org/task/22700?project=1

Everything seems normal in the log files, and the processes are running ok, X
server and the WM processes are started normally.
Only the mouse cursor works and the display is totally unusable as shown in the
screenshots.

Downgrading to the previous release version restore the display as normal.

Please look into this horrible regression to fix it, because the recent release
of the nouveau driver is totally unusable.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
