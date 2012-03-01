From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46810] New: Mesa Failing To Build
Date: Thu, 01 Mar 2012 09:26:53 +0000
Message-ID: <bug-46810-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46810

             Bug #: 46810
           Summary: Mesa Failing To Build
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org


Hi all,
      I'm currently running Fedora 17 Alpha. My Graphics Card is a Nvidia GTX
560 with 1Gb of memory.

I've pulled the latest commits from the Mesa git repository this morning.

I did a gmake -B realclean and used autogen.sh with the following options:

 ./autogen.sh --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib
--includedir=/usr/include --with-dri-drivers=
--with-gallium-drivers=swrast,nouveau --enable-debug --enable-texture-float
--disable-asm --enable-opengl --disable-gles2 --disable-openvg
--enable-texture-float --disable-asm --enable-opengl --disable-gles2
--disable-openvg --enable-dri --enable-glx --enable-xvmc --disable-va
--disable-vdpau --disable-osmesa --disable-egl --disable-xorg --disable-d3d1x
--disable-xa --disable-gbm --disable-xlib-glx --disable-gallium-egl
--disable-gallium-gbm --disable-gallium-llvm --enable-driglx-direct
--enable-glx-tls --enable-glu

Mesa configured correctly,but when I issued gmake -j3, the following error
showed up:

RING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1
-DIN_DRI_DRIVER -DHAVE_ALIAS -I../../include -I../../src/glsl -I../../src/mesa
-I../../src/mapi -I../../src/gallium/include -I../../src/gallium/auxiliary  -g
-O2 -Wall -fno-strict-aliasing -fno-builtin-memcmp -g  -fPIC  -D_GNU_SOURCE
-DPTHREADS -DDEBUG -DTEXTURE_FLOAT_ENABLED -DHAVE_POSIX_MEMALIGN -DUSE_XCB
-DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DPTHREADS
-DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS -DUSE_DRICORE
mklib: Making Linux shared library:  ../../lib/libdricore.so
mklib: Installing ../../lib/libdricore.so in ../../lib
mv: `../../lib/libdricore.so' and `../../lib/libdricore.so' are the same file
gmake[3]: Entering directory `/home/steve/mesa/src/mesa/drivers'
gmake[4]: Entering directory `/home/steve/mesa/src/mesa/drivers/dri'
gmake[5]: Entering directory `/home/steve/mesa/src/mesa/drivers/dri'
gmake[5]: Nothing to be done for `all-am'.
gmake[5]: Leaving directory `/home/steve/mesa/src/mesa/drivers/dri'
gmake[4]: Leaving directory `/home/steve/mesa/src/mesa/drivers/dri'
gmake[3]: Leaving directory `/home/steve/mesa/src/mesa/drivers'
gmake[2]: Leaving directory `/home/steve/mesa/src/mesa'
gmake[2]: Entering directory `/home/steve/mesa/src/glx'
  CCLD   libGL.la

*** Warning: Linking the shared library libGL.la against the
*** static library ../mapi/glapi/libglapi.a is not portable!
gcc: error: .libs/clientattrib.o: No such file or directory
gcc: error: .libs/clientinfo.o: No such file or directory
gcc: error: .libs/compsize.o: No such file or directory
gcc: error: .libs/create_context.o: No such file or directory
gcc: error: .libs/eval.o: No such file or directory
gcc: error: .libs/glxconfig.o: No such file or directory
gcc: error: .libs/glxcmds.o: No such file or directory
gcc: error: .libs/glxcurrent.o: No such file or directory
gcc: error: .libs/glx_error.o: No such file or directory
gcc: error: .libs/glxext.o: No such file or directory
gcc: error: .libs/glxextensions.o: No such file or directory
gcc: error: .libs/indirect_glx.o: No such file or directory
gcc: error: .libs/indirect.o: No such file or directory
gcc: error: .libs/indirect_init.o: No such file or directory
gcc: error: .libs/indirect_size.o: No such file or directory
gcc: error: .libs/indirect_window_pos.o: No such file or directory
gcc: error: .libs/indirect_texture_compression.o: No such file or directory
gcc: error: .libs/indirect_transpose_matrix.o: No such file or directory
gcc: error: .libs/indirect_vertex_array.o: No such file or directory
gcc: error: .libs/indirect_vertex_program.o: No such file or directory
gcc: error: .libs/pixel.o: No such file or directory
gcc: error: .libs/pixelstore.o: No such file or directory
gcc: error: .libs/render2.o: No such file or directory
gcc: error: .libs/renderpix.o: No such file or directory
gcc: error: .libs/single2.o: No such file or directory
gcc: error: .libs/singlepix.o: No such file or directory
gcc: error: .libs/vertarr.o: No such file or directory
gcc: error: .libs/xfont.o: No such file or directory
gcc: error: .libs/glx_pbuffer.o: No such file or directory
gcc: error: .libs/glx_query.o: No such file or directory
gcc: error: .libs/drisw_glx.o: No such file or directory
gcc: error: .libs/dri_common.o: No such file or directory
gcc: error: .libs/dri_glx.o: No such file or directory
gcc: error: .libs/XF86dri.o: No such file or directory
gcc: error: .libs/glxhash.o: No such file or directory
gcc: error: .libs/dri2_glx.o: No such file or directory
gcc: error: .libs/dri2.o: No such file or directory
gcc: error: .libs/applegl_glx.o: No such file or directory
gmake[2]: *** [libGL.la] Error 1
gmake[2]: Leaving directory `/home/steve/mesa/src/glx'
gmake[1]: *** [subdirs] Error 1
gmake[1]: Leaving directory `/home/steve/mesa/src'
gmake: *** [default] Error 1

THe reason I was compiling was because I was enjoying about 600 fps and now
it's dropped down to around 200 fps, admittedly I was going to temporary
install the akmod-nvidia driver,but I was having nothing but problems trying to
install it.

Anyway, I hope you'll be able to find the cause of the error.
Regards,
        STEVE555

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
