From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15792] nv04 (TNT2) video blitter problem.
Date: Sat,  3 May 2008 12:14:14 -0700 (PDT)
Message-ID: <20080503191416.582002DC002@annarchy.freedesktop.org>
References: <bug-15792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15792





--- Comment #8 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>  2008-05-03 12:14:13 PST ---
ops, this is possible what Destination pixmap (even if it just fullscreen 
video window) MUST be in video memory, allocated at startup? Because i found
workaround #4: increase vram size, available for EXA  in nv_driver.c:


--------
#if !NOUVEAU_EXA_PIXMAPS                                                        
        if (nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM | NOUVEAU_BO_PIN,          
                0, (pNv->VRAMPhysicalSize / 4) * 3, &pNv->FB)) {  
--------

now it reported:

(--) NOUVEAU(0): Virtual size is 1152x1152 (pitch 1152)
....
(II) NOUVEAU(0): Allocated 12MiB VRAM for framebuffer + offscreen pixmaps


and  everything work fine!

full log (with some home-made debug noise) will be attached


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
