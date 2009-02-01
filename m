From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15276] text rendering,
 PGRAPH_ERROR/ILLEGAL_MTHD/  PROTECTION_FAULT spam in syslog
Date: Sun,  1 Feb 2009 03:30:45 -0800 (PST)
Message-ID: <20090201113045.2D2B2130058@annarchy.freedesktop.org>
References: <bug-15276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15276





--- Comment #10 from Paul Wise <pabs3-RVKGE0iud0ZIf6P1QZMOBw@public.gmane.org>  2009-02-01 03:30:44 PST ---
Applied your patch to the Debian package and now I no longer get the
PGRAPH_ERROR spam.

With the patch I can see the fonts fine with or without MigrationHeuristic
greedy.

Without the MigrationHeuristic greedy, I see some horizontal pixel breakage on
the Debian swirl at xdm after logging in and then logging out. Looks like maybe
uninitialised pixels being passed to the GPU, unsure about this.

After building git master, installing nouveau_drv.so and restarting X/xdm I can
still see the pixel breakage.

Anyway, I think this bug can be closed now since the fonts and PGRAPH_ERROR
things are fixed, thanks heaps!

BTW, the Debian partition on the machine is for development, so if you need me
to try anything on it, please let me know
(http://bonedaddy.net/pabs3/about/#contact).

BTW, during testing the git master driver, I saw some "Bad page state in
process 'Xorg'" messages on the console, the kernel printed a backtrace too:

Bad page state in process 'Xorg'
page:c1000000 flags:0x00000400 mapping:00000000 mapcount:0 count:0
Trying to fix it up, but a reboot is needed
Backtrace:
Pid: 5881, comm: Xorg Not tainted 2.6.26-1-686 #1
 [<c015a2e0>] bad_page+0x4d/0x74
 [<c015a711>] free_hot_cold_page+0x58/0x170
 [<ee92e21f>] agp_generic_destroy_page+0x3a/0x52 [agpgart]
 [<ee92e95e>] agp_free_memory+0x8a/0xac [agpgart]
 [<eea96240>] drm_agp_free_memory+0xb/0x13 [drm]
 [<eea937ca>] drm_free_agp+0x5/0xe [drm]
 [<eea914dc>] drm_lastclose+0x150/0x31b [drm]
 [<c01750f3>] __fput+0x8a/0x135
 [<c0165794>] remove_vma+0x25/0x43
 [<c016586c>] exit_mmap+0xba/0xd3
 [<c01206e2>] mmput+0x20/0x7e
 [<c0124ff2>] do_exit+0x1e5/0x5c9
 [<c012543a>] do_group_exit+0x64/0x8d
 [<c0103853>] sysenter_past_esp+0x78/0xb1
 =======================


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
