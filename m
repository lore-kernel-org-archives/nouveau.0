From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53101] Fedora 17 "PFIFO - playlist update failed" on
	boot
Date: Tue, 21 Aug 2012 19:23:43 +0000
Message-ID: <bug-53101-8800-9K8IBuoek0@http.bugs.freedesktop.org/>
References: <bug-53101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-53101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53101

--- Comment #5 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2012-08-21 19:23:43 UTC ---
Bisection rounds testing successful suspend/resume cycles on NVC0/2000M:
note:
* gdm greeter is showing garbage (screen content from before reboot) somewhere
before the last known good commits
** this issue was ignored and still present in the last good commit but is not
the topic of this bug

$ git bisect log
# bad: [f9b495fca46836a6a05cedde8058ccb8a3e62c3d] drm/nouveau: use
ioread32_native/iowrite32_native for fifo control registers
# good: [f887c425f9eeed8ffbca64c8be45da62b07096c0] drm/nouveau: bump version to
1.0.0
git bisect start 'HEAD' 'f887c425f9eeed8ffbca64c8be45da62b07096c0' '--'
'drivers/gpu/drm/nouveau/'
# bad: [9bd0c15fcfb42f6245447c53347d65ad9e72080b] drm/nouveau/fbcon: using
nv_two_heads is not a good idea
git bisect bad 9bd0c15fcfb42f6245447c53347d65ad9e72080b
# good: [5132f37700210740117f5163b5df7aa1c8469a55] drm/nve0/fifo: initial
implementation
git bisect good 5132f37700210740117f5163b5df7aa1c8469a55
# bad: [71af5e62db5d7d6348e838d0f79533653e2f8cfe] drm/nv50/gr: make sure
NEXT_TO_CURRENT is executed even if nothing done
git bisect bad 71af5e62db5d7d6348e838d0f79533653e2f8cfe
# good: [afada5e0bb3cac8530c2ae36aa0abca41d60e063] drm/nv04/disp: disable
vblank interrupts when disabling display
git bisect good afada5e0bb3cac8530c2ae36aa0abca41d60e063
# bad: [5e120f6e4b3f35b741c5445dfc755f50128c3c44] drm/nouveau/fence: convert to
exec engine, and improve channel sync
git bisect bad 5e120f6e4b3f35b741c5445dfc755f50128c3c44
# good: [35bcf5d55540e47091a67e5962f12b88d51d7131] drm/nouveau: move
flip-related channel setup to software engine
git bisect good 35bcf5d55540e47091a67e5962f12b88d51d7131
# good: [d375e7d56dffa564a6c337d2ed3217fb94826100] drm/nouveau/fence: minor api
changes for an upcoming rework
git bisect good d375e7d56dffa564a6c337d2ed3217fb94826100


5e120f6e4b3f35b741c5445dfc755f50128c3c44 is the first bad commit
commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Apr 30 13:55:29 2012 +1000

    drm/nouveau/fence: convert to exec engine, and improve channel sync

    Now have a somewhat simpler semaphore sync implementation for nv17:nv84,
    and a switched to using semaphores as fences on nv84+ and making use of
    the hardware's >= acquire operation.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 8f2ca4ddf4969c75f688a96fdb152e449fda4852
da67a1bd8d608577e659a26715cf8af3644d8efe M    drivers

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
