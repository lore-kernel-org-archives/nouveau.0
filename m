From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35609] Mesa DRI fails to build for nouveau
Date: Wed, 23 Mar 2011 18:33:48 -0700 (PDT)
Message-ID: <20110324013348.9544013004E@annarchy.freedesktop.org>
References: <bug-35609-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35609-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35609

--- Comment #1 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2011-03-23 18:33:48 PDT ---
(In reply to comment #0)
> Created an attachment (id=44772)
 View: https://bugs.freedesktop.org/attachment.cgi?id=44772
 Review: https://bugs.freedesktop.org/review?bug=35609&attachment=44772

> Here's a one-line patch that makes it build for me.
> 
> I am using the latest mesa (commit 81992010b57e5b137c9319b47f282e267a086582).
> 
> I am configuring it with:
> ####################################################
> 
> ./configure --prefix=/usr --build=x86_64-pc-linux-gnu
> --host=x86_64-pc-linux-gnu --mandir=/usr/share/man --infodir=/usr/share/info
> --datadir=/usr/share --sysconfdir=/etc --localstatedir=/var/lib
> --libdir=/usr/lib64 --enable-shared-dricore --disable-option-checking
> --with-driver=dri --disable-glut --without-demos --enable-xcb --disable-debug
> --enable-glw --enable-motif --enable-glx-tls --disable-asm
> --with-dri-drivers=,swrast,i810,i915,i965,nouveau,r600 --enable-gallium
> --with-state-trackers=glx,dri,egl,vega --enable-gallium-llvm --enable-gles1
> --enable-gles2 --enable-gles-overlay --disable-gallium-svga
> --enable-gallium-nouveau --enable-gallium-i915 --enable-gallium-i965
> --enable-gallium-radeon --enable-gallium-r600 --enable-gallium-i915
> --enable-gallium-i965 --enable-gallium-radeon --enable-gallium-r600
> 
> ####################################################
> 
> The error is:
> 
> ####################################################
> 
> x86_64-pc-linux-gnu-gcc -c -I. -I../../../../../src/mesa/drivers/dri/common
> -Iserver -I../../../../../include -I../../../../../src/mapi
> -I../../../../../src/mesa -I../../../../../src/egl/main
> -I../../../../../src/egl/drivers/dri -I/usr/include/libdrm    -g -O2 -Wall
> -Wmissing-prototypes -std=c99 -ffast-math -fno-strict-aliasing  -fPIC  
> -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_XCB -DGLX_USE_TLS
> -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING
> -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XCB_DRI2 -DHAVE_LIBUDEV
> -DXCB_DRI2_CONNECT_DEVICE_NAME_BROKEN -DGALLIUM_LLVMPIPE
> -D__STDC_CONSTANT_MACROS -DHAVE_LLVM=0x0208 -DUSE_DRICORE  nouveau_screen.c -o
> nouveau_screen.o
> In file included from nouveau_screen.c:27:0:
> nouveau_driver.h:41:28: fatal error: nouveau_device.h: No such file or
> directory
> compilation terminated.
> gmake[6]: *** [nouveau_screen.o] Error 1
> 
> ####################################################
> 
> 
> It looks like commit d1e28b22673777fe1290cda899abf73aad02e4aa
> (http://cgit.freedesktop.org/mesa/mesa/commit/?id=d1e28b22673777fe1290cda899abf73aad02e4aa)
> doesn't allow the CFLAGS set in the dri/nouveau/Makefile to be respected and I
> guess it needs to be updated to LIBDRM_CFLAGS.
> 
> Am I the only one who is experiencing this?

Hm, this doesn't make much sense to me. Did you remember to run "autogen.sh"
and "configure" after that commit?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
