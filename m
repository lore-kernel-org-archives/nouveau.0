From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35930] New: flickering in many OpenGL applications
	with Compiz
Date: Sun,  3 Apr 2011 08:53:17 -0700 (PDT)
Message-ID: <bug-35930-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35930

           Summary: flickering in many OpenGL applications with Compiz
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: plombex342-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When using Compiz with Nouveau on an NVA5 (GeForce GT 330M), there is an effect
which can best be described as "flickering".  It does not happen with Metacity,
and I'm not sure whether it happens with compositing window managers other than
Compiz.

In the main menus of both SuperTux 0.3.3 and SuperTuxKart, it appears as
flickering menu and sprite textures.  In Alien Arena, when the game is paused,
it looks like parts of the 3D scene are "bleeding through" the pause menu in
some frames.  I've done a lot of investigation into the causes and symptoms of
this issue in the past few days, so please bear with me as I explain what I've
found.

My initial theory was that things were being drawn in the wrong order, causing,
for example, the SuperTux background to be drawn over the menu.  I later found
this not to be the case, since inserting a manual glFlush() after drawing each
sprite in SuperTux 0.3.3 made no difference.  This theory also couldn't explain
why the textures at the bottom of the screen flicker much more often in the
SuperTux 0.3.3 credits, or why the main menu of SuperTux 0.1.3 (with OpenGL
enabled) is unaffected.

I then remembered that all of the affected games were rendering on top of a
previous buffer, and realized that the issue is that the window manager is
displaying buffers before the rendering into them is finished.

After some investigation, I've confirmed that the renderer is being properly
flushed by glXSwapBuffers, and that calling glFinish() right before swapping
the buffers makes no difference.

So my current theory is that one of the following is happening:
* SwapBuffers, using page flipping, is swapping to the wrong buffer - the one
that is about to be rendered into (sounds unlikely, and I'm unsure of whether
it's possible with DRI2 for such an issue to affect only one driver)
* glFlush and glFinish (nv50_flush/nouveau_fence_wait) are not doing their job
properly (more likely)

I believe these adequately explain the following symptoms I'm experiencing:
* flickering textures in SuperTux 0.3.3 (the background is rendered before the
sprites, menu, etc.)
* why the SuperTux 0.1.3 main menu is unaffected in OpenGL mode (it has a very
slow framerate)
* why the issue went away in SuperTux 0.3.3 when I introduced a manual delay of
30 milliseconds after each buffer swap
* why parts of the 3D scene in Alien Arena sometimes "bleed through" the pause
screen
* why the sprites at the bottom of the screen flicker more often in the
SuperTux credits (they are rendered from top to bottom)
* why glFlush and glFinish do not make a difference

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
