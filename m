From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
	GeForce FX 5200 crashes X
Date: Fri, 15 Jun 2007 02:56:58 -0700 (PDT)
Message-ID: <20070615095659.2294613006D@annarchy.freedesktop.org>
References: <bug-10858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10858





------- Comment #27 from mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-06-15 02:56 PST -------
As at;

drm 84bea383538df83c049680497ba2179e50d07ca3
xf86-video-nouveau d59fbb4725602c409beee4ab96dca1eab5d73b2a
mesa f6963f57d9d1e9bf630c05c1c89f188091b12fc5

if I load the blob first and run glxgears with the blob, before shutting X down
uninstalling the blob loading nouveau, setting meas paths and then trying
glxgears then I get;

careym@angus:~$ glxgears
libGL warning: 3D driver claims to not support visual 0x8a
************************************INFO***********************************
File nouveau_fifo.c function nouveauFifoInit line 138
Fifo init ok. Using context 1
***************************************************************************
do_wait: drmWaitVBlank returned -1, IRQs don't seem to be working correctly.
Try running with LIBGL_THROTTLE_REFRESH and LIBL_SYNC_REFRESH unset.
3099 frames in 5.0 seconds = 619.664 FPS
3147 frames in 5.0 seconds = 629.332 FPS
3149 frames in 5.0 seconds = 629.606 FPS
3148 frames in 5.0 seconds = 629.493 FPS
3146 frames in 5.0 seconds = 629.015 FPS
3143 frames in 5.0 seconds = 628.588 FPS
3146 frames in 5.0 seconds = 629.107 FPS

unfortunately for me this is just a black window with no gears drawn.  However
it is progress as X doesnt crash anymore!! (kudos jkolb see TiNDC21)

If I dont load the blob first then X crashes, will attach kern.log


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
