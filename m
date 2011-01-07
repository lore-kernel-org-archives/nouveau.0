From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32864] wayland "libEGL warning: failed to create DRM
	screen"
Date: Thu,  6 Jan 2011 20:21:11 -0800 (PST)
Message-ID: <20110107042111.94D36130051@annarchy.freedesktop.org>
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

--- Comment #6 from Darxus <darxus-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org> 2011-01-06 20:21:11 PST ---
I no-longer believe this is fixed.  84ebd8e2d7b13cf43069a2b79168cf7a1df02b71 is
giving me the same "failed to create DRM screen" error as I had been getting. 
Don't know why I thought it was fixed.

6a102074bb30e44273e999ee8cdd2afbfbc4e333 still works.
997f84ff4efb62779a19f6bd0441cbae1b7bad70 still doesn't work.

This (and my previous report of it working) is on a different card:

$ lspci | grep -i vga
05:00.0 VGA compatible controller: nVidia Corporation G92 [GeForce 8800 GT]
(rev a2)

(The latest commit is also not working:
6d9ca78ef7bf831b9b63f4bda68623cbae627508 )

Also, strace shows pipe_nouveau.so being opened, it just doesn't get mentioned
in the output.

Full output:

$ ~/wayland/wayland/compositor/compositor 
libEGL debug: EGL search path is /home/darxus/install/lib/egl
libEGL debug: added /home/darxus/install/lib/egl/egl_gallium.so to module array
libEGL debug: added /home/darxus/install/lib/egl/egl_dri2.so to module array
libEGL debug: added /home/darxus/install/lib/egl/egl_glx.so to module array
libEGL debug: dlopen(/home/darxus/install/lib/egl/egl_gallium.so)
libEGL info: use DRM for display 0x5
libEGL debug: searching for pipe module nouveau
libEGL warning: failed to create DRM screen
libEGL debug: EGL user error 0x3001 (EGL_NOT_INITIALIZED) in eglInitialize(no
usable display)

libEGL debug: dlopen(/home/darxus/install/lib/egl/egl_dri2.so)
libEGL debug: EGL user error 0x3003 (EGL_BAD_ALLOC) in DRI2: failed to get
driver name

libEGL debug: dlopen(/home/darxus/install/lib/egl/egl_glx.so)
libEGL debug: EGL user error 0x3001 (EGL_NOT_INITIALIZED) in eglInitialize

failed to initialize display
failed to create compositor

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
