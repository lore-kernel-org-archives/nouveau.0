From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25952] GeForce 9800 GTX - nouveau_init takes ~ 1
 minute to complete
Date: Sat,  9 Jan 2010 04:10:57 -0800 (PST)
Message-ID: <20100109121057.31A7A130085@annarchy.freedesktop.org>
References: <bug-25952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25952





--- Comment #7 from bugs.freedesktop.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org  2010-01-09 04:10:56 PST ---
nv92.ctx{prog,val} exist in /lib/firmware/nouveau/; which is also included in
my initcpio:

cat /boot/kernel26.img | gunzip | cpio -t | grep nouveau

/lib/firmware/nouveau
/lib/firmware/nouveau/nvac.ctxvals
/lib/firmware/nouveau/nvac.ctxprog
/lib/firmware/nouveau/nvaa.ctxvals
/lib/firmware/nouveau/nvaa.ctxprog
/lib/firmware/nouveau/nva8.ctxvals
/lib/firmware/nouveau/nva8.ctxprog
/lib/firmware/nouveau/nva5.ctxvals
/lib/firmware/nouveau/nva5.ctxprog
/lib/firmware/nouveau/nva0.ctxvals
/lib/firmware/nouveau/nva0.ctxprog
/lib/firmware/nouveau/nv98.ctxvals
/lib/firmware/nouveau/nv98.ctxprog
/lib/firmware/nouveau/nv96.ctxvals
/lib/firmware/nouveau/nv96.ctxprog
/lib/firmware/nouveau/nv94.ctxvals
/lib/firmware/nouveau/nv94.ctxprog
/lib/firmware/nouveau/nv92.ctxvals
/lib/firmware/nouveau/nv92.ctxprog
/lib/firmware/nouveau/nv86.ctxvals
/lib/firmware/nouveau/nv86.ctxprog
/lib/firmware/nouveau/nv84.ctxvals
/lib/firmware/nouveau/nv84.ctxprog
/lib/firmware/nouveau/nv50.ctxvals
/lib/firmware/nouveau/nv50.ctxprog
/lib/modules/2.6.32-ARCH/kernel/drivers/video/nouveau.ko

So why does the module not find it? And if the problem really is caused by
this, maybe the bug should be moved to the archlinux tracker?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
