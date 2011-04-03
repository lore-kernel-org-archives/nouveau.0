From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35562] Nouveau fails to link in Mesa 7.10.1
Date: Sat,  2 Apr 2011 17:16:27 -0700 (PDT)
Message-ID: <20110403001627.0736F13000C@annarchy.freedesktop.org>
References: <bug-35562-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35562-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35562

--- Comment #2 from nello martuscielli <ppc.addon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-04-02 17:16:26 PDT ---
the build error:

make[3]: Entering directory
`/tmp/mesa3d/src/Mesa-7.10.1/src/gallium/targets/dri-nouveau'
gcc -c -I. -I../../../../src/mesa/drivers/dri/common -Iserver
-I../../../../include -I../../../../include/GL/internal -I../../../../src/mapi
-I../../../../src/gallium/include -I../../../../src/gallium/auxiliary
-I../../../../src/gallium/drivers -I../../../../src/gallium/winsys
-I../../../../src/mesa -I../../../../src/mesa/main -I../../../../src/mesa/math
-I../../../../src/mesa/transform -I../../../../src/mesa/shader
-I../../../../src/mesa/swrast -I../../../../src/mesa/swrast_setup
-I../../../../src/egl/main -I../../../../src/egl/drivers/dri
-I/usr/include/libdrm    -O3 -mcpu=7450 -mabi=altivec -fsigned-char
-fomit-frame-pointer -ftree-loop-linear -ftree-loop-distribution -fpeel-loops
-floop-interchange -floop-strip-mine -floop-block -fgraphite-identity
-floop-parallelize-all -Wall -Wmissing-prototypes -std=c99 -ffast-math
-fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_PPC_ASM -DUSE_VMX_ASM
-D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DGLX_USE_TLS -DPTHREADS
-DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING
-DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XCB_DRI2 -DHAVE_LIBUDEV
-DHAVE_XEXTPROTO_71 -DGALLIUM_RBUG -DGALLIUM_TRACE target.c -o target.o
/bin/sh ../../../../bin/mklib -o nouveau_dri.so.tmp -noprefix -linker 'g++'
-ldflags ' -lstdc++' \
    target.o ../../../../src/mesa/drivers/dri/common/utils.o
../../../../src/mesa/drivers/dri/common/vblank.o
../../../../src/mesa/drivers/dri/common/dri_util.o
../../../../src/mesa/drivers/dri/common/xmlconfig.o  
../../../../src/gallium/state_trackers/dri/drm/libdridrm.a
../../../../src/gallium/winsys/nouveau/drm/libnouveaudrm.a
../../../../src/gallium/drivers/trace/libtrace.a
../../../../src/gallium/drivers/rbug/librbug.a
../../../../src/gallium/drivers/nvfx/libnvfx.a
../../../../src/gallium/drivers/nv50/libnv50.a
../../../../src/gallium/drivers/nouveau/libnouveau.a \
                -Wl,--start-group ../../../../src/mesa/libmesagallium.a
../../../../src/gallium/auxiliary/libgallium.a -Wl,--end-group \
                   -ldrm   -lexpat -lm -lpthread -ldl -ldrm_nouveau   
mklib: Making Linux shared library:  nouveau_dri.so.tmp
g++ -O3 -mcpu=7450 -mabi=altivec -fsigned-char -fomit-frame-pointer
-ftree-loop-linear -ftree-loop-distribution -fpeel-loops -floop-interchange
-floop-strip-mine -floop-block -fgraphite-identity -floop-parallelize-all -Wall
-Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden
-fno-strict-aliasing  -fPIC  -DUSE_PPC_ASM -DUSE_VMX_ASM -D_GNU_SOURCE
-DPTHREADS -DHAVE_POSIX_MEMALIGN -DGLX_USE_TLS -DPTHREADS
-DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING
-DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XCB_DRI2 -DHAVE_LIBUDEV
-DHAVE_XEXTPROTO_71 -o nouveau_dri.so.test
../../../../src/mesa/drivers/dri/common/dri_test.o nouveau_dri.so.tmp   -ldrm  
-lexpat -lm -lpthread -ldl -ldrm_nouveau    -lstdc++;
nouveau_dri.so.tmp: undefined reference to `BIND_RING'
nouveau_dri.so.tmp: undefined reference to `BEGIN_RING_NI'
nouveau_dri.so.tmp: undefined reference to `BEGIN_RING'
collect2: ld returned 1 exit status
make[3]: *** [nouveau_dri.so] Error 1
make[3]: Leaving directory
`/tmp/mesa3d/src/Mesa-7.10.1/src/gallium/targets/dri-nouveau'
make[2]: *** [default] Error 1
make[2]: Leaving directory `/tmp/mesa3d/src/Mesa-7.10.1/src/gallium/targets'
make[1]: *** [subdirs] Error 1
make[1]: Leaving directory `/tmp/mesa3d/src/Mesa-7.10.1/src'
make: *** [default] Error 1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
