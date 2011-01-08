From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32864] wayland "libEGL warning: failed to create DRM
	screen"
Date: Sat,  8 Jan 2011 12:52:12 -0800 (PST)
Message-ID: <20110108205212.BF99113004D@annarchy.freedesktop.org>
References: <bug-32864-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32864-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32864

--- Comment #9 from Darxus <darxus-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org> 2011-01-08 12:52:11 PST ---
The wayland compositor is now starting, but shows up as a completely garbled
apparently random chunk of video memory.  

Output:


$ ~/wayland/wayland/compositor/compositor 
libEGL debug: added /usr/lib/egl/egl_gallium.so to module array
libEGL debug: added /usr/lib/egl/egl_dri2.so to module array
libEGL debug: added /usr/lib/egl/egl_glx.so to module array
libEGL debug: dlopen(/usr/lib/egl/egl_gallium.so)
libEGL info: use DRM for display 0x5
libEGL debug: searching for pipe module nouveau
libEGL debug: loaded /usr/lib/egl/pipe_nouveau.so
libEGL debug: Failed to get KMS resources.  Disable modeset.
libEGL debug: the best driver is Gallium (score 100)
libEGL debug: searching for st module GLESv2
libEGL debug: loaded /usr/lib/egl/st_GLESv2.so
nv50_screen_get_param:162 -  Unknown PIPE_CAP 11
XDG_RUNTIME_DIR not set, falling back to .
using socket ./wayland-0
Mesa: User error: GL_INVALID_FRAMEBUFFER_OPERATION in glClear(incomplete
framebuffer)

Mesa git commit: 6a102074bb30e44273e999ee8cdd2afbfbc4e333

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
