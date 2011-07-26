From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39530] Also after installing Obermayrs drm-nouveau
 driver booting succeeds only with nomodeset
Date: Tue, 26 Jul 2011 07:49:24 -0700 (PDT)
Message-ID: <20110726144924.92647130105@annarchy.freedesktop.org>
References: <bug-39530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39530

--- Comment #3 from Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> 2011-07-26 07:49:24 PDT ---
Lee, most of the packages shipped by Johannes Obermayr are just git versions.

If you look at the first part of
https://bugs.freedesktop.org/show_bug.cgi?id=39498#c22 (Comment 22 of the
severe issue I was experiencing and that I have now sorted out), you would
realize that in particular:

- xorg driver xf86-video-nouveau shipped by openSUSE as from jobermayr is
exactly or basically the same source code as upstream git;

- libdrm is exactly or basically the same source code as upstream libdrm git;

- the drm kernel modules (20110721.2009-2.3) use the build option
CONFIG_DRM_NOUVEAU_KMS=y, which as far as I remember was set to 'n' in the
Makefile from the Nouveau DRM wiki (although I did also try enabling that once
on the git source without achieving anything): in any case I did not touch the
kernel module, still using the already mentioned one from freedesktop snapshot;

In my particular case, the difference was probably made by using the Mesa build
options from Johannes Obermayr:

jobermayr: --enable-dri --enable-glx --enable-osmesa
--with-dri-drivers=i810,i915,i965,nouveau,swrast --enable-shared-dricore
--enable-gles1 --enable-gles2 --enable-openvg --enable-shared-glapi
--with-gallium-drivers=i915,i965,nouveau,svga,swrast --enable-xcb --enable-xorg
--enable-xa --enable-gallium-egl --with-egl-platforms=x11,drm --enable-debug
--with-x --enable-gallium-llvm --enable-gbm --enable-gallium-gbm
--enable-gallium-g3dvl --enable-xvmc --enable-vdpau --enable-texture-float
--with-egl-displays=x11,drm

instead of: --enable-selinux -with-dri-drivers=nouveau,i915,swrast
--with-gallium-drivers=nouveau,i915,swrast,svga

But I need to check it properly and understand which one of those several
options did the trick.

Let's get to your nomodeset issue. My understanding as someone whom is not an
expert at all, is that starting the framebuffer console during initial boot-up
before X starts, creates problems.

All I can think of is the following mandatory drm kernel parameters:

CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_FRAMEBUFFER_CONSOLE (Nouveau wiki reccomends setting it to 'y', but is
also says that modeset=0 is equivalent to deactivating that option)

Did you go through the following:

http://nouveau.freedesktop.org/wiki/KernelModeSetting ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
