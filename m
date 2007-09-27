From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12582] Crash on GeForce 7300 SE
Date: Thu, 27 Sep 2007 15:59:23 -0700 (PDT)
Message-ID: <20070927225923.451FF13006F@annarchy.freedesktop.org>
References: <bug-12582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12582





------- Comment #5 from panov-ABcqYfMUPmYZY0rY4shWHijHesifYMBh@public.gmane.org  2007-09-27 16:00 PST -------
Without nvidiafb linux kernel did not hang. By the way other drm modules (ati)
can work simultaneously with framebuffer. 

After start there were artifacts on a screen, moving of cursor or windows
caused changes in the artifacts. 2D speed was (for example moving a window in
KDE) much lower than for "nv" driver. xdriinfo displayed nouveau driver,
glxinfo showed direct rendering. Start of glxgears opened black window, screen
was locked (no reaction on mouse or keyboard), then after several seconds X
crashed.

After that /var/log/messages has following:

Sep 27 18:31:44 darkstar kernel: [drm] Allocating FIFO number 0
Sep 27 18:31:44 darkstar kernel: [drm] nouveau_fifo_alloc: initialised FIFO 0
Sep 27 18:31:44 darkstar kernel: [drm] Allocating FIFO number 1
Sep 27 18:31:44 darkstar kernel: [drm] nouveau_fifo_alloc: initialised FIFO 1
Sep 27 18:31:58 darkstar kernel: [drm] Allocating FIFO number 2
Sep 27 18:31:58 darkstar kernel: [drm] nouveau_fifo_alloc: initialised FIFO 2
Sep 27 18:31:58 darkstar kernel: [drm] nouveau_fifo_free: freeing fifo 2
Sep 27 18:32:22 darkstar kernel: [drm] Allocating FIFO number 2
Sep 27 18:32:22 darkstar kernel: [drm] nouveau_fifo_alloc: initialised FIFO 2
Sep 27 18:32:28 darkstar kernel: [drm] nouveau_fifo_free: freeing fifo 1
Sep 27 18:32:28 darkstar kernel: [drm] nouveau_fifo_free: freeing fifo 2
Sep 27 18:32:28 darkstar kernel: [drm] nouveau_fifo_free: freeing fifo 0

and /var/log/syslog:

Sep 27 18:32:22 darkstar kernel: [drm:nouveau_pgraph_irq_handler] *ERROR*
PGRAPH error interrupt
Sep 27 18:32:22 darkstar kernel: [drm:nouveau_graph_dump_trap_info] *ERROR*
nSource: DATA_ERROR, nStatus: BAD_ARGUMENT
Sep 27 18:32:22 darkstar kernel: [drm:nouveau_graph_dump_trap_info] *ERROR*
Channel 2/0 (class 0x0062) - Method 0x0304, Data 0x00000000:0x15e004c0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
