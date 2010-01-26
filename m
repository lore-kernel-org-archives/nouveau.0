From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26193] nouveau falls back to NoAccel on 9400M
Date: Tue, 26 Jan 2010 00:34:20 -0800 (PST)
Message-ID: <20100126083420.A236D1300BD@annarchy.freedesktop.org>
References: <bug-26193-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26193-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26193





--- Comment #11 from Brian Tarricone <bjt23-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org>  2010-01-26 00:34:19 PST ---
Ok, I did some printf()ing, and found out at least part of what's failing. 
Hopefully this is useful.  Call stack looks something like this (with some of
the actual args passed:

libdrm.so:drmCommandWrite(fd, DRM_NOUVEAU_GEM_CPU_PREP, ...)
libdrm_nouveau.so:nouveau_bo_wait(bo, 0x8, 0, 0)
libdrm_nouveau.so:nouveau_bo_map_range(bo, 0, 65536, 0x0c)
libdrm_nouveau.so:nouveau_bo_map()
libdrm_nouveau.so:nouveau_channel_alloc()
nouveau_drv.so:NVInitDma()
[etc.]

And drmCommandWrite() returns -EBUSY.

I poked around in the drm kernel module, but that's where things get a little
weird.  I found nouveau_gem_ioctl_cpu_prep(), and added a printk() at the top,
but I never see any output in dmesg.  So then I added some in
drm_drv.c:drm_ioctl(), but even *that* doesn't seem to be called.  Not sure
what's going on there.  I'm probably misunderstanding something.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
