From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10920] New: glxgears on AGP 10de0028 NV5 [RIVA
	TNT2/TNT2 Pro] works! (but slowly)
Date: Fri, 11 May 2007 20:54:49 -0700 (PDT)
Message-ID: <bug-10920-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10920

           Summary: glxgears on AGP 10de0028 NV5 [RIVA TNT2/TNT2 Pro] works!
                    (but slowly)
           Product: xorg
           Version: 7.2
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


ubuntu 7.04

drm: e4d163d81ad7ce46af43cf84485dc96c4cb22b1f Allow vblank interrupts to remain 
mesa: 6bae7d40f725be24df0be196fbb6bdcfd2aaa581 r300: Removed the name argument
xf86-video-nouveau: 7af7d95eb8826fa3fb9914a8c6ad4b6f4867095e Import from nv

glxgears-nouveau-gnome
X connection to :0.0 broken (explicit kill or server shutdown).

266 frames in 6.0 seconds = 44.372 FPS
226 frames in 5.9 seconds = 38.226 FPS
226 frames in 5.9 seconds = 38.225 FPS
226 frames in 6.5 seconds = 34.906 FPS
226 frames in 5.9 seconds = 38.230 FPS
226 frames in 5.9 seconds = 38.238 FPS

glxgears-nvidia-gnome (nvidia driver 1.0.7184 ubuntu package nvidia-glx-legacy)
X connection to :0.0 broken (explicit kill or server shutdown).

3197 frames in 5.0 seconds = 639.376 FPS
3171 frames in 5.0 seconds = 634.016 FPS
3198 frames in 5.0 seconds = 639.473 FPS
3200 frames in 5.0 seconds = 639.835 FPS
3196 frames in 5.0 seconds = 639.020 FPS
3158 frames in 5.0 seconds = 631.525 FPS


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
